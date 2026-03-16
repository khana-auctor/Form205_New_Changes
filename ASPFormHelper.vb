Imports System.IO
Imports System.Xml
Imports KDOT.InfoPath.Common
Imports DOTForm0205.Form.Constants
Imports CommonClass
Imports System.Xml.Xsl
Imports System.Xml.XPath
Imports System.Collections
Imports FlowWright.cDevDeAPI
Imports FlowWright.cDevDecisionEngine
Imports System.Web

Public Class ASPFormHelper
    'Session variables - cookieless so exist for each occurance
    'xmlFileName, FormID, errorlist, FormXML, MessageShown, ReviewActions

    Protected Friend doc As XmlDocument
    Protected Friend FormXML As New XmlDocument
    Protected Friend _KDOTFormClass As New KDOTFormClass
    Protected Friend isFirstLoad As Boolean = "true"
    Protected Friend saveMessageData As String = Nothing
    Protected Friend CurrentTaskName As String = Nothing
    Protected Friend fieldsDefaultSize As New Hashtable
    Protected Friend isFormNew As New Boolean
    Protected Friend TestMode As New Boolean
    Protected Friend TestUser As String = Nothing
    Protected Friend RefID As String = Nothing
    Protected Friend AssignedToUserId As String = Nothing
    Protected Friend DistrictNum As String = Nothing
    Protected Friend AreaNum As String = Nothing
    Protected Friend SubAreaNum As String = Nothing
    Protected Friend EffectiveUserid As String = Nothing
    ' Protected Friend SerialNumber As String = Nothing
    Protected Friend txtActualUser As String = Nothing
    Protected Friend Originator As String = Nothing
    Protected Friend xml1 As New XmlDataSource
    Protected Friend Supervisor As String = Nothing
    Protected Friend SupervisorSharpNum As String = Nothing
    Protected Friend SeniorManager As String = Nothing
    Protected Friend ReviewAction As String = Nothing
    Protected Friend LoadorSave As String = Nothing
    Protected Friend isSuccessfulSubmit As Boolean
    Protected Friend Session_ID As String
    Protected Friend AllocatedUser As String = Nothing

    Private ReadOnly Property InstanceId As String
        Get
            Dim ctx = HttpContext.Current
            If ctx Is Nothing Then Return "no-http"

            Const cacheKey As String = "ASPFormHelper.InstanceId"
            Dim cached = TryCast(ctx.Items(cacheKey), String)
            If Not String.IsNullOrEmpty(cached) Then Return cached

            ' 1) Prefer a request-scoped instance set by Page_Init (stable across postbacks)
            Dim fromItems = TryCast(ctx.Items("FormInstance"), String)
            If Not String.IsNullOrEmpty(fromItems) Then
                ctx.Items(cacheKey) = fromItems
                Return fromItems
            End If

            ' 2) Optional: if you store it in Session under a known key (NOT namespaced),
            '    you can also read it here. Only do this if you implemented it.
            Dim fromSession = TryCast(ctx.Session("FormInstance"), String)
            If Not String.IsNullOrEmpty(fromSession) Then
                ctx.Items(cacheKey) = fromSession
                Return fromSession
            End If

            ' 3) Fallback (only safe if FormInstance.GetOrCreate is stable)
            Dim p = TryCast(ctx.CurrentHandler, System.Web.UI.Page)
            Dim id As String = If(p Is Nothing, "no-page", FormInstance.GetOrCreate(p))

            ctx.Items(cacheKey) = id
            Return id
        End Get
    End Property


    Private Function SKey(baseKey As String) As String
        Return $"{baseKey}:{InstanceId}"
    End Function

    Public Property SessionFormXml As String
        Get
            Return CStr(HttpContext.Current.Session(SKey("FormXML")))
        End Get
        Set(value As String)
            HttpContext.Current.Session(SKey("FormXML")) = value
        End Set
    End Property

    Public Property IsPrintPreview As Boolean
        Get
            Dim o = HttpContext.Current.Session(SKey("PrintPreview"))
            Return o IsNot Nothing AndAlso CBool(o)
        End Get
        Set(value As Boolean)
            HttpContext.Current.Session(SKey("PrintPreview")) = value
        End Set
    End Property
    Public Function ExecuteCommonStartupTasks() As Boolean
        'Set initial variables
        txtActualUser = CStr(HttpContext.Current.Session("txtActualUser"))

        ' ---------------------------------------------
        ' Resolve taskId once (do NOT rely on global Session("taskID"))
        ' ---------------------------------------------
        Dim taskId As String = Nothing

        If Not String.IsNullOrEmpty(HttpContext.Current.Request.QueryString("taskID")) Or Not String.IsNullOrEmpty(ConfigurationManager.AppSettings("TestTaskID")) Then
            'Check for taskID
            If Not String.IsNullOrEmpty(HttpContext.Current.Request.QueryString("taskID")) Then
                taskId = HttpContext.Current.Request.QueryString("taskID")
            Else
                taskId = ConfigurationManager.AppSettings("TestTaskID")
            End If

            ' Persist per-instance taskId (namespaced)
            HttpContext.Current.Session(SKey("taskID")) = taskId

            'Get FlowWright task info
            Dim oDesign As deDesign = Nothing
            Dim oRuntime As deRuntime = Nothing
            Dim connStr As String = ConfigurationManager.ConnectionStrings("FlowWright_Connection").ConnectionString

            oDesign = New deDesign(connStr, txtActualUser)
            oRuntime = New deRuntime(oDesign.getUserSession())
            Dim oTask As deTask = oRuntime.getTask(taskId)
            Dim oInst As deWorkflowInstance = oTask.getInstance()

            RefID = oInst.instanceName
            System.Web.HttpContext.Current.Session(SKey("FormID")) = RefID
            AssignedToUserId = oDesign.getUser(oTask.taskOwnerID).externalUserID
            TestUser = oDesign.getUser(oTask.taskAssignedTo).externalUserID
            CurrentTaskName = oTask.taskName

            'To get the view if there is one to replace _KDOTFormClass.DefaultView = HttpContext.Current.Request.QueryString("View")
            Dim stepID As String = oTask.stepID
            Dim oModel As clsUIModel = oInst.getUIModel(False)
            Dim oTaskFigure As clsFigure = oModel.getFigure(stepID)
            If Not String.IsNullOrEmpty(oTaskFigure.getProperty("pageview")) Then
                _KDOTFormClass.DefaultView = oTaskFigure.getProperty("pageview")
            Else
                _KDOTFormClass.DefaultView = _KDOTFormClass.theDefaultView
            End If
            'Sample of how to get a variable  Dim myProjNum As String = oModel.getMasterVariable(“ProjectNumber”).varValue
            '**********************************************************
            'Get xml for form
            Dim myws As New Miscellaneous.Miscellaneous
            Dim myStr As String = myws.GetXMLFromFW(RefID)
            ' Session-backed working copy MUST be instance-scoped (via SessionFormXml property)
            SessionFormXml = myStr
            UpdateXMLDocument("isFormNew", "false")
            UpdateXMLDocument("txtActualUser", txtActualUser)
            UpdateXMLDocument("CurrentTaskName", CurrentTaskName)
            'TODO: This should be done by FW    UpdateXMLDocument("FormFileNETId", K2Proc.DataFields("WFS_Doc_ID").Value)

            'Get Actions for task
            Dim theActions As List(Of String) = Nothing
            theActions = oTask.getTaskChoices()
            Dim actionString As String = Nothing
            For Each action In theActions
                actionString = actionString & ";" & action
            Next
            HttpContext.Current.Session("ReviewActions") = Mid(actionString, 2)

            'Loads the xml data into the form ********************
            doc = New XmlDocument
            doc.LoadXml(SessionFormXml)
            Dim root2 As XmlElement = doc.DocumentElement
            Dim nl2 As XmlNodeList = root2.ChildNodes()
            LoadXMLData(nl2)
        Else
            If Not String.IsNullOrEmpty(HttpContext.Current.Request.QueryString("TestMode")) Then
                TestMode = HttpContext.Current.Request.QueryString("TestMode")
            Else
                TestMode = ConfigurationManager.AppSettings("DefaultTestMode")
            End If
            _KDOTFormClass.DefaultView = _KDOTFormClass.theDefaultView


            If Not String.IsNullOrEmpty(HttpContext.Current.Request.QueryString("UserID")) Then
                TestUser = HttpContext.Current.Request.QueryString("UserID")
            ElseIf Not String.IsNullOrEmpty(ConfigurationManager.AppSettings("TestUser")) Then
                TestUser = ConfigurationManager.AppSettings("TestUser")
            Else
                TestUser = txtActualUser
            End If
            AssignedToUserId = TestUser
        End If

        If Not String.IsNullOrEmpty(taskId) Then
            If isWorkItemLocked() Then
                Return False
            End If
        End If
        'Processes for either existing worklist item or a new one
        If Not String.IsNullOrEmpty(taskId) Then
            isFormNew = False
            'Set Messages if needed
            If Not String.IsNullOrEmpty(GetXMLValue("Messages")) Then
                System.Web.HttpContext.Current.Session("MessageShown") = "false"
                saveMessageData = GetXMLValue("Messages")
            End If
        Else 'or process a new worklist item
            File.AppendAllText(myLog, "Starting New Form " & Now() & vbCrLf)
            Originator = txtActualUser
            CurrentTaskName = WorkflowStepNames.InitiateForm0205
            Dim myMiscWS As New Miscellaneous.Miscellaneous
            System.Web.HttpContext.Current.Session(SKey("FormID")) = GetNextRefNumber()
            FormXML.LoadXml(My.Resources.sampledata.ToString)
            isFormNew = "true"
            HttpContext.Current.Session("ReviewActions") = _KDOTFormClass.DefaultActions
            SessionFormXml = FormXML.InnerXml
            System.Web.HttpContext.Current.Session("xmlFileName") = myXMLFiles & System.Web.HttpContext.Current.Session(SKey("FormID")) & "_00.xml"
            UpdateXMLDocument("Folio", CStr(System.Web.HttpContext.Current.Session(SKey("FormID"))))
            UpdateXMLDocument("FormId", CStr(System.Web.HttpContext.Current.Session(SKey("FormID"))))
            UpdateXMLDocument("TestMode", TestMode)
            UpdateXMLDocument("Originator", Originator)
            UpdateXMLDocument("isFormNew", "true")
            UpdateXMLDocument("txtActualUser", txtActualUser)
            UpdateXMLDocument("CurrentTaskName", CurrentTaskName)
            If (TestMode) Then
                EffectiveUserid = TestUser
            Else
                EffectiveUserid = Originator
            End If
            UpdateXMLDocument("EffectiveUserId", EffectiveUserid)
            If Not VerifyUserCanInitiateForm() Then
                Return False
            End If
        End If
        UpdateXMLDocument("AllocatedUser", AllocatedUser)
        ' If existing locked then it updates with information, if new then adds to the backuptask smartbox table
        If Not String.IsNullOrEmpty(taskId) Then
            If Not CheckItemStatus(taskId, AllocatedUser) Then
                Return False
            End If
        Else
            CheckItemStatus(taskId, EffectiveUserid)
        End If
        UpdateXMLDocument("doValidate", "true")
        UpdateXMLDocument("AssignedToUserId", AssignedToUserId)

        Return True
    End Function

    Public Function GetNextRefNumber() As String
        Dim myMiscWS As New Miscellaneous.Miscellaneous
        Dim theFormID As String = Nothing
        theFormID = myMiscWS.GetNextRefNumber()
        Return theFormID
    End Function

    Public Sub ReleaseCurrentTask()
        Dim _aspFormHelper As New ASPFormHelper
        Dim oRuntime As deRuntime = Nothing
        Dim oDesign As deDesign = Nothing


        Dim taskId As String = HttpContext.Current.Request.QueryString("taskID")
        If String.IsNullOrEmpty(taskId) Then
            taskId = TryCast(HttpContext.Current.Session(SKey("taskID")), String)
        End If

        ' If we still don't have a task, don't crash
        If String.IsNullOrEmpty(taskId) Then Exit Sub

        Dim connStr As String = ConfigurationManager.ConnectionStrings("FlowWright_Connection").ConnectionString
        oDesign = New deDesign(connStr, _aspFormHelper.GetXMLValue("txtActualUser"))
        oRuntime = New deRuntime(oDesign.getUserSession())

        Dim oTask As deTask = oRuntime.getTask(taskId)

        If oTask IsNot Nothing Then
            Try : oTask.unLockTask() : Catch : End Try
            Try : oTask.reAssignToOwner() : Catch : End Try
        End If

        Dim myLabel As New Label
        myLabel = HttpContext.Current.Session("myPage").FindControl("lblJavaScript")
        myLabel.Text = "<script language='javascript'>window.open('" & ConfigurationManager.AppSettings("FWWorklistURL") & "','_self','',true);window.close();</script>"

        Dim myws3 As New Maintenance.Maintenance
        myws3.ReleaseWI2(System.Web.HttpContext.Current.Session(SKey("FormID")), taskId)

        ' Optional: only remove if it matches what we used (prevents nuking another tab’s task)
        If String.Equals(TryCast(HttpContext.Current.Session(SKey("taskID")), String), taskId, StringComparison.OrdinalIgnoreCase) Then
            HttpContext.Current.Session.Remove(SKey("taskID"))
        End If
    End Sub

    Public Function isWorkItemLocked() As Boolean
        Dim myWS As New Maintenance.Maintenance
        Dim result As String = myWS.isWorkItemLocked(HttpContext.Current.Session(SKey("taskID")))
        If Not String.IsNullOrEmpty(result) Then
            result = "Worklist item is locked by " & result
            Dim myLabel As New Label
            myLabel = HttpContext.Current.Session("myPage").FindControl("lblJavaScript")
            myLabel.Text = "<script type='text/javascript'>WorklistItemLocked(""" & result & """ );</script>"
            Return True
        Else
            Return False
        End If
    End Function
    Public Function CheckItemStatus(ByVal SN As String, ByVal AllocatedUser As String) As Boolean
        Dim myWS As New Maintenance.Maintenance
        Dim result As String = myWS.UpdateSessionStatus(System.Web.HttpContext.Current.Session(SKey("taskID")), Session_ID, System.Web.HttpContext.Current.Session(SKey("FormID")), isFormNew, AllocatedUser, txtActualUser, _KDOTFormClass.FormName)
        If result.ToLower = "true" Then
            Return True
        Else
            Dim myLabel As New Label
            myLabel = HttpContext.Current.Session("myPage").FindControl("lblJavaScript")
            myLabel.Text = "<script type='text/javascript'>WorklistItemLocked(""" & result & """ );</script>"
            Return False
        End If
    End Function
    Public Sub LoadAttachments()
        Dim myUCAttach As New UCAttachments
        myUCAttach = HttpContext.Current.Session("myPage").FindControl("UCAttachments1")
        Dim delBtn As New Button
        delBtn = myUCAttach.FindControl("cmdDeleteAttachment")
        Dim CurrentAttach As New DropDownList
        CurrentAttach = myUCAttach.FindControl("CurrentAttachment")
        Dim attachlist() As Miscellaneous.AttachmentClass = Nothing
        Dim attach As Miscellaneous.AttachmentClass = Nothing
        Dim myWs As New Miscellaneous.Miscellaneous
        Dim ViewLink As New HyperLink

        attachlist = myWs.GetAttachmentsfromSMOBox(System.Web.HttpContext.Current.Session(SKey("FormID")))
        For Each attach In attachlist
            If _KDOTFormClass.SetCurrentUserSecurity Then GrantCurrentUserAccessOnBaseAttachment(attach.OnBaseDocHandle) 'Grants current user access to the attachments when loaded
            CurrentAttach.Items.Add(New ListItem(attach.FileName, attach.OnBaseDocHandle))
        Next
        If CurrentAttach.Items.Count > 0 Then
            CurrentAttach.Text = CurrentAttach.Items(0).Text
            ViewLink = myUCAttach.FindControl("ViewLink")
            ViewLink.NavigateUrl = ConfigurationManager.AppSettings("OnBaseViewerURL") & "&docid=" & CurrentAttach.SelectedValue
            ViewLink.Enabled = "true"
            delBtn.Enabled = "true"
        Else
            CurrentAttach.Text = Nothing
        End If

        UpdateXMLDocument("AttachmentCount", attachlist.Count.ToString)
    End Sub

    Public Sub LoadXMLData(ByVal nodes As XmlNodeList)
        LoadorSave = "Load"
        'read thru nodelist and set form field value to node.innertext
        For Each node As XmlNode In nodes
            Try
                If (node.ChildNodes.Count > 1) Then
                    RecurseXML(node.ChildNodes)
                ElseIf node.ChildNodes.Count = 1 Then
                    If node.FirstChild.NodeType = XmlNodeType.Element Then
                        If node.FirstChild.HasChildNodes Then
                            RecurseXML(node.FirstChild.ChildNodes)
                        Else
                            SetFormFields(node.FirstChild)
                        End If

                    Else
                        SetFormFields(node)
                    End If
                Else
                    'This is a low level node
                    SetFormFields(node)
                End If
            Catch ex As Exception
                MsgBox("Error in LoadXMLData: " & ex.StackTrace & "Node=" & node.Name)
            End Try
        Next
    End Sub

    Public Sub SetFormFields(ByRef mynode As XmlNode)
        'Sets the fields on the form from the xml document
        Dim myControlTB As New TextBox
        Dim myControlChk As New CheckBox
        Dim myControlRBL As New RadioButtonList
        Dim myControlRB As New RadioButton
        Dim myControlDD As New DropDownList
        Dim newObj As New Object
        Dim objFlag As Boolean = False
        Dim myNodeName As String
        Try
            'If mynode.Name = "txtServerBeingRepl" Or mynode.Name = "txtDBMSSig" Then
            '    Dim test As String = Nothing
            'End If
            'We have to have a control for each different control type
            newObj = New Object
            myControlChk = New CheckBox
            myControlTB = New TextBox
            myControlRBL = New RadioButtonList
            myControlRB = New RadioButton
            myControlDD = New DropDownList

            myNodeName = mynode.Name
            myNodeName = Replace(myNodeName, "", "")
            newObj = HttpContext.Current.Session("myPage").FindControl(myNodeName)
            Try
                If newObj Is Nothing Then
                    objFlag = "true"
                End If
            Catch
                objFlag = False
            End Try
            'TODO: Need to add rest of the types
            If objFlag = False Then
                If String.IsNullOrEmpty(mynode.InnerText) Then
                    'skip
                ElseIf myNodeName = "CurrentTaskName" Then
                    'Skip - it is loaded from K2 activity
                ElseIf newObj.GetType() Is GetType(System.Web.UI.WebControls.Panel) Then
                    'skip
                ElseIf newObj.GetType() Is GetType(System.Web.UI.WebControls.TextBox) Then
                    UpdateXMLDocument(myNodeName, mynode.InnerText)
                    myControlTB = HttpContext.Current.Session("myPage").FindControl(myNodeName)
                    If (Not myControlTB Is Nothing) Then
                        myControlTB.Text = mynode.InnerText
                        If isFirstLoad = "true" Then
                            Dim mySize As String = myControlTB.Width.ToString
                            If String.IsNullOrEmpty(mySize) Then
                                mySize = "255"
                            Else
                                mySize = Mid(mySize, 1, Len(mySize) - 2)
                            End If
                            fieldsDefaultSize.Add(myNodeName, mySize)
                        End If
                    End If
                ElseIf newObj.GetType() Is GetType(System.Web.UI.WebControls.CheckBox) Then
                    UpdateXMLDocument(myNodeName, mynode.InnerText)
                    myControlChk = HttpContext.Current.Session("myPage").FindControl(myNodeName)
                    If (Not myControlChk Is Nothing) Then
                        myControlChk.Checked = mynode.InnerText
                    End If
                ElseIf newObj.GetType() Is GetType(System.Web.UI.WebControls.RadioButtonList) Then
                    UpdateXMLDocument(myNodeName, mynode.InnerText)
                    myControlRBL = HttpContext.Current.Session("myPage").FindControl(myNodeName)
                    If (Not myControlRBL Is Nothing) Then
                        myControlRBL.SelectedValue = mynode.InnerText
                    End If
                ElseIf newObj.GetType() Is GetType(System.Web.UI.WebControls.RadioButton) Then
                    UpdateXMLDocument(myNodeName, mynode.InnerText)
                    myControlRB = HttpContext.Current.Session("myPage").FindControl(myNodeName)
                    If (Not myControlRB Is Nothing) Then
                        myControlRB.Checked = mynode.InnerText
                    End If
                ElseIf newObj.GetType() Is GetType(System.Web.UI.WebControls.DropDownList) Then
                    UpdateXMLDocument(myNodeName, mynode.InnerText)
                    myControlDD = HttpContext.Current.Session("myPage").FindControl(myNodeName)
                    If (Not myControlDD Is Nothing) Then
                        myControlDD.SelectedValue = mynode.InnerText
                    End If
                End If
            End If
        Catch ex As Exception
            File.AppendAllText(myLog, "Error in SetFormFields:" & mynode.Name & "-" & ex.Message & vbCrLf)
        End Try
    End Sub

    Public Sub SetPageFields()
        Dim myUCSubmit As New UCSubmit
        myUCSubmit = HttpContext.Current.Session("myPage").FindControl("UCSubmit1")
        'Set the form fields from the FormXML document
        FormXML.InnerXml = SessionFormXml

        Dim root2 As XmlElement = FormXML.DocumentElement
        Dim nl2 As XmlNodeList = Nothing
        nl2 = root2.ChildNodes()
        LoadXMLData(nl2)
        Dim myObj As New Object

        Dim myUCAttach As New UCAttachments
        myUCAttach = HttpContext.Current.Session("myPage").FindControl("UCAttachments1")

        Try
            If Not _KDOTFormClass.SupportsAttachments Then 'Form doesn't support attachments
                myUCAttach.Visible = False
            Else

                myObj = myUCAttach.FindControl("CurrentAttachment")
                If myObj Is Nothing Then
                    'skip loading attachments
                Else
                    LoadAttachments()
                End If
            End If
        Catch
            'skip attachments not on view
        End Try

        Dim myTextBox As New TextBox
        myTextBox = HttpContext.Current.Session("myPage").FindControl("CurrentTaskName")
        If myTextBox Is Nothing Then
            'skip
        Else
            myTextBox.Text = GetXMLValue("CurrentTaskName")
        End If

        Try
            Dim myActions() As String = HttpContext.Current.Session("ReviewActions").ToString.Split(";")
            Dim myNewList As New DropDownList
            myNewList = myUCSubmit.FindControl("ReviewAction")
            myNewList.Items.Clear()
            Dim z As Integer = 0
            For z = 0 To myActions.Count - 1
                myNewList.Items.Add(myActions(z))
            Next
        Catch
            'skip not contained on view
        End Try

        Dim myHeader As New UCHeader
        myHeader = HttpContext.Current.Session("myPage").FindControl("UCHeader1")
        If Not myHeader Is Nothing Then
            Dim myButton As New Button
            myButton = myHeader.FindControl("ReleaseButton")
            If GetXMLValue("isFormNew") = "true" Then
                myButton.Visible = False
            Else
                myButton.Visible = "true"
            End If
            myButton = myHeader.FindControl("cmdPrintPreview")
            myButton.Visible = _KDOTFormClass.showPrintPreviewButton
        End If
    End Sub

    Public Sub GetFormFields(ByRef mynode As XmlNode)
        'Gets the updated form fields and puts them in the xml document
        Dim myControlTB As New TextBox
        Dim myControlChk As New CheckBox
        Dim myControlRB As New RadioButton
        Dim myControlRBL As New RadioButtonList
        Dim myControlDD As New DropDownList
        Dim newObj As New Object
        Dim objFlag As Boolean = False
        Dim myNodeName As String = Replace(mynode.Name, "", "")
        Try
            'We have to have a control for each different control type
            newObj = New Object
            myControlChk = New CheckBox
            myControlTB = New TextBox
            myControlRBL = New RadioButtonList
            myControlRB = New RadioButton
            myControlDD = New DropDownList
            newObj = HttpContext.Current.Session("myPage").FindControl(Mid(myNodeName, 4))
            Try
                If newObj = Nothing Then
                    Select Case Mid(mynode.Name, 4)
                        Case "Originator"
                            mynode.InnerText = Originator
                            objFlag = "true"
                        Case "DistrictNum"
                            mynode.InnerText = DistrictNum
                            objFlag = "true"
                        Case "AreaNum"
                            mynode.InnerText = AreaNum
                            objFlag = "true"
                        Case "SubareaNum"
                            mynode.InnerText = SubAreaNum
                            objFlag = "true"
                        Case "EffectiveUserId"
                            mynode.InnerText = EffectiveUserid
                            objFlag = "true"
                        'Case "K2ActionName"
                        '    mynode.InnerText = ReviewAction
                        '    objFlag = "true"
                        Case "TestMode"
                            mynode.InnerText = TestMode
                            objFlag = "true"
                        Case "AttachmentCount"
                            myControlDD = HttpContext.Current.Session("myPage").FindControl("CurrentAttachment")
                            mynode.InnerText = myControlDD.Items.Count.ToString
                            objFlag = "true"
                        Case Else
                            mynode.InnerText = GetXMLValue(myNodeName)
                            objFlag = "true"
                    End Select
                End If
            Catch
                objFlag = False
            End Try
            'TODO: Need to set rest of the types
            If objFlag = False Then
                If newObj.GetType() Is GetType(System.Web.UI.WebControls.TextBox) Then
                    myControlTB = HttpContext.Current.Session("myPage").FindControl(myNodeName)
                    If (Not myControlTB Is Nothing) Then
                        mynode.InnerText = myControlTB.Text
                    End If
                ElseIf newObj.GetType() Is GetType(System.Web.UI.WebControls.CheckBox) Then
                    myControlChk = HttpContext.Current.Session("myPage").FindControl(myNodeName)
                    If (Not myControlChk Is Nothing) Then
                        mynode.InnerText = myControlChk.Checked
                    End If
                ElseIf newObj.GetType() Is GetType(System.Web.UI.WebControls.RadioButtonList) Then
                    myControlRBL = HttpContext.Current.Session("myPage").FindControl(myNodeName)
                    If (Not myControlRBL Is Nothing) Then
                        mynode.InnerText = myControlRBL.Text
                    End If
                ElseIf newObj.GetType() Is GetType(System.Web.UI.WebControls.RadioButton) Then
                    myControlRB = HttpContext.Current.Session("myPage").FindControl(myNodeName)
                    If (Not myControlRB Is Nothing) Then
                        mynode.InnerText = myControlRB.Checked
                    End If
                ElseIf newObj.GetType() Is GetType(System.Web.UI.WebControls.DropDownList) Then
                    myControlDD = HttpContext.Current.Session("myPage").FindControl(myNodeName)
                    If (Not myControlDD Is Nothing) Then
                        mynode.InnerText = myControlDD.SelectedValue
                    End If
                End If
            End If
        Catch ex As Exception
            File.AppendAllText(myLog, "Error in GetFormFields: " & myNodeName & ":" & ex.Message & vbCrLf)
        End Try
    End Sub

    Public Sub RecurseXML(ByVal nodes As XmlNodeList)
        For Each node As XmlNode In nodes
            If (node.ChildNodes.Count > 1) Then
                RecurseXML(node.ChildNodes)
            ElseIf node.ChildNodes.Count = 1 Then
                If node.FirstChild.NodeType = XmlNodeType.Element Then
                    If LoadorSave = "Load" Then
                        If node.FirstChild.HasChildNodes Then
                            RecurseXML(node.FirstChild.ChildNodes)
                        Else
                            SetFormFields(node.FirstChild)
                        End If

                    Else
                        node.FirstChild.InnerText = GetXMLValue(Mid(node.FirstChild.Name, 4))
                    End If
                Else
                    If LoadorSave = "Load" Then
                        SetFormFields(node)
                    Else 'LoadOrSave=Save
                        node.InnerText = GetXMLValue(Mid(node.Name, 4))
                    End If
                End If
            Else
                If LoadorSave = "Load" Then
                    SetFormFields(node)
                Else 'LoadOrSave=Save
                    node.InnerText = GetXMLValue(Mid(node.Name, 4))
                End If
            End If
        Next
    End Sub

    Public Sub ProcessWFItem(ByVal xmlDoc As XmlDocument)
        Dim oDesign As deDesign = Nothing
        Dim oRuntime As deRuntime = Nothing
        Dim connStr As String = ConfigurationManager.ConnectionStrings("FlowWright_Connection").ConnectionString

        oDesign = New deDesign(connStr, GetXMLValue("txtActualUser"))
        oRuntime = New deRuntime(oDesign.getUserSession())
        Dim oTask As deTask = oRuntime.getTask(HttpContext.Current.Session(SKey("taskID")))
        Try
            Dim WFParms As New Hashtable
            WFParms.Add("ReviewAction", GetXMLValue("ReviewAction"))
            WFParms.Add("TestMode", GetXMLValue("TestMode"))
            WFParms.Add("UpdatedXML", SessionFormXml)
            If Not String.IsNullOrEmpty(GetXMLValue("ConsultUser")) Then
                WFParms.Add("ConsultUser", oDesign.getWorkflowUserIDFromExternalUserName(GetXMLValue("ConsultUser")))
            Else
                WFParms.Add("ConsultUser", "")
            End If

            If Not String.IsNullOrEmpty(GetXMLValue("DelegateUser")) Then
                WFParms.Add("DelegateUser", oDesign.getWorkflowUserIDFromExternalUserName(GetXMLValue("DelegateUser")))
            Else
                WFParms.Add("DelegateUser", "")
            End If

            _KDOTFormClass.SetProcessLevelFields(WFParms, GetXMLValue("CurrentTaskName"))

            Dim dummyHT As New Hashtable
            Dim result As Boolean = oTask.completeTask(GetXMLValue("ReviewAction"), "", WFParms, dummyHT)
            UpdateXMLDocument("isSuccessfulSubmit", result)
            If Not result Then
                Dim successMsg As String = Nothing
                successMsg = "There was an error while submitting the form. Please save your work and try submitting at a later time."
                MsgBox(successMsg)
            End If
        Catch ex As Exception
            File.AppendAllText(myLog, "Exception: " & ex.StackTrace & "Error=" & ex.Message & vbCrLf)
            MsgBox("Error submitting the workflow item. Please contact the RWM Support Team")
            UpdateXMLDocument("isSuccessfulSubmit", "false")
        End Try
    End Sub

    Public Sub StartingNewWF(ByVal XMLDoc As XmlDocument)
        Try
            Dim oDesign As deDesign = Nothing
            Dim oRuntime As deRuntime = Nothing
            Dim connStr As String = ConfigurationManager.ConnectionStrings("FlowWright_Connection").ConnectionString
            Dim WFParms As New Hashtable
            WFParms.Add("ProcessFolio", System.Web.HttpContext.Current.Session(SKey("FormID")))
            WFParms.Add("ReviewAction", GetXMLValue("ReviewAction"))
            WFParms.Add("TestMode", GetXMLValue("TestMode"))
            WFParms.Add("UpdatedXML", SessionFormXml)
            If Not String.IsNullOrEmpty(GetXMLValue("ConsultUser")) Then
                WFParms.Add("ConsultUser", oDesign.getWorkflowUserIDFromExternalUserName(GetXMLValue("ConsultUser")))
            Else
                WFParms.Add("ConsultUser", "")
            End If

            If Not String.IsNullOrEmpty(GetXMLValue("DelegateUser")) Then
                WFParms.Add("DelegateUser", GetXMLValue("DelegateUser"))
            Else
                WFParms.Add("DelegateUser", "")
            End If

            _KDOTFormClass.SetProcessLevelFields(WFParms, GetXMLValue("CurrentTaskName"))
            File.AppendAllText(myLog, "Ready to kickoff FW workflow. EffectiveUserId: " & GetXMLValue("EffectiveUserId") & " txtActualUser: " & GetXMLValue("txtActualUser") & vbCrLf)
            oDesign = New deDesign(connStr, GetXMLValue("EffectiveUserId")) 'this Is the test user
            Dim oDef As deWorkflowDefinition = oDesign.getDefinitionUsingName(_KDOTFormClass.WorkflowAndFormName)
            Dim oFormOrig As deUser = oDesign.getUserUsingExternalUserName(GetXMLValue("txtActualUser"))  'Form Originator
            Dim oInst As deWorkflowInstance = oDef.createInstance(System.Web.HttpContext.Current.Session(SKey("FormID")))

            Dim result As Boolean = oInst.execute(WFParms,, GetXMLValue("TestMode"), oFormOrig.workflowUserID.ToString())
            UpdateXMLDocument("isSuccessfulSubmit", result)
            If Not result Then
                Dim successMsg As String = Nothing
                successMsg = "There was an error while submitting the form. Please save your work and try submitting at a later time."
                MsgBox(successMsg)
            End If

        Catch ex As Exception
            Dim myMSG As String = "Error StartingNewWF: " & ex.Message & vbCrLf & ex.StackTrace
            File.AppendAllText(myLog, myMSG)
            Dim _aspFormHelper As New ASPFormHelper
            _aspFormHelper.MsgBox(myMSG)
            UpdateXMLDocument("isSuccessfulSubmit", "false")
        End Try
    End Sub
    Public Function SaveXMLData(ByVal nodes As XmlNodeList) As String
        'read thru nodelist and set form field value to node.innertext
        LoadorSave = "Save"
        Dim myXML As String = Nothing
        Dim newNode As XmlNode = Nothing
        For Each node As XmlNode In nodes
            If (node.ChildNodes.Count > 1) Then
                RecurseXML(node.ChildNodes)
            ElseIf node.ChildNodes.Count = 1 Then
                If node.FirstChild.NodeType = XmlNodeType.Element Then
                    If node.FirstChild.HasChildNodes Then
                        RecurseXML(node.FirstChild.ChildNodes)
                    Else
                        node.InnerText = GetXMLValue(Mid(node.Name, 4))
                    End If
                Else
                    node.InnerText = GetXMLValue(Mid(node.Name, 4))
                End If
            Else
                node.InnerText = GetXMLValue(Mid(node.Name, 4))
            End If
            myXML = myXML & node.OuterXml
        Next
        Return myXML
    End Function

    Public Sub ShowMessages()
        Dim myMsgBox As New UCMessageBox
        myMsgBox = HttpContext.Current.Session("myPage").FindControl("UCMessageBox1")
        myMsgBox.Visible = "true"
    End Sub

    Public Sub DoSubmit()
        File.AppendAllText(myLog, "Starting DoSubmit in ASPFormhelper FormID: " & System.Web.HttpContext.Current.Session(SKey("FormID")) & Now() & vbCrLf)
        Dim myWS2 As New OrgDBEmployeeandPosition.OrgDBEmployeeAndPosition
        Dim myMsgBox As New UCMessageBox
        Try
            myMsgBox = HttpContext.Current.Session("myPage").FindControl("UCMessageBox1")
            If (Trim(GetXMLValue("Messages")) <> saveMessageData) And Not String.IsNullOrEmpty(GetXMLValue("Messages")) Then
                Dim myDS As New DataSet
                myDS = myWS2.GetNameandPositionforUserid(GetXMLValue("txtActualUser"))
                Dim myName As String = myDS.Tables(0).Rows(0).Item("FullName")
                If GetXMLValue("Messages").Substring(0, 3) <> ":::" Then
                    UpdateXMLDocument("Messages", ":::" & myName & " " & Now().ToShortDateString & " " & Now().ToShortTimeString & ":::" & vbCrLf & GetXMLValue("Messages"))
                End If
            End If

            Dim myWS As New Miscellaneous.Miscellaneous

            'Process attachments
            Dim myUCAttach As New UCAttachments
            myUCAttach = HttpContext.Current.Session("myPage").FindControl("UCAttachments1")
            Dim _CurrentAttach As New DropDownList
            _CurrentAttach = myUCAttach.FindControl("CurrentAttachment")
            If _CurrentAttach.Items.Count = 0 Or ReviewAction = ActionNames.Cancel Then
                myWS.DeleteOnBaseAttachments(System.Web.HttpContext.Current.Session(SKey("FormID")))
            End If
            'Set isConsult as needed
            Dim UCSubmit As New UCSubmit
            UCSubmit = HttpContext.Current.Session("myPage").FindControl("UCSubmit1")
            Dim DDConsult As New DropDownList
            DDConsult = UCSubmit.FindControl("drpConsultUser")
            ReviewAction = GetXMLValue("ReviewAction")
            If GetXMLValue("IsConsult") = "true" Then
                UpdateXMLDocument("ConsultUser", "")
                UpdateXMLDocument("DelegateUser", "")
                UpdateXMLDocument("IsConsult", "false")
            ElseIf ReviewAction = ActionNames.Consult Then
                UpdateXMLDocument("DelegateUser", "")
                UpdateXMLDocument("ConsultUser", DDConsult.SelectedValue)
                UpdateXMLDocument("IsConsult", "true")
                ' isConsult = true
            ElseIf ReviewAction = ActionNames._Delegate Then
                UpdateXMLDocument("ConsultUser", "")
                UpdateXMLDocument("DelegateUser", DDConsult.SelectedValue)
                UpdateXMLDocument("DelegateActivity", CurrentTaskName)
                UpdateXMLDocument("IsDelegate", "true")
            Else
                UpdateXMLDocument("ConsultUser", "")
                UpdateXMLDocument("DelegateUser", "")
            End If
            UpdateXMLDocWithKeywords()
            Dim myLabel As New Label
            myLabel = HttpContext.Current.Session("myPage").FindControl("lblJavaScript")

            CreateDefaultPdfInfo()
            'Gets the XML document to submit to K1
            Dim finalXMLDocument As New XmlDocument
            finalXMLDocument.InnerXml = SessionFormXml
            Dim newValue As Boolean = True
            If Not String.IsNullOrEmpty(HttpContext.Current.Session(SKey("taskID"))) Then newValue = False
            If Not myWS.SaveXMLToFW(GetXMLValue("FormId"), finalXMLDocument, newValue) Then
                MsgBox("Failed to save the XML.  Please contact the OITS RWM Support Team.")
                UpdateXMLDocument("isSuccessfulSubmit", "false")
            Else
                If String.IsNullOrEmpty(HttpContext.Current.Session(SKey("taskID"))) Then
                    StartingNewWF(finalXMLDocument)
                Else
                    'If GetXMLValue("ReviewAction") = ActionNames.Save Or GetXMLValue("ReviewAction") = ActionNames._Delegate Then
                    '    Dim oDesign As deDesign
                    '    If GetXMLValue("ReviewAction") = ActionNames.Save Then
                    '        oDesign = New deDesign(ConfigurationManager.ConnectionStrings("FlowWright_Connection").ConnectionString, GetXMLValue("txtActualUser"))
                    '    Else
                    '        oDesign = New deDesign(ConfigurationManager.ConnectionStrings("FlowWright_Connection").ConnectionString, GetXMLValue("DelegateUser"))
                    '    End If

                    '    Dim oReAssignUser As deUser = oDesign.getCurrentUser()
                    '    Dim oRuntime As deRuntime = New deRuntime(oDesign.getUserSession())
                    '    Dim oTask As deTask = oRuntime.getTask(HttpContext.Current.Session(Skey("taskID"))
                    '    Dim oInstance As deWorkflowInstance = oTask.getInstance()
                    '    If GetXMLValue("ReviewAction") = ActionNames._Delegate Then
                    '        oTask.reAssignTask(oReAssignUser.workflowUserID.ToString)
                    '    Else 'Save
                    '        oInstance.addToHistory("Work Item has been saved by " & GetXMLValue("txtActualUser") & " on " & Now())
                    '    End If
                    '    UpdateXMLDocument("isSuccessfulSubmit", "true")
                    '    ReleaseCurrentTask()
                    'Else
                    ProcessWFItem(finalXMLDocument)
                    'End If
                End If
            End If
            If GetXMLValue("isSuccessfulSubmit").ToLower = "true" Then
                CreateHTMLFile()
                HttpResponse.RemoveOutputCacheItem("/" & HttpContext.Current.Session("myPage").Title & ".aspx")
                Dim p As Page = TryCast(HttpContext.Current.CurrentHandler, Page)

                If p IsNot Nothing Then
                    ScriptManager.RegisterStartupScript(
        p,
        p.GetType(),
        "SubmitConfirmServer",
        "SubmitConfirmation_Server('" & ConfigurationManager.AppSettings("FWWorklistURL") & "');",
        True
    )
                End If

                'myLabel.Text = "<script type='text/javascript'>SubmitConfirmation('" & ConfigurationManager.AppSettings("FWWorklistURL") & "');</script>"
                Dim myws3 As New Maintenance.Maintenance
                myws3.ReleaseWI2(System.Web.HttpContext.Current.Session(SKey(SKey("FormID"))), HttpContext.Current.Session(SKey("taskID")))

            End If
            ' File.AppendAllText(myLog, "Finished DoSubmit in ASPFormhelper FormID: " & System.Web.HttpContext.Current.Session(Skey("FormID")) & Now() & vbCrLf)
        Catch ex As Exception
            File.AppendAllText(myLog, "Error in DoSubmit in ASPFormhelper FormID: " & System.Web.HttpContext.Current.Session(SKey("FormID")) & Now() & " " & ex.StackTrace & vbCrLf)
            MsgBox("An error has occurred submitting the form.  Please contact the OITS RWM Support Team.")
        End Try
    End Sub

    Public Sub UploadAttachment()
        Dim myDoc As New OnBaseDocumentInfo
        Dim K2Env As String = ConfigurationManager.AppSettings("K2Environment")
        Dim path As String = "\\" & K2Env & "\FileNET File Share\" 'TODO: Use environment variable
        Dim fileOK As Boolean = False

        Dim myUC As New UCAttachments
        myUC = HttpContext.Current.Session("myPage").FindControl("UCAttachments1")

        Dim FileUpload1 As New FileUpload
        FileUpload1 = myUC.FindControl("FileUpload1")

        Dim CurrentAttachment As New DropDownList
        CurrentAttachment = myUC.FindControl("CurrentAttachment")

        Dim ViewLink As New HyperLink
        ViewLink = myUC.FindControl("ViewLink")

        Dim DeleteButton As New Button
        DeleteButton = myUC.FindControl("cmdDeleteAttachment")

        If FileUpload1.HasFile Then
            Dim fileExtension As String
            fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower()
            Dim extensionsNotAllowed As String = _KDOTFormClass.ExcludedAttachmentFileExtensions

            If String.IsNullOrEmpty(extensionsNotAllowed) Then
                fileOK = "true"
            Else
                If InStr(extensionsNotAllowed, fileExtension) > 0 Then
                    fileOK = False
                Else
                    fileOK = "true"
                End If
            End If
            If fileOK Then
                Try
                    Dim docid As String = "0"
                    FileUpload1.SaveAs(path & FileUpload1.FileName)
                    docid = AddAttachment(path & FileUpload1.FileName, myDoc)
                    If IsNumeric(docid) And docid <> "0" Then
                        'AttachmentList.Add(FileUpload1.FileName, docid)
                        CurrentAttachment.Items.Add(New ListItem(FileUpload1.FileName, docid))
                        CurrentAttachment.SelectedValue = docid
                        UpdateXMLDocument("CurrentAttachment", docid)
                        CurrentAttachment.Focus()
                        ViewLink.NavigateUrl = ConfigurationManager.AppSettings("OnBaseViewerURL") & "&docid=" & docid
                        ViewLink.Enabled = "true"
                        DeleteButton.Enabled = "true"
                        MsgBox("File has been successfully uploaded.")
                    Else
                        MsgBox("File could not be uploaded. Please contact the RWM Support team or the IT Service Desk")
                    End If
                    CurrentAttachment.Focus()
                Catch ex As Exception
                    MsgBox("File could not be uploaded. Please contact the RWM Support team or the IT Service Desk")
                End Try
            Else
                MsgBox("Cannot accept files of this type.")
            End If
        End If
    End Sub

    Public Function AddAttachment(ByVal theFileName As String, ByVal myDoc As OnBaseDocumentInfo) As String
        Dim UCAttach As New UCAttachments
        UCAttach = HttpContext.Current.Session("myPage").FindControl("UCAttachments1")
        Dim attach As New DropDownList
        attach = UCAttach.FindControl("CurrentAttachment")
        Dim obService As New OnBase1.OnBase_Service
        _KDOTFormClass.GetDocumentProperties(myDoc)
        Dim myKeywords(myDoc.DocumentProperties.Count) As String
        Dim myKeywordValues(myDoc.DocumentProperties.Count) As String
        Dim idx As New Integer
        Dim docid As String = Nothing
        Dim defaultErrorMsg As String = "The attachment did not get attached to the form.  " &
              "Save and Submit the form or close the form if no data has changed and try to add the attachment at a later time." &
              vbCrLf & vbCrLf & "Contact the RWM group about this problem by sending an e-mail to KDOT#IT.RWMTeam."
        Try
            For idx = 0 To myDoc.DocumentProperties.Count - 1
                If myDoc.DocumentProperties(idx).Name = DocumentPropertyNames.Title Then
                    myDoc.DocumentProperties(idx).Value = myDoc.DocumentProperties(idx).Value & " Attachment #" & attach.Items.Count + 1
                End If
                myKeywords(idx) = myDoc.DocumentProperties(idx).Name
                myKeywordValues(idx) = myDoc.DocumentProperties(idx).Value
            Next
            docid = obService.OnBaseAddDirect(myDoc.DocumentType, myKeywords, myKeywordValues, theFileName)
            If docid = 0 Then
                MsgBox(defaultErrorMsg)
            Else
                AddAttachmenttoSMO(docid, theFileName)
                If _KDOTFormClass.SetCurrentUserSecurity Then GrantCurrentUserAccessOnBaseAttachment(docid)
            End If
            Return docid
        Catch ex As Exception
            MsgBox("Add attachment error: " & ex.Message)
            Return 0
        End Try
    End Function
    Public Function UpdateXMLDocWithKeywords()
        Dim myDoc As New OnBaseDocumentInfo
        _KDOTFormClass.GetDocumentProperties(myDoc)
        Dim myFileNetKeywords As String = Nothing
        Dim myFileNetKeywordValues As String = Nothing
        Dim idx As New Integer
        Try
            For idx = 0 To myDoc.DocumentProperties.Count - 1
                myFileNetKeywords = myFileNetKeywords & ";" & myDoc.DocumentProperties(idx).Name
                myFileNetKeywordValues = myFileNetKeywordValues & ";" & myDoc.DocumentProperties(idx).Value
            Next
            myFileNetKeywords = Mid(myFileNetKeywords, 2)
            myFileNetKeywordValues = Mid(myFileNetKeywordValues, 2)
            UpdateXMLDocument("FileNetKeywords", myFileNetKeywords)
            UpdateXMLDocument("FileNetKeywordValues", myFileNetKeywordValues)
            UpdateXMLDocument("FormDocumentType", myDoc.DocumentType)
        Catch ex As Exception
            MsgBox("Add attachment error: " & ex.Message)
            Return 0
        End Try
    End Function
    Private Sub AddAttachmenttoSMO(ByVal docid As String, ByVal fileName As String)
        Dim myWS As New Miscellaneous.Miscellaneous
        Dim myAttach As New Miscellaneous.AttachmentClass
        Try
            myAttach.FileName = Mid(fileName, InStrRev(fileName, "\") + 1)
            myAttach.FormName = _KDOTFormClass.FormName
            myAttach.OnBaseDocHandle = docid
            myAttach.ReferenceID = System.Web.HttpContext.Current.Session(SKey("FormID"))
            myWS.AddAttachtoSMOBox(myAttach)
        Catch ex As Exception
            MsgBox("Error occurred adding the attachment to the SMO:" & ex.Message)
        End Try
    End Sub

    Private Function GrantCurrentUserAccessOnBaseAttachment(ByVal docId As String) As Boolean
        Dim mySvc As New OnBase1.OnBase_Service
        Dim result As String = mySvc.OnBaseModifySecurity(docId, GetXMLValue("txtActualUser"), UserGroupCode.User, AccessLevel.Viewer)
        If result.ToLower <> "true" Then
            MsgBox("Error granting access to attachment.")
            Return False
        Else
            Return "true"
        End If
    End Function

    Public Sub DeleteCurrentAttachment(ByVal DocId As String)
        Dim obService As New OnBase1.OnBase_Service
        Dim myWS As New Miscellaneous.Miscellaneous
        Dim result As String = Nothing
        Try
            Dim myUC As New UCAttachments
            myUC = HttpContext.Current.Session("myPage").FindControl("UCAttachments1")

            Dim myAttach As New DropDownList
            myAttach = myUC.FindControl("CurrentAttachment")

            Dim ViewLink As New HyperLink
            ViewLink = myUC.FindControl("ViewLink")

            Dim DeleteButton As New Button
            DeleteButton = myUC.FindControl("cmdDeleteAttachment")

            If (Not myAttach Is Nothing) Then
                result = obService.OnBaseDeleteDocument(DocId)
                If result Then
                    Dim delAttach As New Miscellaneous.AttachmentClass
                    delAttach.ReferenceID = System.Web.HttpContext.Current.Session(SKey("FormID"))
                    delAttach.OnBaseDocHandle = DocId
                    myWS.DeleteAttachFromSMO(delAttach)
                    myAttach.Items.Remove(New ListItem(myAttach.SelectedItem.Text, DocId))
                    If myAttach.Items.Count = 0 Then
                        myAttach.SelectedValue = ""
                        DeleteButton.Enabled = False
                        ViewLink.Enabled = False
                    Else
                        myAttach.SelectedValue = myAttach.Items(0).Value
                    End If
                    MsgBox("Document has been successfully deleted.")
                    myAttach.Focus()
                Else
                    MsgBox("Error trying to delete the attachment.  Please contact the RWM Support group.")
                End If
            Else
                MsgBox("Attachment not found.  Please contact the RWM Support group.")
            End If
        Catch ex As Exception
            MsgBox("Delete Current Attachment: " & ex.Message)
        End Try
    End Sub
    Public Sub DeleteAllAttachments()
        Dim obService As New OnBase1.OnBase_Service
        Dim result As Boolean = False
        result = obService.OnBaseDeleteFormAttachments(System.Web.HttpContext.Current.Session(SKey("FormID")), _KDOTFormClass.FormName)
        If Not result Then
            File.AppendAllText(myLog, "Attachments not deleted for form id: " & System.Web.HttpContext.Current.Session(SKey("FormID")) & vbCrLf)
        End If
    End Sub

    Public Sub ConfirmMsgBox(ByVal myMsg As String)
        Dim myLabel As New Label
        myMsg = Replace(myMsg, """", "")
        myLabel = HttpContext.Current.Session("myPage").FindControl("lblJavaScript")
        myLabel.Text = "<script type='text/javascript'>var result = ConfirmMessage(""" & myMsg & """ );</script>"
    End Sub

    'Public Sub MsgBox(ByVal myMsg As String)
    '    Dim myLabel As New Label
    '    myMsg = Replace(myMsg, """", "")
    '    myLabel = HttpContext.Current.Session("myPage").FindControl("lblJavaScript")
    '    myLabel.Text = "<script type='text/javascript'>ShowMessage(""" & myMsg & """ );</script>"
    'End Sub
    Public Sub MsgBox(ByVal myMsg As String)
        If String.IsNullOrEmpty(myMsg) Then Exit Sub

        ' keep your quote stripping but make it JS-safe
        myMsg = myMsg.Replace("""", "").Trim()
        Dim safe As String = myMsg.Replace("\", "\\").Replace("'", "\'").Replace(vbCrLf, "\n").Replace(vbLf, "\n")

        Dim page As Page = TryCast(HttpContext.Current.Session("myPage"), Page)
        If page Is Nothing Then page = TryCast(HttpContext.Current.Handler, Page)
        If page Is Nothing Then Exit Sub

        Dim js As String = "if (typeof ShowMessage==='function') { ShowMessage('" & safe & "'); }"

        Dim sm As ScriptManager = ScriptManager.GetCurrent(page)
        If sm IsNot Nothing AndAlso sm.IsInAsyncPostBack Then
            ScriptManager.RegisterStartupScript(page, page.GetType(), "MSG_" & Guid.NewGuid().ToString("N"), js, True)
        Else
            page.ClientScript.RegisterStartupScript(page.GetType(), "MSG_" & Guid.NewGuid().ToString("N"), "<script>" & js & "</script>")
        End If
    End Sub
    Public Sub ResetMsgBox()
        Dim myLabel As New Label
        myLabel = HttpContext.Current.Session("myPage").FindControl("lblJavaScript")
        myLabel.Text = ""
    End Sub
    Public Sub RejectMsgBox()
        Dim myLabel As New Label
        myLabel = HttpContext.Current.Session("myPage").FindControl("lblJavaScript")
        myLabel.Text = "<script type='text/javascript'>ConfirmReject();</script>"
    End Sub

    Public Sub SetErrorField(ByVal theField As String, ByVal fieldType As String, ByVal SetType As String, ByVal ErrorMsg As String)
        'This is used for radio buttons and special situations otherwise the SetAllValidationFields handles it
        Dim myField As TextBox
        Dim myDropDown As DropDownList
        Dim myRadio As RadioButton
        Dim myRadioList As RadioButtonList
        Dim myCheckbox As CheckBox
        Dim myListBox As ListBox
        Dim myColor As System.Drawing.Color = Nothing
        Dim myBorder As System.Web.UI.WebControls.BorderStyle
        Dim myBorderDD As System.Web.UI.WebControls.BorderStyle
        Dim myBorderWidth As String = Nothing

        Select Case SetType
            Case "ResetWithBorder"
                myBorder = BorderStyle.Solid
                myColor = Drawing.Color.Black
                myBorderWidth = "1"
            Case "ResetWithGrayBorder"
                myBorder = BorderStyle.Solid
                myColor = Drawing.ColorTranslator.FromHtml("#CCCCCC")
                myBorderWidth = "1"
            Case "ResetWithUnderline"
                myBorder = BorderStyle.None
                myBorderDD = BorderStyle.Outset
            Case "Reset"
                myBorder = BorderStyle.NotSet
                myBorderDD = BorderStyle.Outset
            Case "Set"
                myColor = Drawing.Color.Red
                myBorder = BorderStyle.Dashed
                myBorderWidth = "1"
                UpdateXMLDocument("isFormValid", "false")
        End Select

        Select Case fieldType.ToLower
            Case "textbox"
                myField = HttpContext.Current.Session("myPage").Form.FindControl(theField)
                If Not myField Is Nothing Then
                    myField.BorderColor = myColor
                    myField.BorderStyle = myBorder
                    myField.BorderWidth = myBorderWidth
                    myField.ToolTip = ErrorMsg
                End If
            Case "radiobutton"
                myRadio = HttpContext.Current.Session("myPage").Form.FindControl(theField)
                If Not myRadio Is Nothing Then
                    myRadio.BorderColor = myColor
                    myRadio.BorderStyle = myBorder
                    myRadio.BorderWidth = myBorderWidth
                    myRadio.ToolTip = ErrorMsg
                End If
            Case "radiobuttonlist"
                myRadioList = HttpContext.Current.Session("myPage").Form.FindControl(theField)
                If Not myRadioList Is Nothing Then
                    myRadioList.BorderColor = myColor
                    myRadioList.BorderStyle = myBorder
                    myRadioList.BorderWidth = myBorderWidth
                    myRadioList.ToolTip = ErrorMsg
                End If
            Case "dropdownlist"
                myDropDown = HttpContext.Current.Session("myPage").Form.FindControl(theField)
                If Not myDropDown Is Nothing Then
                    If SetType = "Set" Then
                        myDropDown.BorderColor = myColor
                        myDropDown.BorderStyle = myBorder
                        myDropDown.BorderWidth = myBorderWidth
                    Else
                        myDropDown.BorderColor = Drawing.Color.Black
                        myDropDown.BorderStyle = myBorderDD
                        myDropDown.BorderWidth = "1"
                    End If
                    myDropDown.ToolTip = ErrorMsg
                End If
            Case "listbox"
                myListBox = HttpContext.Current.Session("myPage").Form.FindControl(theField)
                If Not myListBox Is Nothing Then
                    myListBox.BorderColor = myColor
                    myListBox.BorderStyle = myBorder
                    myListBox.BorderWidth = myBorderWidth
                    myListBox.ToolTip = ErrorMsg
                End If
            Case "checkbox"
                myCheckbox = HttpContext.Current.Session("myPage").Form.FindControl(theField)
                If Not myCheckbox Is Nothing Then
                    myCheckbox.BorderColor = myColor
                    myCheckbox.BorderStyle = myBorder
                    myCheckbox.BorderWidth = myBorderWidth
                    myCheckbox.ToolTip = ErrorMsg
                End If
        End Select
    End Sub

    '#Region "Security Token Support"

    '    Private Function CreateToken() As String
    '        Return ProxyManager.GetTokenServiceProxy(ConfigurationManager.AppSettings("TokenServiceUrl")).CreateToken()
    '    End Function

    '    Public Shared Function CreateToken(ByVal tokenServiceUrl As String) As String
    '        Return ProxyManager.GetTokenServiceProxy(tokenServiceUrl).CreateToken()
    '    End Function

    '    Public Shared Function CreateToken(ByVal tokenServiceUrl As String, ByVal properties As Dictionary(Of String, String)) As String
    '        Dim proxy As TokenServiceProxy.ServiceImplementation = ProxyManager.GetTokenServiceProxy(tokenServiceUrl)
    '        Dim propList As List(Of TokenServiceProxy.PropertyEntry) = New List(Of TokenServiceProxy.PropertyEntry)

    '        If (Not properties Is Nothing) Then
    '            For Each propKey As String In properties.Keys
    '                Dim entry As TokenServiceProxy.PropertyEntry = New TokenServiceProxy.PropertyEntry()
    '                entry.Key = propKey
    '                entry.Value = properties(propKey)
    '                propList.Add(entry)
    '            Next
    '        End If

    '        Return proxy.CreateTokenWithProperties(propList.ToArray())
    '    End Function

    '#End Region

    Public Sub SetFieldFocus(ByVal myChangedField As String)
        'Sets the focus on the next field in the tab order

        Dim myControlTB As New TextBox
        Dim myControlChk As New CheckBox
        Dim myControlRB As New RadioButton
        Dim myControlRBL As New RadioButtonList
        Dim myControlDD As New DropDownList
        Dim newObj As New Object
        Dim objFlag As Boolean = False

        'We have to have a control for each different control type
        newObj = New Object
        myControlChk = New CheckBox
        myControlTB = New TextBox
        myControlRBL = New RadioButtonList
        myControlRB = New RadioButton
        myControlDD = New DropDownList
        newObj = HttpContext.Current.Session("myPage").FindControl(myChangedField)

        If newObj.GetType() Is GetType(System.Web.UI.WebControls.TextBox) Then
            myControlTB = HttpContext.Current.Session("myPage").FindControl(myChangedField)
            myControlTB.Focus()
        ElseIf newObj.GetType() Is GetType(System.Web.UI.WebControls.CheckBox) Then
            myControlChk = HttpContext.Current.Session("myPage").FindControl(myChangedField)
            If (Not myControlChk Is Nothing) Then
                myControlChk.Focus()
            End If
        ElseIf newObj.GetType() Is GetType(System.Web.UI.WebControls.RadioButtonList) Then
            myControlRBL = HttpContext.Current.Session("myPage").FindControl(myChangedField)
            If (Not myControlRBL Is Nothing) Then
                myControlRBL.Focus()
            End If
        ElseIf newObj.GetType() Is GetType(System.Web.UI.WebControls.RadioButton) Then
            myControlRB = HttpContext.Current.Session("myPage").FindControl(myChangedField)
            If (Not myControlRB Is Nothing) Then
                myControlRB.Focus()
            End If
        ElseIf newObj.GetType() Is GetType(System.Web.UI.WebControls.DropDownList) Then
            myControlDD = HttpContext.Current.Session("myPage").FindControl(myChangedField)
            If (Not myControlDD Is Nothing) Then
                myControlDD.Focus()
            End If
        End If
    End Sub

    'Phone number functions to format correctly
    Public Function FormatPhone(ByVal OriginalNumber As String) As String

        Dim sReturn As String
        Dim tester() As String
        Dim R As Regex
        Dim M As Match
        Dim sTemp As String

        sReturn = ""
        ' removes anything that is not a digit or letter
        sTemp = UnFormatPhone(OriginalNumber)
        ' splits sTemp based on user input of character(s) to signify an extension i.e. x or ext or anything else you can think of (abcdefg...)
        tester = Regex.Split(sTemp, "\D+")
        ' if the string was split then replace sTemp with the first part, i.e. the phone number less the extension
        If tester.Count > 1 Then
            sTemp = tester(0)
        End If
        ' Based on the NANP (North American Numbering Plan),  we better have a 7 or 10 digit number.  anything else will not parse
        If sTemp.Length = 7 Then
            R = New Regex("^(?<First>\d{3})(?<Last>\d{4})")
        ElseIf sTemp.Length = 10 Then
            R = New Regex("^(?<AC>\d{3})(?<First>\d{3})(?<Last>\d{4})")
        Else
            Return OriginalNumber
        End If
        ' now format the phone number nice and purtee...
        M = R.Match(sTemp)
        If M.Groups("AC").Length > 0 Then
            sReturn &= String.Format("({0}) {1}-{2}", CStr(M.Groups("AC").Value), CStr(M.Groups("First").Value), CStr(M.Groups("Last").Value))
        Else
            sReturn &= String.Format("{0}-{1}", CStr(M.Groups("First").Value), CStr(M.Groups("Last").Value))
        End If
        If tester.Count > 1 Then
            sReturn &= " Ext: " + tester(1)
        End If
        Return sReturn
    End Function
    Private Shared Function UnFormatPhone(ByVal sTemp As String) As String
        sTemp = ClearNull(sTemp)
        If sTemp.StartsWith("+1") Then sTemp = Replace(sTemp, "+1", "")
        Dim sb As New System.Text.StringBuilder
        For Each ch As Char In sTemp
            If Char.IsLetterOrDigit(ch) OrElse ch = " "c Then
                sb.Append(ch)
            End If
        Next
        UnFormatPhone = sb.ToString
    End Function
    Private Shared Function ClearNull(ByRef sTemp As String) As String
        sTemp = Replace(sTemp, vbNullChar, "")
        ClearNull = Trim(sTemp)
    End Function
    Public Sub SetTextBoxSize(ByVal fieldname As String, ByVal SetDynamically As Boolean)
        Dim defaultSize As Integer = fieldsDefaultSize(fieldname)
        Dim myTextBox As New TextBox
        myTextBox = HttpContext.Current.Session("myPage").FindControl(fieldname)
        Dim defaultChars As Integer = defaultSize / 8
        Dim LenChars As Integer = Len(myTextBox.Text)
        Try
            myTextBox.TextMode = TextBoxMode.SingleLine
            myTextBox.Width = defaultSize
            If SetDynamically = "true" Then
                If LenChars > defaultChars Then
                    myTextBox.TextMode = TextBoxMode.MultiLine
                    myTextBox.Rows = Int((LenChars / defaultChars)) + 1
                ElseIf (LenChars <= defaultChars) And LenChars > 0 Then
                    myTextBox.Width = LenChars * 8
                Else
                    myTextBox.Width = defaultSize
                End If
            End If
        Catch ex As Exception
            myTextBox.Width = defaultSize
        End Try
    End Sub
    Public Sub SetHoldField(ByVal myChangedField As String)
        Dim myControlTB As New TextBox
        Dim myControlChk As New CheckBox
        Dim myControlRB As New RadioButton
        Dim myControlRBL As New RadioButtonList
        Dim myControlDD As New DropDownList
        Dim newObj As New Object
        Dim objFlag As Boolean = False
        Dim myNodeName As String = myChangedField
        Dim myNodeValue As String = Nothing
        If Not String.IsNullOrEmpty(myNodeName) Then
            'We have to have a control for each different control type
            newObj = New Object
            myControlChk = New CheckBox
            myControlTB = New TextBox
            myControlRBL = New RadioButtonList
            myControlRB = New RadioButton
            myControlDD = New DropDownList
            newObj = HttpContext.Current.Session("myPage").FindControl(myNodeName)

            If newObj.GetType() Is GetType(System.Web.UI.WebControls.TextBox) Then
                myControlTB = HttpContext.Current.Session("myPage").FindControl(myNodeName)
                myNodeValue = myControlTB.Text
                If _KDOTFormClass.AutoSizeFields = "true" Then
                    SetTextBoxSize(myNodeName, "true")
                End If
                myControlTB.Focus()
            ElseIf newObj.GetType() Is GetType(System.Web.UI.WebControls.CheckBox) Then
                myControlChk = HttpContext.Current.Session("myPage").FindControl(myNodeName)
                myNodeValue = myControlChk.Checked
                myControlChk.Focus()
            ElseIf newObj.GetType() Is GetType(System.Web.UI.WebControls.RadioButtonList) Then
                myControlRBL = HttpContext.Current.Session("myPage").FindControl(myNodeName)
                myNodeValue = myControlRBL.Text
                myControlRBL.Focus()
            ElseIf newObj.GetType() Is GetType(System.Web.UI.WebControls.RadioButton) Then
                myControlRB = HttpContext.Current.Session("myPage").FindControl(myNodeName)
                myNodeValue = myControlRB.Checked
                myControlRB.Focus()
            ElseIf newObj.GetType() Is GetType(System.Web.UI.WebControls.DropDownList) Then
                myControlDD = HttpContext.Current.Session("myPage").FindControl(myNodeName)
                myNodeValue = myControlDD.SelectedValue
                myControlDD.Focus()
            End If
            UpdateXMLDocument(myNodeName, myNodeValue)
        End If
    End Sub
    Public Sub UpdateXMLDocument(ByVal NodeName As String, ByVal NodeValue As String)
        If NodeValue Is Nothing Then Exit Sub

        Dim xml As String = SessionFormXml
        If String.IsNullOrWhiteSpace(xml) Then
            ' Optional: log
            Exit Sub
        End If

        FormXML.InnerXml = xml
        Dim myNav As XPathNavigator = FormXML.CreateNavigator()
        Dim ns As New XmlNamespaceManager(FormXML.NameTable)

        If NodeValue.Contains("&") Then NodeValue = Replace(NodeValue, "&", "&amp;")
        If NodeValue.Contains("<") Then NodeValue = Replace(NodeValue, "<", "&lt;")
        If NodeValue.Contains(">") Then NodeValue = Replace(NodeValue, ">", "&gt;")
        If NodeValue.Contains("'") Then NodeValue = Replace(NodeValue, "'", "&apos;")
        If NodeValue.Contains("""") Then NodeValue = Replace(NodeValue, """", "&quot;")

        Dim n = myNav.SelectSingleNode("//" & NodeName, ns)
        If n Is Nothing Then Exit Sub

        n.InnerXml = NodeValue
        SessionFormXml = FormXML.InnerXml
    End Sub

    Public Function GetXMLValue(ByVal NodeName As String) As String
        Dim xml As String = SessionFormXml

        If String.IsNullOrWhiteSpace(xml) Then
            ' Optional: log here with InstanceId + NodeName
            Return String.Empty
        End If

        FormXML.InnerXml = xml

        Dim myNav As XPathNavigator = FormXML.CreateNavigator()
        Dim ns As New XmlNamespaceManager(FormXML.NameTable)

        Dim n = myNav.SelectSingleNode("//" & NodeName, ns)
        If n Is Nothing Then Return String.Empty

        Dim nodevalue As String = n.InnerXml

        If nodevalue.Contains("&amp;") Then nodevalue = Replace(nodevalue, "&amp;", "&")
        If nodevalue.Contains("&lt;") Then nodevalue = Replace(nodevalue, "&lt;", "<")
        If nodevalue.Contains("&gt;") Then nodevalue = Replace(nodevalue, "&gt;", ">")
        If nodevalue.Contains("&apos;") Then nodevalue = Replace(nodevalue, "&apos;", "'")
        If nodevalue.Contains("&quot;") Then nodevalue = Replace(nodevalue, "&quot;", """")

        Return nodevalue
    End Function


    Public Sub CreateHTMLFile()
        'This code is used to bind the xml and xslt together to create an html file for future printing
        Dim _KDOTFormClass As New KDOTFormClass
        Dim xslt As New XslCompiledTransform()
        Dim xmlFileName = myXMLFiles & System.Web.HttpContext.Current.Session(SKey("FormID")) & ".xml"
        xslt.Load(HttpContext.Current.Session("myPage").Server.MapPath(_KDOTFormClass.thePrintView) & ".xsl")

        Dim myOutputFile As String = (ConfigurationManager.AppSettings("HTMLFileLocation") & System.Web.HttpContext.Current.Session(SKey("FormID")) & ".html")
        If File.Exists(myOutputFile) Then File.Delete(myOutputFile)
        If File.Exists(xmlFileName) Then File.Delete(xmlFileName)

        File.AppendAllText(xmlFileName, HttpContext.Current.Session(SKey("FormXML")))
        xslt.Transform(xmlFileName, myOutputFile)
        Dim myFile As String = Nothing
        myFile = File.ReadAllText(myOutputFile)
        Dim bodyLoc As Integer = InStr(myFile, "<head>")
        myFile = "<html>" & Mid(myFile, bodyLoc)
        File.Delete(myOutputFile)
        File.AppendAllText(myOutputFile, myFile)
    End Sub

    Public Sub CreateHTMLFileX()
        'This code is used to bind the xml and xslt together to create an html file for future printing
        Dim _KDOTFormClass As New KDOTFormClass
        Dim xslt As New XslCompiledTransform()
        Dim xmlFileName = myXMLFiles & System.Web.HttpContext.Current.Session(SKey("FormID")) & ".xml"
        xslt.Load(HttpContext.Current.Session("myPage").Server.MapPath("PrintPreviewView") & ".xsl")

        Dim myOutputFile As String = (ConfigurationManager.AppSettings("HTMLFileLocation") & System.Web.HttpContext.Current.Session(SKey("FormID")) & ".html")
        If File.Exists(myOutputFile) Then File.Delete(myOutputFile)
        If File.Exists(xmlFileName) Then File.Delete(xmlFileName)

        File.AppendAllText(xmlFileName, HttpContext.Current.Session(SKey("FormXML")))
        xslt.Transform(xmlFileName, myOutputFile)
        Dim myFile As String = Nothing
        myFile = File.ReadAllText(myOutputFile)
        Dim bodyLoc As Integer = InStr(myFile, "<head>")
        myFile = "<html>" & Mid(myFile, bodyLoc)
        File.Delete(myOutputFile)
        File.AppendAllText(myOutputFile, myFile)
    End Sub

    Private Shared _initiatorVerified As Boolean = False
    Private Shared _initiatorValid As Boolean = False
    Public Function VerifyUserCanInitiateForm() As Boolean
        Dim myWS As New OrgDBRoles1.OrgDBRoles
        Dim result As Boolean = "true"
        Dim ErrorMsg As String = "You are unauthorized to initiate this form."
        result = myWS.UseridCanInitiateForm("", _KDOTFormClass.FormName, EffectiveUserid)
        If result = "true" Then
            Return "true"
        Else
            Dim myLabel As New Label
            myLabel = HttpContext.Current.Session("myPage").FindControl("lblJavaScript")
            myLabel.Text = "<script type='text/javascript'>WorklistItemLocked(""" & ErrorMsg & """ );</script>"
            Return False
        End If
    End Function

    Public Sub LoadDropDownList(ByRef drpList As DropDownList, ByVal myDS As DataSet, ByVal addBlankRow As Boolean, ByVal theTextField As String, ByVal theValueField As String)
        Dim x As Integer = 0
        Dim ct As Integer = 0
        Dim myItem As New ListItem
        drpList.Items.Clear()
        If addBlankRow Then
            myItem.Text = ""
            myItem.Value = ""
            drpList.Items.Add(myItem)
        End If
        ct = myDS.Tables(0).Rows.Count
        For x = 0 To ct - 1
            myItem = New ListItem
            myItem.Text = myDS.Tables(0).Rows(x).Item(theTextField)
            myItem.Value = myDS.Tables(0).Rows(x).Item(theValueField)
            drpList.Items.Add(myItem)
        Next
    End Sub

    Public Sub SaveXMLForDebug()
        'If F8 is pressed then it will save the Form XML to a file
        File.AppendAllText(ConfigurationManager.AppSettings("XMLFileLocation") & HttpContext.Current.Session(SKey("FormID")) & ".xml", SessionFormXml)
    End Sub
    Public Sub SaveXMLFromFile()
        'If F9 is pressed then it will update the session variable FormXML from the file
        HttpContext.Current.Session(SKey("FormXML")) = File.ReadAllText(ConfigurationManager.AppSettings("XMLFileLocation") & HttpContext.Current.Session(SKey("FormID")) & ".xml")
        SetPageFields()
        File.Delete(ConfigurationManager.AppSettings("XMLFileLocation") & HttpContext.Current.Session(SKey("FormID")) & ".xml")
    End Sub
#Region "PDF Conversion Methods"

    Public Shared Function CreateDefaultPdfInfo() As OnBaseDocumentInfo
        Return CreateDefaultPdfInfo("true")
    End Function

    Public Shared Function CreateDefaultPdfInfo(ByVal autoPersist As Boolean) As OnBaseDocumentInfo
        Dim _KDOTFormClass As New KDOTFormClass
        Dim doc As OnBaseDocumentInfo = New OnBaseDocumentInfo
        _KDOTFormClass.GetDocumentProperties(doc)
        _KDOTFormClass.GetDocumentSecurity(doc)
        Dim info As OnBaseDocumentInfo = CreatePdfInfo(_KDOTFormClass.FileNetLibraryName,
                                                       doc.DocumentType,
                                                       String.Format("{0}.pdf", _KDOTFormClass.FormName.Replace(" ", "")),
                                                       _KDOTFormClass.PrintViewName,
                                                       doc.DocumentProperties,
                                                       doc.SecurityEntries)
        If (autoPersist) Then
            PersistPdfInfo(info)
        End If
        Return info
    End Function

    Public Shared Function CreatePdfInfo(ByVal libraryName As String,
                                         ByVal documentClass As String,
                                         ByVal documentOutputName As String,
                                         ByVal printViewName As String,
                                         ByVal documentProperties As IEnumerable(Of DocumentPropClass),
                                         ByVal securityEntries As IEnumerable(Of SecurityClass)) As OnBaseDocumentInfo
        Dim names As List(Of String) = New List(Of String)()
        names.Add(printViewName)
        Return CreatePdfInfo(libraryName, documentClass, documentOutputName, names, documentProperties, securityEntries)
    End Function

    Public Shared Function CreatePdfInfo(ByVal libraryName As String,
                                                         ByVal documentClass As String,
                                                         ByVal documentOutputName As String,
                                                         ByVal printViewNames As IEnumerable(Of String),
                                                         ByVal documentProperties As IEnumerable(Of DocumentPropClass),
                                                         ByVal securityEntries As IEnumerable(Of SecurityClass)) As OnBaseDocumentInfo

        Dim info As OnBaseDocumentInfo = New OnBaseDocumentInfo()
        info.LibraryName = libraryName
        info.DocumentType = documentClass
        info.DocumentOutputName = documentOutputName
        info.PrintViewNames.AddRange(printViewNames)
        info.DocumentProperties.AddRange(documentProperties)
        info.SecurityEntries.AddRange(securityEntries)
        Return info
    End Function

    Public Shared Sub PersistPdfInfo(ByVal info As OnBaseDocumentInfo)
        Dim infos As List(Of OnBaseDocumentInfo) = New List(Of OnBaseDocumentInfo)()
        infos.Add(info)
        PersistPdfInfo(infos)
    End Sub

    Public Shared Sub PersistPdfInfo(ByVal registrations As IEnumerable(Of OnBaseDocumentInfo))
        Dim p = TryCast(HttpContext.Current.CurrentHandler, System.Web.UI.Page)
        Dim inst As String = If(p Is Nothing, "no-page", FormInstance.GetOrCreate(p))
        Dim key As String = "FormXML:" & inst
        Dim index As Integer = 0
        Dim _KDOTFormClass As New KDOTFormClass
        ' First, clear out any previous registrations...
        Dim xmldoc As New XmlDocument
        xmldoc.InnerXml = CStr(HttpContext.Current.Session(key))
        Dim nav As XPathNavigator = xmldoc.CreateNavigator()
        Dim ns As New XmlNamespaceManager(xmldoc.NameTable)
        Dim first As XPathNavigator = nav.SelectSingleNode("//Core/FileNETDocuments/FileNETDocument[1]", ns)
        If (Not first Is Nothing) Then
            Dim last As XPathNavigator = nav.SelectSingleNode("//Core/FileNETDocuments/FileNETDocument[position()=last()]", ns)
            first.DeleteRange(last)
        End If

        Dim insert As XPathNavigator = nav.SelectSingleNode("//Core/FileNETDocuments", ns)

        Dim ns2 As String = ""

        ' Then, add our registrations...
        For Each reg As OnBaseDocumentInfo In registrations
            '
            Using writer As XmlWriter = insert.AppendChild()
                writer.WriteStartElement("FileNETDocument", ns2)
                writer.WriteElementString("DocumentClass", ns2, reg.DocumentType)
                writer.WriteElementString("DocumentId", ns2, reg.DocumentId)
                writer.WriteElementString("DocumentOutputName", ns2, reg.DocumentOutputName)
                writer.WriteElementString("DocumentUniqueName", ns2, reg.DocumentUniqueName)
                writer.WriteElementString("LibraryName", ns2, reg.LibraryName)
                writer.WriteStartElement("PrintViews", ns2)
                For Each viewName As String In reg.PrintViewNames
                    writer.WriteElementString("PrintViewName", ns2, viewName)
                Next
                writer.WriteEndElement() 'PrintViews
                writer.WriteStartElement("Properties", ns2)
                For Each prop As DocumentPropClass In reg.DocumentProperties
                    writer.WriteStartElement("Property", ns2)
                    writer.WriteElementString("PropertyName", ns2, prop.Name)
                    writer.WriteStartElement("PropertyValues", ns2)
                    'For Each val As String In prop.Value
                    writer.WriteElementString("PropertyValue", ns2, prop.Value)
                    'Next
                    writer.WriteEndElement() 'PropertyValues
                    writer.WriteEndElement() 'Property
                Next
                writer.WriteEndElement() 'Properties
                writer.WriteStartElement("SecurityEntries", ns2)
                For Each entry As SecurityClass In reg.SecurityEntries
                    writer.WriteStartElement("SecurityEntry", ns2)
                    writer.WriteElementString("SecurityName", ns2, entry.Name)
                    writer.WriteElementString("AccessLevel", ns2, entry.AccessLevel.ToString())
                    writer.WriteElementString("UserGroupType", ns2, entry.UserGroupType.ToString())
                    writer.WriteEndElement() 'SecurityEntry
                Next
                writer.WriteEndElement() 'SecurityEntries
                writer.WriteEndElement() 'FileNETDocument
                writer.Close()
            End Using
        Next
        '
        HttpContext.Current.Session(key) = xmldoc.InnerXml
        '
    End Sub
#End Region
End Class
