Imports DOTForm0205.Form.Constants
Imports System.IO
Imports DOTForm0205.ASPFormHelper
Imports CommonClass
Imports KDOT.InfoPath
Imports System.Collections
Imports System.Xml
Imports System.Xml.XPath
Imports System.Drawing
Imports Newtonsoft.Json
Imports System.Configuration
Imports System.Web.Configuration

Partial Public Class view1
    Inherits System.Web.UI.Page

    Private myChangedField As String = Nothing
    Private myFocusField As String = Nothing
    Private CurrentTaskName As String = Nothing
    Private blnPrint As Boolean = False
    Private holdFields As New Hashtable
    Private _aspFormHelper As New ASPFormHelper
    Private _Validation_Code As Validation_Code
    Private _KDOTFormclass As New KDOTFormClass
    Public Shared gridAttendee As New Hashtable
    Public Shared gridUtility As New Hashtable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'Page_load runs on every request for the page whether it is the first request or a postback
        myPage = Me.view1.Page 'refreshes myPage from the main page
        HttpContext.Current.Session("myPage") = Me.view1.Page
        CurrentTaskName = _aspFormHelper.GetXMLValue("CurrentTaskName")

        _aspFormHelper.ResetMsgBox()
        _Validation_Code = New Validation_Code

        Page.MaintainScrollPositionOnPostBack = True

        If Not Page.IsPostBack Then 'And _aspFormHelper.isFirstLoad = "true" Then 'This allows this code to only 

            'execute once when opening a form but does occur if you change pages
            HttpResponse.RemoveOutputCacheItem("/" & myPage.Title & ".aspx")

            Dim CurrentTask As New TextBox
            CurrentTask = UCHeader1.FindControl("CurrentTaskName")
            CurrentTask.Text = CurrentTaskName

            _aspFormHelper.SetPageFields()
            '
            If (CurrentTaskName = WorkflowStepNames.InitiateForm0205) Then
                GetEmp() 'This must be after the ExecuteCommonStartupTasks.  This is here because it's in the template 
            End If
            '
            'also()
            '
            If _aspFormHelper.GetXMLValue("isFormNew") Then
                SetDefaultValues()
                myFocusField = ""
            Else
                myFocusField = ""
            End If

            '************************************ Put additional startup code here ******************
            ' setScrolltoTop.Value = 0
            If String.IsNullOrEmpty(_aspFormHelper.GetXMLValue("FCA")) Then GetFCAInfo()
            LoadCCNotifyList()
            LoadAttendance()
            LoadUtility()
            LoadRep()
            LoadSubcontractor()
            LoadContact()
            LoadMaterial()
            LoadCC()
            If Not String.IsNullOrEmpty(_aspFormHelper.GetXMLValue("picAttendees")) Then
                picAttendees.ImageUrl = _aspFormHelper.GetXMLValue("picAttendees")
                picAttendees.Visible = True
                uplPicture.Visible = False
                btnUpload.Visible = False
                lblPicture.Visible = False
                btnDelete.Visible = True
            End If
            If (_aspFormHelper.GetXMLValue("optDBETruck") = "1") Then
                optDBETruckList.SelectedValue = _aspFormHelper.GetXMLValue("optDBETruckList")
            End If
            optPosters.SelectedValue = _aspFormHelper.GetXMLValue("optPosters")
            optLotID.SelectedValue = _aspFormHelper.GetXMLValue("optLotID")
            txtVIIIB1DKDOT.Text = _aspFormHelper.GetXMLValue("txtVIIIB1DKDOT")
            '****************************************************************************************
        Else
            CurrentTaskName = _aspFormHelper.GetXMLValue("CurrentTaskName")
            If ViewState("grdAttendance") Is Nothing Then
                LoadAttendance()
            End If
        End If

        _aspFormHelper.isFirstLoad = False
        myChangedField = myPage.Request.Params.Get("__EVENTTARGET")

        If Not String.IsNullOrEmpty(myChangedField) Then
            If myChangedField.StartsWith("UCHeader1$") Then
                isInitialLoad.Value = "true"
            End If
        End If
        If myChangedField = "UCHeader1$cmdPrintPreview" Then
            savetables()
            UpdateDBEFields()
        End If
        If myChangedField = "UCSubmit1$ReviewAction" Then
            myFocusField = "UCSubmit1$ReviewAction"
            mouseLoc.Value = ""
            isInitialLoad.Value = "false"
        ElseIf myChangedField = "dteMtgDate" Then
            myFocusField = "dteMtgTime"
            mouseLoc.Value = ""
        End If
        If InStr(myChangedField, "$") > 0 Then myChangedField = Mid(myChangedField, 1, InStrRev(myChangedField, "$") - 1)
        _aspFormHelper.SetHoldField(myChangedField)
        If Not String.IsNullOrEmpty(mouseLoc.Value) Then
            If mouseLoc.Value <> myChangedField Then
                myFocusField = mouseLoc.Value
                mouseLoc.Value = ""
            End If
        End If
    End Sub

    Protected Overrides ReadOnly Property PageStatePersister As PageStatePersister
        Get
            Return New SessionPageStatePersister(Me)
        End Get
    End Property
    Public Sub DOTForm0205_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles Me.PreRender

        isValidate.Value = CBool(_aspFormHelper.GetXMLValue("doValidate"))

        txtIC1ProjSuperPhone.Attributes.Add("maxlength", "14")
        txtIC1ProjSuperCell.Attributes.Add("maxlength", "14")
        txtIC1GenSuperPhone.Attributes.Add("maxlength", "14")
        txtIC1GenSuperCell.Attributes.Add("maxlength", "14")
        txtIC1ProjMgrPhone.Attributes.Add("maxlength", "14")
        txtIC1ProjMgrCell.Attributes.Add("maxlength", "14")

        txtIC2ConstEngPhone.Attributes.Add("maxlength", "14")
        txtIC2ConstEngCell.Attributes.Add("maxlength", "14")
        txtFEAPhone.Attributes.Add("maxlength", "14")
        txtFEACell.Attributes.Add("maxlength", "14")
        txtAreaEngPhone.Attributes.Add("maxlength", "14")
        txtAreaEngCell.Attributes.Add("maxlength", "14")
        txtIC2ProjSuperPhone.Attributes.Add("maxlength", "14")
        txtIC2ProjSuperCell.Attributes.Add("maxlength", "14")
        txtIC2ProjInspPhone.Attributes.Add("maxlength", "14")
        txtIC2ProjInspCell.Attributes.Add("maxlength", "14")
        txtEricPhone.Attributes.Add("maxlength", "14")
        txtEricCell.Attributes.Add("maxlength", "14")
        txtIC2PubAffPhone.Attributes.Add("maxlength", "14")
        txtIC2PubAffInfoCell.Attributes.Add("maxlength", "14")
        txtIC2EmrgyPhone.Attributes.Add("maxlength", "14")
        txtIC2EmrgyCell.Attributes.Add("maxlength", "14")

        CondFormatting()
        LoadSpecialFields()

        If _aspFormHelper.GetXMLValue("doValidate") = "true" And _aspFormHelper.GetXMLValue("isSuccessfulSubmit") = "false" Then
            _Validation_Code.ValidateForm(myPage, myChangedField)
        Else
            _Validation_Code.ResetAllValidations()
        End If

        If _aspFormHelper.GetXMLValue("isSuccessfulSubmit") = "false" Then
            ' Code to set the next tab field
            If String.IsNullOrEmpty(myFocusField) Then
                If Not String.IsNullOrEmpty(myChangedField) And Mid(myChangedField, 1, 2).ToUpper <> "UC" Then
                    Dim wcICausedPostBack As WebControl = CType(GetControlThatCausedPostBack(TryCast(sender, Page)), WebControl)
                    Dim indx As Integer = wcICausedPostBack.TabIndex

                    'reset tab to field that caused the postback if I'm a radiobuttonlist
                    'If TypeOf wcICausedPostBack Is System.Web.UI.WebControls.RadioButtonList Then
                    '  _aspFormHelper.SetFieldFocus(myChangedField)
                    'End If

                    Dim ctrl = From control In wcICausedPostBack.Parent.Controls.OfType(Of WebControl)()
                               Where (control.TabIndex > indx And control.Visible = "true" And control.Enabled = "true")
                               Select control

                    If ctrl.Count = 0 Then
                        Dim myParentControl As WebControl = myPage.FindControl(myChangedField).Parent
                        'Try
                        '    myParentControl = myPage.FindControl(myChangedField).Parent
                        'Catch ex As Exception
                        '    Try
                        '        myParentControl = myPage.FindControl(myChangedField).Parent.Parent
                        '    Catch ex1 As Exception
                        '        myParentControl = myPage.FindControl(myChangedField).Parent.Parent.Parent
                        '    End Try
                        'End Try

                        Dim Prntctrl = From control In myParentControl.Parent.Controls.OfType(Of WebControl)()
                                       Where (control.TabIndex > indx And control.Visible = "true" And control.Enabled = "true")
                                       Select control
                        If Prntctrl.Count = 0 Then
                            Try
                                Dim myParentControl2 As WebControl = myPage.FindControl(myChangedField).Parent.Parent
                                Dim Prntctrl2 = From control In myParentControl2.Parent.Controls.OfType(Of WebControl)()
                                                Where (control.TabIndex > indx And control.Visible = "true" And control.Enabled = "true")
                                                Select control
                                Prntctrl2.DefaultIfEmpty(wcICausedPostBack).First().Focus()
                            Catch
                                Dim myUCSubmit As New UCSubmit
                                myUCSubmit = myPage.FindControl("UCSubmit1")
                                Dim myAction As DropDownList
                                myAction = myUCSubmit.FindControl("ReviewAction")
                                myAction.Focus()
                            End Try
                        Else
                            Prntctrl.DefaultIfEmpty(wcICausedPostBack).First().Focus()
                        End If
                    Else
                        ctrl.DefaultIfEmpty(wcICausedPostBack).First().Focus()
                    End If

                ElseIf Not String.IsNullOrEmpty(myChangedField) Then
                    SetFocus(myChangedField)

                Else
                    'Handles when the form is first initiated and sets to the first control on the page
                    Try
                        If Not String.IsNullOrEmpty(myChangedField) Then   'laj
                            Dim ctrl = From control In pnlMainPage.Parent.Controls.OfType(Of WebControl)()
                                       Where (control.TabIndex > 0 And control.Visible = "true" And control.Enabled = "true")
                                       Select control
                            ctrl.First.Focus()
                        End If

                    Catch ex As Exception
                        'skip
                        _aspFormHelper.MsgBox(ex.StackTrace)
                    End Try
                End If
            Else
                SetFocus(myFocusField)
            End If
        End If
        mouseLoc.Value = ""
    End Sub

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        ' Always resolve instance from ONE place
        Dim inst As String = FormInstance.GetOrCreate(Me)

        ' Ensure your server hidden field mirrors it (if you have hfFormInstance)
        hfFormInstance.Value = inst

        ' Also ensure the canonical hidden field exists (covers non-view1 pages / etc.)
        ClientScript.RegisterHiddenField("__formInstance", inst)

        ' ViewState must be stable across requests
        Me.ViewStateUserKey = inst
    End Sub
#Region "DefaultValues"
    Public Sub SetDefaultValues()
        '    LineItemAttendence = xdMath : Nz(../ preceding - sibling: My : grpAttendence[1]/LineItemAttendence) + 1
        'ReviewAction = xdXDocument : GetDOM("Actions")/Data/Step/Action/@value[../../@name = xdXDocument:get-DOM

        '()/myForm0205/ My Core/ My CurrentTaskName][position() = 1]
    End Sub
#End Region

#Region "Common Functions"
    Protected Function GetControlThatCausedPostBack(ByVal page As Page) As Control
        Dim control As Control = Nothing
        control = page.FindControl(myChangedField)
        Return control
    End Function

    Protected Sub SaveXMLForDebug()
        'If F8 is pressed then it will save the Form XML to a file
        _aspFormHelper.SaveXMLForDebug()
    End Sub

    Protected Sub SaveXMLFromFile()
        'If F9 is pressed then it will update the session variable FormXML from the file
        _aspFormHelper.SaveXMLFromFile()
    End Sub

    Public Shared Sub SetInitialFlag()
        Dim myPage As Page = HttpContext.Current.Session("myPage")
        Dim theField As HiddenField = myPage.FindControl("scrollField")
        theField.Value = "Special"
    End Sub
    Public Shared Sub PreSubmit()
        Dim _aspFormHelper As New ASPFormHelper
        'Add code here as needed
        If (_aspFormHelper.GetXMLValue("dbUpdated") = "false" And _aspFormHelper.GetXMLValue("ReviewAction") = ActionNames.Proceed) Then
            Dim ws As New CMSForms.CMSForms
            Dim Updated As Boolean
            Try
                Updated = ws.UpdateCMSWorklistItems(_aspFormHelper.GetXMLValue("FormId"), _aspFormHelper.GetXMLValue("ContractNumber"), _aspFormHelper.GetXMLValue("ProjectNumber"))
            Catch
                _aspFormHelper.UpdateXMLDocument("dbUpdated", "true")
            End Try
            If Updated = False Then
                _aspFormHelper.MsgBox("There was an error updating the CMS Worklist Item Database. Please Save your work and try again later or contact the IT Service Desk.")
                _aspFormHelper.UpdateXMLDocument("isFormValid", "false")
            Else
                _aspFormHelper.UpdateXMLDocument("dbUpdated", "true")
            End If
        End If
    End Sub

    Public Shared Sub PrePrint()
        'Add code here as needed
    End Sub

    'Delete if not needed
    Public Sub GetEmp()
        _aspFormHelper.EffectiveUserid = _aspFormHelper.GetXMLValue("EffectiveUserId")
        If (False = String.IsNullOrEmpty(_aspFormHelper.EffectiveUserid)) Then
            Dim getit As DataAccess.Employee = DataAccess.Employee.GetEmployeeDetails(_aspFormHelper.EffectiveUserid)
            If (Not getit Is Nothing AndAlso False = getit.ExceptionThrown) Then
                'txtName.Text = getit.FullName
                '_aspFormHelper.UpdateXMLDocument("txtName", getit.FullName)
                'txtEmail.Text = getit.Email
                '_aspFormHelper.UpdateXMLDocument("txtEmail", getit.Email)
                _aspFormHelper.DistrictNum = getit.DistrictNumber
                _aspFormHelper.AreaNum = getit.AreaNumber
                _aspFormHelper.SubAreaNum = getit.SubAreaNumber
                'txtBureauOffice.Text = getit.Department
                '_aspFormHelper.UpdateXMLDocument("txtBureauOffice", getit.Department)
                _aspFormHelper.SupervisorSharpNum = getit.SupervisorSharpNumber
                'GetSupervisor()
            End If
        End If
    End Sub

#End Region

    'Delete any conditional formating for reviewaction, consultpanel or delegate panel
#Region "ConditionalFormatting"
    Protected Sub CondFormatting()  'This is a new subroutine to hold all of the conditional formatting and is 
        'executed on each postback
        savetables()
        UpdateDBEFields()
        txtFalsework.Style.Add("display", "inline")
        txtLogoSigns.Style.Add("display", "inline")
        txtAsphPaving.Style.Add("display", "inline")
        txtConcPaving.Style.Add("display", "inline")
        txtStructures.Style.Add("display", "inline")
        txtGrading.Style.Add("display", "inline")
        txtDrilledShafts.Style.Add("display", "inline")
        txtFieldErecSuper.Style.Add("display", "inline")
        group23.Style.Add("display", "inline")
        grpFalseworkCat1.Style.Add("display", "inline")
        grpFalseworkCat2.Style.Add("display", "inline")
        grpI3DBEMob.Style.Add("display", "inline")
        grpROWAcquired.Style.Add("display", "inline")
        group21.Style.Add("display", "inline")
        sectCat1.Style.Add("display", "inline")
        sectCatB.Style.Add("display", "inline")
        sectCatC.Style.Add("display", "inline")
        group19.Style.Add("display", "inline")
        group19_2.Style.Add("display", "inline")
        group18.Style.Add("display", "inline")
        grpHwyConstTrainees.Style.Add("display", "inline")
        group16.Style.Add("display", "inline")
        group11.Style.Add("display", "inline")
        group10.Style.Add("display", "inline")
        grpLaborDBETruckNoList.Style.Add("display", "inline")
        grpUtilities.Style.Add("display", "inline")
        grpDBEGoal.Style.Add("display", "inline")
        grpIDBE.Style.Add("display", "inline")
        grpLabotDBETruck.Style.Add("display", "inline")
        grpGrading.Style.Add("display", "inline")
        group8.Style.Add("display", "inline")
        grpLogo.Style.Add("display", "inline")
        group7.Style.Add("display", "inline")
        sectionQC.Style.Add("display", "inline")
        grpStoredMaterials.Style.Add("display", "inline")
        group3.Style.Add("display", "inline")
        group4.Style.Add("display", "inline")
        group5.Style.Add("display", "inline")
        group5_2.Style.Add("display", "inline")
        grpStructureDetail.Style.Add("display", "inline")
        AttendenceSection.Style.Add("display", "inline")
        grpAsphPaving.Style.Add("display", "inline")
        grpConcPaving.Style.Add("display", "inline")
        grpControlDemo.Style.Add("display", "inline")
        grpDrilledShafts.Style.Add("display", "inline")
        grpFieldErect.Style.Add("display", "inline")
        group27.Style.Add("display", "inline")
        optQCQASubmitted.Style.Add("display", "inline")
        '
        If optFalsework.SelectedValue <> "4" Then
            txtFalsework.Style.Add("display", "none")
        End If

        If optLogoSigns.SelectedValue <> "2" Then
            txtLogoSigns.Style.Add("display", "none")
        End If

        If optAsphPaving.SelectedValue <> "2" Then
            txtAsphPaving.Style.Add("display", "none")
        End If

        If optConcPaving.SelectedValue <> "2" Then
            txtConcPaving.Style.Add("display", "none")
        End If

        If optStructures.SelectedValue <> "2" Then
            ' txtStructures.Visible = False
            txtStructures.Style.Add("display", "none")
        End If

        If optGrading.SelectedValue <> "2" Then
            ' txtGrading.Visible = False
            txtGrading.Style.Add("display", "none")
        End If

        If optDrilledShafts.SelectedValue <> "2" Then
            txtDrilledShafts.Style.Add("display", "none")
        End If

        If optFieldErecSuper.SelectedValue <> "2" Then
            txtFieldErecSuper.Style.Add("display", "none")
        End If

        If optQC.SelectedValue <> "1" Then
            group23.Style.Add("display", "none")
        End If

        If optFalsework.SelectedValue <> "1" And optFalsework.SelectedValue <> "3" And optFalsework.SelectedValue <> "" Then
            grpFalseworkCat1.Style.Add("display", "none")
        End If

        If optFalsework.SelectedValue <> "2" And optFalsework.SelectedValue <> "3" Then
            grpFalseworkCat2.Style.Add("display", "none")
        End If

        If optLtrDBEMob.SelectedValue = "No" Or optLtrDBEMob.SelectedValue = "" Then
            grpI3DBEMob.Style.Add("display", "none")
        End If

        If optNAROW.SelectedValue = "2" Then
            'grpROWAcquired.Visible = False
            grpROWAcquired.Style.Add("display", "none")
        End If

        If optQCSubmitted.SelectedValue = "2" Or optQCSubmitted.SelectedValue = "" Then
            group21.Style.Add("display", "none")
        End If

        If chkControlDemoCatA.Checked = False Then
            'sectCat1.Visible = False
            sectCat1.Style.Add("display", "none")
        End If

        If chkControlDemoCatB.Checked = False Then
            'sectCatB.Visible = False
            sectCatB.Style.Add("display", "none")
        End If

        If chkControlDemoCatC.Checked = False Then
            ' sectCatC.Visible = False
            sectCatC.Style.Add("display", "none")
        End If

        If chkSpecification.Text = "2007" Then
            ' group19.Visible = False
            ' group19_2.Visible = False
            group19.Style.Add("display", "none")
            group19_2.Style.Add("display", "none")
        End If

        If chkSpecification.Text = "2015" Then
            'group18.Visible = False
            group18.Style.Add("display", "none")
        End If

        If optTrainees.SelectedValue = "2" Then
            ' grpHwyConstTrainees.Visible = False
            grpHwyConstTrainees.Style.Add("display", "none")
        End If

        If optAsphPaving.SelectedValue = "2" Then
            'group16.Visible = False
            group16.Style.Add("display", "none")
        End If

        If optEnvProtection.SelectedValue = "2" Then
            'group11.Visible = False
            group11.Style.Add("display", "none")
        End If

        If optSurveying.SelectedValue = "2" Then
            'group10.Visible = False
            group10.Style.Add("display", "none")
        End If

        If optDBETruckList.SelectedValue = "1" Or optDBETruck.SelectedValue = "2" Then
            ' grpLaborDBETruckNoList.Visible = False
            grpLaborDBETruckNoList.Style.Add("display", "none")
        End If

        If optUtility.SelectedValue = "2" Then
            ' grpUtilities.Visible = False
            grpUtilities.Style.Add("display", "none")
        End If

        If optDBEGoal.SelectedValue = "2" Then
            ' grpDBEGoal.Visible = False
            grpDBEGoal.Style.Add("display", "none")
        End If

        If optDBEParticipation.SelectedValue = "2" Then
            ' grpIDBE.Visible = False
            grpIDBE.Style.Add("display", "none")
        End If

        If optDBETruck.SelectedValue = "2" Then
            ' grpLabotDBETruck.Visible = False
            grpLabotDBETruck.Style.Add("display", "none")
        End If

        If optGrading.SelectedValue = "2" Then
            ' grpGrading.Visible = False
            grpGrading.Style.Add("display", "none")
        End If

        If optHaulRoads.SelectedValue = "2" Then
            group8.Style.Add("display", "none")
        End If

        If optLogoSigns.SelectedValue = "2" Then
            grpLogo.Style.Add("display", "none")
        End If

        If optPlanQty.SelectedValue = "1" Or optPlanQty.SelectedValue = "3" Then
            group7.Style.Add("display", "none")
        End If

        If optQC.SelectedValue = "2" Then
            '   sectionQC.Visible = False
            sectionQC.Style.Add("display", "none")
        End If

        If optStoredMaterials.SelectedValue = "2" Then
            ' grpStoredMaterials.Visible = False
            grpStoredMaterials.Style.Add("display", "none")
        End If

        If optStormwater.SelectedValue <> "1" Then
            group3.Style.Add("display", "none")
        End If

        If optStormwater.SelectedValue <> "2" Or chkSpecification.Text <> "2015" Then
            group4.Style.Add("display", "none")
        End If

        If optStormwater.SelectedValue <> "3" Or chkSpecification.Text = "2007" Then
            group5.Style.Add("display", "none")
        End If

        If optStormwater.SelectedValue <> "4" Or chkSpecification.Text = "2007" Then
            group5_2.Style.Add("display", "none")
        End If

        If optStructures.SelectedValue = "2" Then
            grpStructureDetail.Style.Add("display", "none")
        End If

        If Not blnShowAttendList.Checked <> False Then
            ' AttendenceSection.Visible = False
            AttendenceSection.Style.Add("display", "none")
        End If

        If optAsphPaving.SelectedValue = "2" Then
            '  grpAsphPaving.Visible = False
            grpAsphPaving.Style.Add("display", "none")
        End If

        If optConcPaving.SelectedValue = "2" Then
            'grpConcPaving.Visible = False
            grpConcPaving.Style.Add("display", "none")
        End If

        If optContDemoSuper.SelectedValue = "2" Then
            ' grpControlDemo.Visible = False
            grpControlDemo.Style.Add("display", "none")
        End If

        If optDrilledShafts.SelectedValue = "2" Then
            grpDrilledShafts.Style.Add("display", "none")
        End If

        If optFieldErecSuper.SelectedValue = "2" Then
            grpFieldErect.Style.Add("display", "none")
        End If

        If Not optPosters.SelectedValue = "2" Then
            group27.Style.Add("display", "none")
        End If

        If optConcPaving.SelectedValue <> "1" Then
            optQCQASubmitted.Style.Add("display", "none")
        End If
    End Sub
#End Region


#Region "Generated Rule Code"
    'Delete ones related to areanum or districtnum changed

#End Region
    Public Sub LoadCCNotifyList()
        Dim _KDOTFormClass As New KDOTFormClass
        Dim formXML As New XmlDocument
        Dim h As New ASPFormHelper()
        Dim xml As String = h.SessionFormXml   ' this already uses SKey("FormXML") in your helper

        formXML.InnerXml = h.SessionFormXml
        Dim ns As New XmlNamespaceManager(formXML.NameTable)
        ns.AddNamespace("", _KDOTFormClass.myNamespace)

        ' ClearRepeatingTable("/Form0205/FormData/MemoPage/sectionCCs/tblCCs")

        Dim firstEmployee As XPathNavigator = formXML.CreateNavigator().SelectSingleNode("/Form0205/FormData/MemoPage/sectionCCs/tblCCs/txtDOT0205Notify[1]", ns)
        If (Not firstEmployee Is Nothing) Then
            Dim lastEmployee As XPathNavigator = formXML.CreateNavigator().SelectSingleNode("/Form0205/FormData/MemoPage/sectionCCs/tblCCs/txtDOT0205Notify[position()=last()]", ns)
            firstEmployee.DeleteRange(lastEmployee)
        End If

        Dim myDS As New DataSet
        Dim myWS As New CMSForms.CMSForms
        Dim x As New Integer
        Try
            myDS = myWS.GetCMSNotifyList("0205")
            For x = 0 To myDS.Tables(0).Rows.Count - 1
                Using writer As XmlWriter = formXML.CreateNavigator().SelectSingleNode(
        "/Form0205/FormData/MemoPage/sectionCCs", ns).AppendChild()
                    writer.WriteStartElement("tblCCs", _KDOTFormClass.myNamespace)
                    writer.WriteElementString("txtDOT0205Notify", _KDOTFormClass.myNamespace, myDS.Tables(0).Rows(x).Item("DisplayName"))
                    writer.WriteEndElement()
                    writer.Close()
                End Using
            Next
            h.SessionFormXml = formXML.InnerXml
        Catch ex As Exception
            _aspFormHelper.MsgBox("Unexpected error loading the CCNotifyList.  Contact the RWM Support team.  ")
        End Try
    End Sub


    Private Sub LoadCC()
        Dim AddExtraRow As Boolean = True
        Dim dt As New DataTable

        Dim h As New ASPFormHelper()
        Dim xml As String = h.SessionFormXml   ' this already uses SKey("FormXML") in your helper

        Try
            dt.Columns.Add(New DataColumn("txtAdditionalCC"))
            Dim dr As DataRow
            'This loads the labor detail.
            Dim myDoc As New XmlDocument
            myDoc.InnerXml = h.SessionFormXml
            Dim ns As New XmlNamespaceManager(myDoc.NameTable)
            ns.AddNamespace("", _KDOTFormclass.myNamespace)

            Dim myDD As New DropDownList
            Dim myTB As New TextBox
            Dim myHF As New TextBox
            Dim myNav As XPathNavigator = myDoc.CreateNavigator()
            Dim myIT As XPathNodeIterator = myNav.Select("/Form0205/FormData/MemoPage/sectionCC/grpCC", ns)
            Dim myit2 As XPathNodeIterator = myIT.Current.SelectChildren(XPathNodeType.Element)
            If myIT.Count > 0 Then
                AddExtraRow = False
            End If
            While myIT.MoveNext()
                dr = dt.NewRow()
                myit2 = myIT.Current.SelectChildren(XPathNodeType.Element)
                Do While (myit2.MoveNext())
                    Dim myName As String = myit2.Current.Name
                    Dim myval As String = myit2.Current.Value
                    Try
                        dr(myName) = myval
                    Catch
                        'skip
                    End Try
                Loop

                dt.Rows.Add(dr)
            End While

            grdCC.DataSource = dt
            grdCC.DataBind()
            ViewState("grdCC") = dt
            Dim rowcount = 1
            For Each myrow As GridViewRow In grdCC.Rows
                'myDD = CType(myrow.FindControl("EmplChg"), DropDownList)
                'myDD.SelectedValue = dt.Rows(myrow.RowIndex)("EmplChg")

                'myDD = CType(myrow.FindControl("TaskChg"), DropDownList)
                'myDD.SelectedValue = dt.Rows(myrow.RowIndex)("TaskChg")
                'myDD = CType(myrow.FindControl("TimeHoursChg"), DropDownList)
                'myDD.SelectedValue = dt.Rows(myrow.RowIndex)("TimeHoursChg")
                'myDD = CType(myrow.FindControl("TimeMinsChg"), DropDownList)
                'myDD.SelectedValue = dt.Rows(myrow.RowIndex)("TimeMinsChg")

                myTB = myrow.FindControl("txtAdditionalCC")
                myTB.Text = dt.Rows(myrow.RowIndex)("txtAdditionalCC")
            Next
            If myIT.Count = 0 Or AddExtraRow = True Then
                AddNewCCRow()
            End If
        Catch ex As Exception
            File.AppendAllText(myLog, "exception in LoadCC: " & ex.Message & vbCrLf)
            File.AppendAllText(myLog, "exception in LoadCC: " & ex.StackTrace & vbCrLf)
        End Try
    End Sub

    Public Sub SaveCC()
        Dim formxml As New XmlDocument
        Dim h As New ASPFormHelper()
        Dim xml As String = h.SessionFormXml   ' this already uses SKey("FormXML") in your helper

        formxml.InnerXml = h.SessionFormXml
        Dim myNav As XPathNavigator = formxml.CreateNavigator()
        Dim ns As New XmlNamespaceManager(formxml.NameTable)
        ns.AddNamespace("", _KDOTFormclass.myNamespace)

        Dim iter As XPathNodeIterator = myNav.Select("/Form0205/FormData/MemoPage/sectionCC", ns)
        Dim group2NodesCount As Integer = iter.Count
        Dim lastGroup2NodeNav As XPathNavigator = myNav.SelectSingleNode("/Form0205/FormData/MemoPage/sectionCC" & "[" & group2NodesCount.ToString() & "]", ns)
        myNav.SelectSingleNode("/Form0205/FormData/MemoPage/sectionCC", ns).DeleteRange(lastGroup2NodeNav)
        myNav.SelectSingleNode("/Form0205/FormData/MemoPage", ns).AppendChildElement("", "sectionCC", _KDOTFormclass.myNamespace, String.Empty)

        Dim ct As Integer = grdCC.Rows.Count
        Dim dr As GridViewRow
        Dim myCC As New TextBox
        Dim myTotalTime As Decimal = 0
        Dim myGrandTotalTime As Decimal = 0
        For x = 0 To ct - 1
            dr = grdCC.Rows(x)
            myCC = dr.FindControl("txtAdditionalCC")
            'myRateChg = dr.FindControl("RateChg")
            'myLaborTotalChg = dr.FindControl("LaborTotalChg")
            'myTotalTime = (CDec(myTimeHrs.SelectedValue)) + CDec(myTimeMins.SelectedValue)
            'myGrandTotalTime = myGrandTotalTime + myTotalTime
            'If Not String.IsNullOrEmpty(myEmpl.SelectedValue) Then
            Using writer As XmlWriter = formxml.CreateNavigator().SelectSingleNode("/Form0205/FormData/MemoPage/sectionCC", ns).AppendChild()
                writer.WriteStartElement("grpCC", _KDOTFormclass.myNamespace)
                writer.WriteElementString("txtAdditionalCC", _KDOTFormclass.myNamespace, myCC.Text)

                writer.WriteEndElement()
                writer.Close()

            End Using
            'End If
        Next
        h.SessionFormXml = formxml.InnerXml
        '_aspFormHelper.UpdateXMLDocument("txtActualTime", myGrandTotalTime.ToString)
    End Sub

    Public Sub AddNewCCRow()
        Dim rowIndex As Integer = 0
        Dim dtCurrentTable As New DataTable
        dtCurrentTable = ViewState("grdCC")
        Dim dr As DataRow = Nothing
        If (dtCurrentTable.Rows.Count > 0) Then
            Dim i As Integer = 0
            Dim ct As Integer = dtCurrentTable.Rows.Count
            For i = 0 To ct - 1
                dr = dtCurrentTable.NewRow()
                Dim TBName As TextBox = grdCC.Rows(rowIndex).Cells(0).FindControl("txtAdditionalCC")
                'If String.IsNullOrEmpty(TBName.Text) Then TBName.Text = "false"
                'Dim DDName As DropDownList = grdAttendance.Rows(rowIndex).Cells(1).FindControl("EmplChg")
                'dtCurrentTable.Rows(i)("EmplChg") = DDName.SelectedValue
                'DDName = grdAttendance.Rows(rowIndex).Cells(2).FindControl("TaskChg")
                'dtCurrentTable.Rows(i)("TaskChg") = DDName.SelectedValue
                'DDName = grdAttendance.Rows(rowIndex).Cells(3).FindControl("TimeHoursChg")
                'dtCurrentTable.Rows(i)("TimeHoursChg") = DDName.SelectedValue
                'DDName = grdAttendance.Rows(rowIndex).Cells(4).FindControl("TimeMinsChg")
                'dtCurrentTable.Rows(i)("TimeMinsChg") = DDName.SelectedValue

                dtCurrentTable.Rows(i)("txtAdditionalCC") = TBName.Text
                rowIndex = rowIndex + 1
            Next
            dtCurrentTable.Rows.Add(dr)
            ViewState("grdCC") = dtCurrentTable
            grdCC.DataSource = dtCurrentTable
            grdCC.DataBind()
        Else
            dr = dtCurrentTable.NewRow()
            dr("txtAdditionalCC") = ""
            dtCurrentTable.Rows.Add(dr)
            ViewState("grdCC") = dtCurrentTable
            grdCC.DataSource = dtCurrentTable
            grdCC.DataBind()
        End If
        SetPreviousCCData()
    End Sub

    Public Sub SetPreviousCCData()
        Dim rowIndex As Integer = 0

        'If (ViewState("grdLabor") Is Nothing) Then
        ' Else
        Dim dt As DataTable = ViewState("grdCC")
        Dim i As Integer = 0
        Dim TBName As New TextBox
        If (dt.Rows.Count > 0) Then
            For i = 0 To dt.Rows.Count - 1
                TBName = grdCC.Rows(rowIndex).Cells(0).FindControl("txtAdditionalCC")
                TBName.Text = dt.Rows(i).Item("txtAdditionalCC").ToString
                'TBName.TabIndex = (rowIndex * 10) + 1
                rowIndex = rowIndex + 1
            Next
        End If
        ' End If
    End Sub


    Private Sub LoadAttendance()
        Dim dt As DataTable = TryCast(ViewState("grdAttendance"), DataTable)
        Dim h As New ASPFormHelper()
        Dim xml As String = h.SessionFormXml   ' this already uses SKey("FormXML") in your helper

        If dt Is Nothing Then
            dt = New DataTable()
            dt.Columns.Add("LineItemAttendence", GetType(Integer))
            dt.Columns.Add("AttendeeName", GetType(String))
            dt.Columns.Add("BusinessPhone", GetType(String))
            dt.Columns.Add("CellPhone", GetType(String))
            dt.Columns.Add("AttendeeOrg", GetType(String))
            dt.Columns.Add("emailaddress", GetType(String))

            ' Load XML data into dt
            Dim myDoc As New XmlDocument()
            myDoc.InnerXml = h.SessionFormXml
            Dim ns As New XmlNamespaceManager(myDoc.NameTable)
            ns.AddNamespace("", _KDOTFormclass.myNamespace)
            Dim myNav As XPathNavigator = myDoc.CreateNavigator()
            Dim myIT As XPathNodeIterator = myNav.Select("/Form0205/FormData/AttendenceSection/grpAttendence/tblAttendence", ns)

            While myIT.MoveNext()
                Dim dr As DataRow = dt.NewRow()
                Dim myit2 As XPathNodeIterator = myIT.Current.SelectChildren(XPathNodeType.Element)
                While myit2.MoveNext()
                    Try
                        dr(myit2.Current.Name) = myit2.Current.Value
                    Catch
                    End Try
                End While
                dt.Rows.Add(dr)
            End While

            ' Add one blank row if empty
            If dt.Rows.Count = 0 Then
                Dim dr As DataRow = dt.NewRow()
                dr("LineItemAttendence") = 1
                dt.Rows.Add(dr)
            End If

            ' Add line numbers
            For i As Integer = 0 To dt.Rows.Count - 1
                dt.Rows(i)("LineItemAttendence") = i + 1
            Next

            ViewState("grdAttendance") = dt
        End If

        grdAttendance.DataSource = dt
        grdAttendance.DataBind()

        ' Re-init clear buttons

        ScriptManager.RegisterStartupScript(Me, Me.GetType(),
    "initClearButtons_dom",
    "document.addEventListener('DOMContentLoaded', function(){ if (typeof initClearButtons==='function'){ initClearButtons(); } });",
    True)

    End Sub

    Private Sub SaveAttendee()
        Dim formxml As New XmlDocument
        Dim h As New ASPFormHelper()
        Dim xml As String = h.SessionFormXml   ' this already uses SKey("FormXML") in your helper

        formxml.InnerXml = h.SessionFormXml
        Dim myNav As XPathNavigator = formxml.CreateNavigator()
        Dim ns As New XmlNamespaceManager(formxml.NameTable)
        ns.AddNamespace("", _KDOTFormclass.myNamespace)

        Dim iter As XPathNodeIterator = myNav.Select("/Form0205/FormData/AttendenceSection/grpAttendence", ns)
        Dim group2NodesCount As Integer = iter.Count
        Dim lastGroup2NodeNav As XPathNavigator = myNav.SelectSingleNode("/Form0205/FormData/AttendenceSection/grpAttendence" & "[" & group2NodesCount.ToString() & "]", ns)
        myNav.SelectSingleNode("/Form0205/FormData/AttendenceSection/grpAttendence", ns).DeleteRange(lastGroup2NodeNav)
        myNav.SelectSingleNode("/Form0205/FormData/AttendenceSection", ns).AppendChildElement("", "grpAttendence", _KDOTFormclass.myNamespace, String.Empty)

        Dim ct As Integer = 0
        ct = grdAttendance.Rows.Count

        Dim dr As GridViewRow
        Dim myLine As New TextBox
        Dim myAttendee As New TextBox
        Dim myBisnessPhone As New TextBox
        Dim myCellPhone As New TextBox
        Dim myAttendeeOrg As New TextBox
        Dim myemail As New TextBox
        Dim myTotalTime As Decimal = 0
        Dim myGrandTotalTime As Decimal = 0
        For x = 0 To ct - 1
            dr = grdAttendance.Rows(x)
            myLine = dr.FindControl("LineItemAttendence")
            myAttendee = dr.FindControl("AttendeeName")
            myBisnessPhone = dr.FindControl("BusinessPhone")
            myCellPhone = dr.FindControl("CellPhone")
            myAttendeeOrg = dr.FindControl("AttendeeOrg")
            myemail = dr.FindControl("emailaddress")
            If Not String.IsNullOrEmpty(myAttendee.Text) Then
                Using writer As XmlWriter = formxml.CreateNavigator().SelectSingleNode("/Form0205/FormData/AttendenceSection/grpAttendence", ns).AppendChild()
                    writer.WriteStartElement("tblAttendence", _KDOTFormclass.myNamespace)
                    writer.WriteElementString("LineItemAttendence", _KDOTFormclass.myNamespace, myLine.Text)
                    writer.WriteElementString("AttendeeName", _KDOTFormclass.myNamespace, myAttendee.Text)
                    writer.WriteElementString("BusinessPhone", _KDOTFormclass.myNamespace, myBisnessPhone.Text)
                    writer.WriteElementString("CellPhone", _KDOTFormclass.myNamespace, myCellPhone.Text)
                    writer.WriteElementString("AttendeeOrg", _KDOTFormclass.myNamespace, myAttendeeOrg.Text)
                    writer.WriteElementString("emailaddress", _KDOTFormclass.myNamespace, myemail.Text)
                    writer.WriteEndElement()
                    writer.Close()
                End Using
            End If
            'End If
        Next
        h.SessionFormXml = formxml.InnerXml
    End Sub

    Private Sub AddNewAttendanceRow()
        Dim dt As DataTable = TryCast(ViewState("grdAttendance"), DataTable)
        If dt Is Nothing Then Exit Sub

        ' Add a new blank row
        Dim newRow As DataRow = dt.NewRow()
        newRow("LineItemAttendence") = dt.Rows.Count + 1
        newRow("AttendeeName") = ""
        newRow("BusinessPhone") = ""
        newRow("CellPhone") = ""
        newRow("AttendeeOrg") = ""
        newRow("emailaddress") = ""
        dt.Rows.Add(newRow)

        ' Save and rebind
        ViewState("grdAttendance") = dt
        grdAttendance.DataSource = dt
        grdAttendance.DataBind()

        ' Re-init clear buttons
        ScriptManager.RegisterStartupScript(Me, Me.GetType(),
    "initClearButtons_dom",
    "document.addEventListener('DOMContentLoaded', function(){ if (typeof initClearButtons==='function'){ initClearButtons(); } });",
    True)
    End Sub




    Public Sub SetPreviousAttendeeData()
        Dim rowIndex As Integer = 0

        Dim dt As DataTable = ViewState("grdAttendance")
        Dim i As Integer = 0
        Dim TBName As New TextBox
        If (dt.Rows.Count > 0) Then
            For i = 0 To dt.Rows.Count - 1
                TBName = grdAttendance.Rows(rowIndex).Cells(0).FindControl("LineItemAttendence")
                TBName.Text = i + 1
                TBName = grdAttendance.Rows(rowIndex).Cells(1).FindControl("AttendeeName")
                TBName.Text = dt.Rows(i).Item("AttendeeName").ToString
                TBName = grdAttendance.Rows(rowIndex).Cells(2).FindControl("BusinessPhone")
                TBName.Text = dt.Rows(i).Item("BusinessPhone").ToString
                TBName = grdAttendance.Rows(rowIndex).Cells(3).FindControl("CellPhone")
                TBName.Text = dt.Rows(i).Item("CellPhone").ToString
                TBName = grdAttendance.Rows(rowIndex).Cells(4).FindControl("AttendeeOrg")
                TBName.Text = dt.Rows(i).Item("AttendeeOrg").ToString
                TBName = grdAttendance.Rows(rowIndex).Cells(5).FindControl("emailaddress")
                TBName.Text = dt.Rows(i).Item("emailaddress").ToString
                rowIndex = rowIndex + 1
            Next
        End If
        ' End If
    End Sub


    Private Sub LoadUtility()
        Dim AddExtraRow As Boolean = True
        Dim dt As New DataTable
        Dim h As New ASPFormHelper()
        Dim xml As String = h.SessionFormXml   ' this already uses SKey("FormXML") in your helper

        Try
            dt.Columns.Add(New DataColumn("txtUtilityName"))
            dt.Columns.Add(New DataColumn("txtUtilityStatus"))
            dt.Columns.Add(New DataColumn("txtUtilityExpCompl"))
            dt.Columns.Add(New DataColumn("txtUtilityComments"))
            Dim dr As DataRow
            'This loads the labor detail.
            Dim myDoc As New XmlDocument
            myDoc.InnerXml = h.SessionFormXml
            Dim ns As New XmlNamespaceManager(myDoc.NameTable)
            ns.AddNamespace("", _KDOTFormclass.myNamespace)

            Dim myDD As New DropDownList
            Dim myTB As New TextBox
            Dim myHF As New TextBox
            Dim myNav As XPathNavigator = myDoc.CreateNavigator()
            Dim myIT As XPathNodeIterator = myNav.Select("/Form0205/FormData/mainSection/III_ROWUTIL/grpROW/grpUtility/tabUtility/tblUtility", ns)
            Dim myit2 As XPathNodeIterator = myIT.Current.SelectChildren(XPathNodeType.Element)
            If myIT.Count > 0 Then
                AddExtraRow = False
            End If
            While myIT.MoveNext()
                dr = dt.NewRow()
                myit2 = myIT.Current.SelectChildren(XPathNodeType.Element)
                Do While (myit2.MoveNext())
                    Dim myName As String = myit2.Current.Name
                    Dim myval As String = myit2.Current.Value
                    Try
                        dr(myName) = myval
                    Catch
                        'skip
                    End Try
                Loop

                dt.Rows.Add(dr)
            End While

            grdUtility.DataSource = dt
            grdUtility.DataBind()
            ViewState("grdUtility") = dt
            Dim rowcount = 1
            For Each myrow As GridViewRow In grdUtility.Rows
                'myDD = CType(myrow.FindControl("EmplChg"), DropDownList)
                'myDD.SelectedValue = dt.Rows(myrow.RowIndex)("EmplChg")

                'myDD = CType(myrow.FindControl("TaskChg"), DropDownList)
                'myDD.SelectedValue = dt.Rows(myrow.RowIndex)("TaskChg")
                'myDD = CType(myrow.FindControl("TimeHoursChg"), DropDownList)
                'myDD.SelectedValue = dt.Rows(myrow.RowIndex)("TimeHoursChg")
                'myDD = CType(myrow.FindControl("TimeMinsChg"), DropDownList)
                'myDD.SelectedValue = dt.Rows(myrow.RowIndex)("TimeMinsChg")

                rowcount = rowcount + 1
                myTB = myrow.FindControl("txtUtilityName")
                myTB.Text = dt.Rows(myrow.RowIndex)("txtUtilityName")
                myTB = myrow.FindControl("txtUtilityStatus")
                myTB.Text = dt.Rows(myrow.RowIndex)("txtUtilityStatus")
                myTB = myrow.FindControl("txtUtilityExpCompl")
                myTB.Text = dt.Rows(myrow.RowIndex)("txtUtilityExpCompl")
                myTB = myrow.FindControl("txtUtilityComments")
                myTB.Text = dt.Rows(myrow.RowIndex)("txtUtilityComments")
            Next
            If myIT.Count = 0 Or AddExtraRow = True Then
                AddNewAttendanceRow()
            End If
        Catch ex As Exception
            File.AppendAllText(myLog, "exception in LoadUtility: " & ex.Message & vbCrLf)
            File.AppendAllText(myLog, "exception in LoadUtility: " & ex.StackTrace & vbCrLf)
        End Try
    End Sub

    Private Sub SaveUtility()
        Dim formxml As New XmlDocument
        Dim h As New ASPFormHelper()
        Dim xml As String = h.SessionFormXml   ' this already uses SKey("FormXML") in your helper

        formxml.InnerXml = h.SessionFormXml
        Dim myNav As XPathNavigator = formxml.CreateNavigator()
        Dim ns As New XmlNamespaceManager(formxml.NameTable)
        ns.AddNamespace("", _KDOTFormclass.myNamespace)

        Dim iter As XPathNodeIterator = myNav.Select("/Form0205/FormData/mainSection/III_ROWUTIL/grpROW/grpUtility/tabUtility", ns)
        Dim group2NodesCount As Integer = iter.Count
        Dim lastGroup2NodeNav As XPathNavigator = myNav.SelectSingleNode("/Form0205/FormData/mainSection/III_ROWUTIL/grpROW/grpUtility/tabUtility" & "[" & group2NodesCount.ToString() & "]", ns)
        myNav.SelectSingleNode("/Form0205/FormData/mainSection/III_ROWUTIL/grpROW/grpUtility/tabUtility", ns).DeleteRange(lastGroup2NodeNav)
        myNav.SelectSingleNode("/Form0205/FormData/mainSection/III_ROWUTIL/grpROW/grpUtility", ns).AppendChildElement("", "tabUtility", _KDOTFormclass.myNamespace, String.Empty)

        Dim ct As Integer = grdUtility.Rows.Count
        Dim dr As GridViewRow
        Dim myLine As New TextBox
        Dim myAttendee As New TextBox
        Dim myBisnessPhone As New TextBox
        Dim myCellPhone As New TextBox
        Dim myAttendeeOrg As New TextBox
        Dim myemail As New TextBox
        Dim myTotalTime As Decimal = 0
        Dim myGrandTotalTime As Decimal = 0
        For x = 0 To ct - 1
            dr = grdUtility.Rows(x)
            myLine = dr.FindControl("txtUtilityName")
            myAttendee = dr.FindControl("txtUtilityStatus")
            myBisnessPhone = dr.FindControl("txtUtilityExpCompl")
            myCellPhone = dr.FindControl("txtUtilityComments")
            'myRateChg = dr.FindControl("RateChg")
            'myLaborTotalChg = dr.FindControl("LaborTotalChg")
            'myTotalTime = (CDec(myTimeHrs.SelectedValue)) + CDec(myTimeMins.SelectedValue)
            'myGrandTotalTime = myGrandTotalTime + myTotalTime
            'If Not String.IsNullOrEmpty(myEmpl.SelectedValue) Then
            Using writer As XmlWriter = formxml.CreateNavigator().SelectSingleNode("/Form0205/FormData/mainSection/III_ROWUTIL/grpROW/grpUtility/tabUtility", ns).AppendChild()
                writer.WriteStartElement("tblUtility", _KDOTFormclass.myNamespace)
                writer.WriteElementString("txtUtilityName", _KDOTFormclass.myNamespace, myLine.Text)
                writer.WriteElementString("txtUtilityStatus", _KDOTFormclass.myNamespace, myAttendee.Text)
                writer.WriteElementString("txtUtilityExpCompl", _KDOTFormclass.myNamespace, myBisnessPhone.Text)
                writer.WriteElementString("txtUtilityComments", _KDOTFormclass.myNamespace, myCellPhone.Text)

                writer.WriteEndElement()
                writer.Close()

            End Using
            'End If
        Next
        h.SessionFormXml = formxml.InnerXml
        '_aspFormHelper.UpdateXMLDocument("txtActualTime", myGrandTotalTime.ToString)
    End Sub

    Public Sub AddNewUtilityRow()
        Dim rowIndex As Integer = 0
        Dim dtCurrentTable As New DataTable
        dtCurrentTable = ViewState("grdUtility")
        Dim dr As DataRow = Nothing
        If (dtCurrentTable.Rows.Count > 0) Then
            Dim i As Integer = 0
            Dim ct As Integer = dtCurrentTable.Rows.Count
            For i = 0 To ct - 1
                dr = dtCurrentTable.NewRow()
                Dim TBName As TextBox = grdUtility.Rows(rowIndex).Cells(0).FindControl("txtUtilityName")
                'If String.IsNullOrEmpty(TBName.Text) Then TBName.Text = "false"
                dtCurrentTable.Rows(i)("txtUtilityName") = TBName.Text
                'Dim DDName As DropDownList = grdUtility.Rows(rowIndex).Cells(1).FindControl("EmplChg")
                'dtCurrentTable.Rows(i)("EmplChg") = DDName.SelectedValue
                'DDName = grdUtility.Rows(rowIndex).Cells(2).FindControl("TaskChg")
                'dtCurrentTable.Rows(i)("TaskChg") = DDName.SelectedValue
                'DDName = grdUtility.Rows(rowIndex).Cells(3).FindControl("TimeHoursChg")
                'dtCurrentTable.Rows(i)("TimeHoursChg") = DDName.SelectedValue
                'DDName = grdUtility.Rows(rowIndex).Cells(4).FindControl("TimeMinsChg")
                'dtCurrentTable.Rows(i)("TimeMinsChg") = DDName.SelectedValue

                TBName = grdUtility.Rows(rowIndex).Cells(1).FindControl("txtUtilityStatus")
                dtCurrentTable.Rows(i)("txtUtilityStatus") = TBName.Text
                TBName = grdUtility.Rows(rowIndex).Cells(2).FindControl("txtUtilityExpCompl")
                dtCurrentTable.Rows(i)("txtUtilityExpCompl") = TBName.Text
                TBName = grdUtility.Rows(rowIndex).Cells(3).FindControl("txtUtilityComments")
                dtCurrentTable.Rows(i)("txtUtilityComments") = TBName.Text
                rowIndex = rowIndex + 1
            Next
            dtCurrentTable.Rows.Add(dr)
            ViewState("grdUtility") = dtCurrentTable
            grdUtility.DataSource = dtCurrentTable
            grdUtility.DataBind()
        Else
            dr = dtCurrentTable.NewRow()
            dr("txtUtilityName") = ""
            dr("txtUtilityStatus") = ""
            dr("txtUtilityExpCompl") = ""
            dr("txtUtilityComments") = ""
            dtCurrentTable.Rows.Add(dr)
            ViewState("grdUtility") = dtCurrentTable
            grdUtility.DataSource = dtCurrentTable
            grdUtility.DataBind()
        End If
        'SetPreviousUtilityData()
    End Sub

    Public Sub SetPreviousUtilityData()
        Dim rowIndex As Integer = 0

        'If (ViewState("grdLabor") Is Nothing) Then
        ' Else
        Dim dt As DataTable = ViewState("grdUtility")
        Dim i As Integer = 0
        Dim TBName As New TextBox
        If (dt.Rows.Count > 0) Then
            For i = 0 To dt.Rows.Count - 1
                TBName = grdUtility.Rows(rowIndex).Cells(0).FindControl("txtUtilityName")
                TBName.Text = dt.Rows(i).Item("txtUtilityName").ToString
                'TBName.TabIndex = (rowIndex * 10)
                TBName = grdUtility.Rows(rowIndex).Cells(1).FindControl("txtUtilityStatus")
                TBName.Text = dt.Rows(i).Item("txtUtilityStatus").ToString
                'TBName.TabIndex = (rowIndex * 10) + 1
                TBName = grdUtility.Rows(rowIndex).Cells(2).FindControl("txtUtilityExpCompl")
                TBName.Text = dt.Rows(i).Item("txtUtilityExpCompl").ToString
                'TBName.TabIndex = (rowIndex * 10) + 2
                TBName = grdUtility.Rows(rowIndex).Cells(3).FindControl("txtUtilityComments")
                TBName.Text = dt.Rows(i).Item("txtUtilityComments").ToString
                'TBName.TabIndex = (rowIndex * 10) + 3
                rowIndex = rowIndex + 1
            Next
        End If
        ' End If
    End Sub


    Private Sub LoadRep()
        Dim AddExtraRow As Boolean = True
        Dim dt As New DataTable
        Dim h As New ASPFormHelper()
        Dim xml As String = h.SessionFormXml   ' this already uses SKey("FormXML") in your helper

        Try
            dt.Columns.Add(New DataColumn("txtCityOrg"))
            dt.Columns.Add(New DataColumn("txtCityTitle"))
            dt.Columns.Add(New DataColumn("txtCityContactName"))
            dt.Columns.Add(New DataColumn("txtCityPhone"))
            dt.Columns.Add(New DataColumn("txtCityCellPhone"))
            dt.Columns.Add(New DataColumn("txtCityEmail"))
            Dim dr As DataRow
            'This loads the labor detail.
            Dim myDoc As New XmlDocument
            myDoc.InnerXml = h.SessionFormXml
            Dim ns As New XmlNamespaceManager(myDoc.NameTable)
            ns.AddNamespace("", _KDOTFormclass.myNamespace)

            Dim myDD As New DropDownList
            Dim myTB As New TextBox
            Dim myHF As New TextBox
            Dim myNav As XPathNavigator = myDoc.CreateNavigator()
            Dim myIT As XPathNodeIterator = myNav.Select("/Form0205/FormData/mainSection/I_DelegationofAuthority/grpCityCntyReps", ns)
            Dim myit2 As XPathNodeIterator = myIT.Current.SelectChildren(XPathNodeType.Element)
            If myIT.Count > 0 Then
                AddExtraRow = False
            End If
            While myIT.MoveNext()
                dr = dt.NewRow()
                myit2 = myIT.Current.SelectChildren(XPathNodeType.Element)
                Do While (myit2.MoveNext())
                    Dim myName As String = myit2.Current.Name
                    Dim myval As String = myit2.Current.Value
                    Try
                        dr(myName) = myval
                    Catch
                        'skip
                    End Try
                Loop

                dt.Rows.Add(dr)
            End While

            grdRep.DataSource = dt
            grdRep.DataBind()
            ViewState("grdRep") = dt
            Dim rowcount = 1
            For Each myrow As GridViewRow In grdRep.Rows
                rowcount = rowcount + 1
                myTB = myrow.FindControl("txtCityOrg")
                myTB.Text = dt.Rows(myrow.RowIndex)("txtCityOrg")
                myTB = myrow.FindControl("txtCityTitle")
                myTB.Text = dt.Rows(myrow.RowIndex)("txtCityTitle")
                myTB = myrow.FindControl("txtCityContactName")
                myTB.Text = dt.Rows(myrow.RowIndex)("txtCityContactName")
                myTB = myrow.FindControl("txtCityPhone")
                myTB.Text = dt.Rows(myrow.RowIndex)("txtCityPhone")
                myTB = myrow.FindControl("txtCityCellPhone")
                myTB.Text = dt.Rows(myrow.RowIndex)("txtCityCellPhone")
                myTB = myrow.FindControl("txtCityEmail")
                myTB.Text = dt.Rows(myrow.RowIndex)("txtCityEmail")
            Next
            If myIT.Count = 0 Or AddExtraRow = True Then
                AddNewRepRow()
            End If
        Catch ex As Exception
            File.AppendAllText(myLog, "exception in LoadRep: " & ex.Message & vbCrLf)
            File.AppendAllText(myLog, "exception in LoadRep: " & ex.StackTrace & vbCrLf)
        End Try
    End Sub

    Private Sub SaveRep()
        Dim formxml As New XmlDocument
        Dim h As New ASPFormHelper()
        Dim xml As String = h.SessionFormXml   ' this already uses SKey("FormXML") in your helper

        formxml.InnerXml = h.SessionFormXml
        Dim myNav As XPathNavigator = formxml.CreateNavigator()
        Dim ns As New XmlNamespaceManager(formxml.NameTable)
        ns.AddNamespace("", _KDOTFormclass.myNamespace)

        Dim iter As XPathNodeIterator = myNav.Select("/Form0205/FormData/mainSection/I_DelegationofAuthority/grpRepresentative", ns)
        Dim group2NodesCount As Integer = iter.Count
        Dim lastGroup2NodeNav As XPathNavigator = myNav.SelectSingleNode("/Form0205/FormData/mainSection/I_DelegationofAuthority/grpRepresentative" & "[" & group2NodesCount.ToString() & "]", ns)
        myNav.SelectSingleNode("/Form0205/FormData/mainSection/I_DelegationofAuthority/grpRepresentative", ns).DeleteRange(lastGroup2NodeNav)
        myNav.SelectSingleNode("/Form0205/FormData/mainSection/I_DelegationofAuthority", ns).AppendChildElement("", "grpRepresentative", _KDOTFormclass.myNamespace, String.Empty)

        Dim ct As Integer = grdRep.Rows.Count
        myNav.SelectSingleNode("/Form0205/FormData/mainSection/I_DelegationofAuthority/CityCountyRepsCount", ns).InnerXml = ct
        Dim dr As GridViewRow
        Dim myOrg As New TextBox
        Dim myTitle As New TextBox
        Dim myName As New TextBox
        Dim myCityPhone As New TextBox
        Dim myCellPhone As New TextBox
        Dim myEmail As New TextBox
        Dim myTotalTime As Decimal = 0
        Dim myGrandTotalTime As Decimal = 0
        For x = 0 To ct - 1
            dr = grdRep.Rows(x)
            myOrg = dr.FindControl("txtCityOrg")
            myTitle = dr.FindControl("txtCityTitle")
            myName = dr.FindControl("txtCityContactName")
            myCityPhone = dr.FindControl("txtCityPhone")
            myCellPhone = dr.FindControl("txtCityCellPhone")
            myEmail = dr.FindControl("txtCityEmail")
            If ct = 1 And String.IsNullOrEmpty(myOrg.Text) And String.IsNullOrEmpty(myTitle.Text) And String.IsNullOrEmpty(myName.Text) And String.IsNullOrEmpty(myCityPhone.Text) And String.IsNullOrEmpty(myCellPhone.Text) And String.IsNullOrEmpty(myEmail.Text) Then
                myNav.SelectSingleNode("/Form0205/FormData/mainSection/I_DelegationofAuthority/CityCountyRepsCount", ns).InnerXml = 0
            End If
            Using writer As XmlWriter = formxml.CreateNavigator().SelectSingleNode("/Form0205/FormData/mainSection/I_DelegationofAuthority/grpRepresentative", ns).AppendChild()
                writer.WriteStartElement("grpCityCntyReps", _KDOTFormclass.myNamespace)
                writer.WriteElementString("txtCityOrg", _KDOTFormclass.myNamespace, myOrg.Text)
                writer.WriteElementString("txtCityTitle", _KDOTFormclass.myNamespace, myTitle.Text)
                writer.WriteElementString("txtCityContactName", _KDOTFormclass.myNamespace, myName.Text)
                writer.WriteElementString("txtCityPhone", _KDOTFormclass.myNamespace, myCityPhone.Text)
                writer.WriteElementString("txtCityCellPhone", _KDOTFormclass.myNamespace, myCellPhone.Text)
                writer.WriteElementString("txtCityEmail", _KDOTFormclass.myNamespace, myEmail.Text)

                writer.WriteEndElement()
                writer.Close()

            End Using
            'End If
        Next
        h.SessionFormXml = formxml.InnerXml
        '_aspFormHelper.UpdateXMLDocument("txtActualTime", myGrandTotalTime.ToString)
    End Sub

    Public Sub AddNewRepRow()
        Dim rowIndex As Integer = 0
        Dim dtCurrentTable As New DataTable
        dtCurrentTable = ViewState("grdRep")
        Dim dr As DataRow = Nothing
        If (dtCurrentTable.Rows.Count > 0) Then
            Dim i As Integer = 0
            Dim ct As Integer = dtCurrentTable.Rows.Count
            For i = 0 To ct - 1
                dr = dtCurrentTable.NewRow()
                Dim TBName As TextBox = grdRep.Rows(rowIndex).Cells(0).FindControl("txtCityOrg")
                'If String.IsNullOrEmpty(TBName.Text) Then TBName.Text = "false"
                dtCurrentTable.Rows(i)("txtCityOrg") = TBName.Text
                'Dim DDName As DropDownList = grdRep.Rows(rowIndex).Cells(1).FindControl("EmplChg")
                'dtCurrentTable.Rows(i)("EmplChg") = DDName.SelectedValue
                'DDName = grdRep.Rows(rowIndex).Cells(2).FindControl("TaskChg")
                'dtCurrentTable.Rows(i)("TaskChg") = DDName.SelectedValue
                'DDName = grdRep.Rows(rowIndex).Cells(3).FindControl("TimeHoursChg")
                'dtCurrentTable.Rows(i)("TimeHoursChg") = DDName.SelectedValue
                'DDName = grdRep.Rows(rowIndex).Cells(4).FindControl("TimeMinsChg")
                'dtCurrentTable.Rows(i)("TimeMinsChg") = DDName.SelectedValue

                TBName = grdRep.Rows(rowIndex).Cells(0).FindControl("txtCityTitle")
                dtCurrentTable.Rows(i)("txtCityTitle") = TBName.Text
                TBName = grdRep.Rows(rowIndex).Cells(1).FindControl("txtCityContactName")
                dtCurrentTable.Rows(i)("txtCityContactName") = TBName.Text
                TBName = grdRep.Rows(rowIndex).Cells(2).FindControl("txtCityPhone")
                dtCurrentTable.Rows(i)("txtCityPhone") = TBName.Text
                TBName = grdRep.Rows(rowIndex).Cells(3).FindControl("txtCityCellPhone")
                dtCurrentTable.Rows(i)("txtCityCellPhone") = TBName.Text
                TBName = grdRep.Rows(rowIndex).Cells(4).FindControl("txtCityEmail")
                dtCurrentTable.Rows(i)("txtCityEmail") = TBName.Text
                rowIndex = rowIndex + 1
            Next
            dtCurrentTable.Rows.Add(dr)
            ViewState("grdRep") = dtCurrentTable
            grdRep.DataSource = dtCurrentTable
            grdRep.DataBind()
        Else
            dr = dtCurrentTable.NewRow()
            dr("txtCityOrg") = ""
            dr("txtCityTitle") = ""
            dr("txtCityContactName") = ""
            dr("txtCityPhone") = ""
            dr("txtCityCellPhone") = ""
            dr("txtCityEmail") = ""
            dtCurrentTable.Rows.Add(dr)
            ViewState("grdRep") = dtCurrentTable
            grdRep.DataSource = dtCurrentTable
            grdRep.DataBind()
        End If
        SetPreviousRepData()
    End Sub

    Public Sub SetPreviousRepData()
        Dim rowIndex As Integer = 0

        'If (ViewState("grdLabor") Is Nothing) Then
        ' Else
        Dim dt As DataTable = ViewState("grdRep")
        Dim i As Integer = 0
        Dim TBName As New TextBox
        If (dt.Rows.Count > 0) Then
            For i = 0 To dt.Rows.Count - 1
                TBName = grdRep.Rows(rowIndex).Cells(0).FindControl("txtCityOrg")
                TBName.Text = dt.Rows(i).Item("txtCityOrg").ToString
                'TBName.TabIndex = (rowIndex * 10)
                TBName = grdRep.Rows(rowIndex).Cells(0).FindControl("txtCityTitle")
                TBName.Text = dt.Rows(i).Item("txtCityTitle").ToString
                'TBName.TabIndex = (rowIndex * 10) + 1
                TBName = grdRep.Rows(rowIndex).Cells(1).FindControl("txtCityContactName")
                TBName.Text = dt.Rows(i).Item("txtCityContactName").ToString
                'TBName.TabIndex = (rowIndex * 10) + 2
                TBName = grdRep.Rows(rowIndex).Cells(2).FindControl("txtCityPhone")
                TBName.Text = dt.Rows(i).Item("txtCityPhone").ToString
                'TBName.TabIndex = (rowIndex * 10) + 3
                TBName = grdRep.Rows(rowIndex).Cells(3).FindControl("txtCityCellPhone")
                TBName.Text = dt.Rows(i).Item("txtCityCellPhone").ToString
                'TBName.TabIndex = (rowIndex * 10) + 3
                TBName = grdRep.Rows(rowIndex).Cells(4).FindControl("txtCityEmail")
                TBName.Text = dt.Rows(i).Item("txtCityEmail").ToString
                'TBName.TabIndex = (rowIndex * 10) + 3
                rowIndex = rowIndex + 1
            Next
        End If
        ' End If
    End Sub


    Private Sub LoadSubcontractor()
        Dim AddExtraRow As Boolean = True
        Dim dt As New DataTable
        Dim h As New ASPFormHelper()
        Dim xml As String = h.SessionFormXml   ' this already uses SKey("FormXML") in your helper

        Try
            dt.Columns.Add(New DataColumn("txtSubcontractorName"))
            dt.Columns.Add(New DataColumn("txtSubcontractorPhone"))
            dt.Columns.Add(New DataColumn("txtSubcontractorWork"))
            Dim dr As DataRow
            'This loads the labor detail.
            Dim myDoc As New XmlDocument
            myDoc.InnerXml = h.SessionFormXml
            Dim ns As New XmlNamespaceManager(myDoc.NameTable)
            ns.AddNamespace("", _KDOTFormclass.myNamespace)

            Dim myDD As New DropDownList
            Dim myTB As New TextBox
            Dim myHF As New TextBox
            Dim myNav As XPathNavigator = myDoc.CreateNavigator()
            Dim myIT As XPathNodeIterator = myNav.Select("/Form0205/FormData/mainSection/IV_LaborCompliance/grpSubcontractor/grpIIASubcontractors", ns)
            Dim myit2 As XPathNodeIterator = myIT.Current.SelectChildren(XPathNodeType.Element)
            If myIT.Count > 0 Then
                AddExtraRow = False
            End If
            While myIT.MoveNext()
                dr = dt.NewRow()
                myit2 = myIT.Current.SelectChildren(XPathNodeType.Element)
                Do While (myit2.MoveNext())
                    Dim myName As String = myit2.Current.Name
                    Dim myval As String = myit2.Current.Value
                    Try
                        dr(myName) = myval
                    Catch
                        'skip
                    End Try
                Loop

                dt.Rows.Add(dr)
            End While

            grdSubcontractor.DataSource = dt
            grdSubcontractor.DataBind()
            ViewState("grdSubcontractor") = dt
            Dim rowcount = 1
            For Each myrow As GridViewRow In grdSubcontractor.Rows
                'myDD = CType(myrow.FindControl("EmplChg"), DropDownList)
                'myDD.SelectedValue = dt.Rows(myrow.RowIndex)("EmplChg")

                'myDD = CType(myrow.FindControl("TaskChg"), DropDownList)
                'myDD.SelectedValue = dt.Rows(myrow.RowIndex)("TaskChg")
                'myDD = CType(myrow.FindControl("TimeHoursChg"), DropDownList)
                'myDD.SelectedValue = dt.Rows(myrow.RowIndex)("TimeHoursChg")
                'myDD = CType(myrow.FindControl("TimeMinsChg"), DropDownList)
                'myDD.SelectedValue = dt.Rows(myrow.RowIndex)("TimeMinsChg")

                rowcount = rowcount + 1
                myTB = myrow.FindControl("txtSubcontractorName")
                myTB.Text = dt.Rows(myrow.RowIndex)("txtSubcontractorName")
                myTB = myrow.FindControl("txtSubcontractorPhone")
                myTB.Text = dt.Rows(myrow.RowIndex)("txtSubcontractorPhone")
                myTB = myrow.FindControl("txtSubcontractorWork")
                myTB.Text = dt.Rows(myrow.RowIndex)("txtSubcontractorWork")
            Next
            If myIT.Count = 0 Or AddExtraRow = True Then
                AddNewSubcontractorRow()
            End If
        Catch ex As Exception
            File.AppendAllText(myLog, "exception in LoadRep: " & ex.Message & vbCrLf)
            File.AppendAllText(myLog, "exception in LoadRep: " & ex.StackTrace & vbCrLf)
        End Try
    End Sub

    Private Sub SaveSubcontractor()
        Dim formxml As New XmlDocument
        Dim h As New ASPFormHelper()
        Dim xml As String = h.SessionFormXml   ' this already uses SKey("FormXML") in your helper

        formxml.InnerXml = h.SessionFormXml
        Dim myNav As XPathNavigator = formxml.CreateNavigator()
        Dim ns As New XmlNamespaceManager(formxml.NameTable)
        ns.AddNamespace("", _KDOTFormclass.myNamespace)

        Dim iter As XPathNodeIterator = myNav.Select("/Form0205/FormData/mainSection/IV_LaborCompliance", ns)
        Dim group2NodesCount As Integer = iter.Count
        Dim lastGroup2NodeNav As XPathNavigator = myNav.SelectSingleNode("/Form0205/FormData/mainSection/IV_LaborCompliance/grpSubcontractor" & "[" & group2NodesCount.ToString() & "]", ns)
        myNav.SelectSingleNode("/Form0205/FormData/mainSection/IV_LaborCompliance/grpSubcontractor", ns).DeleteRange(lastGroup2NodeNav)
        myNav.SelectSingleNode("/Form0205/FormData/mainSection/IV_LaborCompliance", ns).AppendChildElement("", "grpSubcontractor", _KDOTFormclass.myNamespace, String.Empty)

        Dim ct As Integer = grdSubcontractor.Rows.Count
        Dim dr As GridViewRow
        Dim myName As New TextBox
        Dim myPhone As New TextBox
        Dim myWork As New TextBox
        Dim myTotalTime As Decimal = 0
        Dim myGrandTotalTime As Decimal = 0
        For x = 0 To ct - 1
            dr = grdSubcontractor.Rows(x)
            myName = dr.FindControl("txtSubcontractorName")
            myPhone = dr.FindControl("txtSubcontractorPhone")
            myWork = dr.FindControl("txtSubcontractorWork")
            If Not String.IsNullOrEmpty(myName.Text) Then
                Using writer As XmlWriter = formxml.CreateNavigator().SelectSingleNode("/Form0205/FormData/mainSection/IV_LaborCompliance/grpSubcontractor", ns).AppendChild()
                    writer.WriteStartElement("grpIIASubcontractors", _KDOTFormclass.myNamespace)
                    writer.WriteElementString("txtSubcontractorName", _KDOTFormclass.myNamespace, myName.Text)
                    writer.WriteElementString("txtSubcontractorPhone", _KDOTFormclass.myNamespace, myPhone.Text)
                    writer.WriteElementString("txtSubcontractorWork", _KDOTFormclass.myNamespace, myWork.Text)

                    writer.WriteEndElement()
                    writer.Close()
                End Using
            End If
        Next
        h.SessionFormXml = formxml.InnerXml
    End Sub

    Public Sub AddNewSubcontractorRow()
        Dim rowIndex As Integer = 0
        Dim dtCurrentTable As New DataTable
        dtCurrentTable = ViewState("grdSubcontractor")
        Dim dr As DataRow = Nothing
        If (dtCurrentTable.Rows.Count > 0) Then
            Dim i As Integer = 0
            Dim ct As Integer = dtCurrentTable.Rows.Count
            For i = 0 To ct - 1
                dr = dtCurrentTable.NewRow()
                Dim TBName As TextBox = grdSubcontractor.Rows(rowIndex).Cells(0).FindControl("txtSubcontractorName")
                'If String.IsNullOrEmpty(TBName.Text) Then TBName.Text = "false"
                dtCurrentTable.Rows(i)("txtSubcontractorName") = TBName.Text
                'Dim DDName As DropDownList = grdSubcontractor.Rows(rowIndex).Cells(1).FindControl("EmplChg")
                'dtCurrentTable.Rows(i)("EmplChg") = DDName.SelectedValue
                'DDName = grdSubcontractor.Rows(rowIndex).Cells(2).FindControl("TaskChg")
                'dtCurrentTable.Rows(i)("TaskChg") = DDName.SelectedValue
                'DDName = grdSubcontractor.Rows(rowIndex).Cells(3).FindControl("TimeHoursChg")
                'dtCurrentTable.Rows(i)("TimeHoursChg") = DDName.SelectedValue
                'DDName = grdSubcontractor.Rows(rowIndex).Cells(4).FindControl("TimeMinsChg")
                'dtCurrentTable.Rows(i)("TimeMinsChg") = DDName.SelectedValue

                TBName = grdSubcontractor.Rows(rowIndex).Cells(1).FindControl("txtSubcontractorPhone")
                dtCurrentTable.Rows(i)("txtSubcontractorPhone") = TBName.Text
                TBName = grdSubcontractor.Rows(rowIndex).Cells(2).FindControl("txtSubcontractorWork")
                dtCurrentTable.Rows(i)("txtSubcontractorWork") = TBName.Text
                rowIndex = rowIndex + 1
            Next
            dtCurrentTable.Rows.Add(dr)
            ViewState("grdSubcontractor") = dtCurrentTable
            grdSubcontractor.DataSource = dtCurrentTable
            grdSubcontractor.DataBind()
        Else
            dr = dtCurrentTable.NewRow()
            dr("txtSubcontractorName") = ""
            dr("txtSubcontractorPhone") = ""
            dr("txtSubcontractorWork") = ""
            dtCurrentTable.Rows.Add(dr)
            ViewState("grdSubcontractor") = dtCurrentTable
            grdSubcontractor.DataSource = dtCurrentTable
            grdSubcontractor.DataBind()
        End If
        SetPreviousSubcontractorData()
    End Sub

    Public Sub SetPreviousSubcontractorData()
        Dim rowIndex As Integer = 0

        'If (ViewState("grdLabor") Is Nothing) Then
        ' Else
        Dim dt As DataTable = ViewState("grdSubcontractor")
        Dim i As Integer = 0
        Dim TBName As New TextBox
        If (dt.Rows.Count > 0) Then
            For i = 0 To dt.Rows.Count - 1
                TBName = grdSubcontractor.Rows(rowIndex).Cells(0).FindControl("txtSubcontractorName")
                TBName.Text = dt.Rows(i).Item("txtSubcontractorName").ToString
                'TBName.TabIndex = (rowIndex * 10)
                TBName = grdSubcontractor.Rows(rowIndex).Cells(1).FindControl("txtSubcontractorPhone")
                TBName.Text = dt.Rows(i).Item("txtSubcontractorPhone").ToString
                'TBName.TabIndex = (rowIndex * 10) + 2
                TBName = grdSubcontractor.Rows(rowIndex).Cells(2).FindControl("txtSubcontractorWork")
                TBName.Text = dt.Rows(i).Item("txtSubcontractorWork").ToString
                'TBName.TabIndex = (rowIndex * 10) + 3
                rowIndex = rowIndex + 1
            Next
        End If
        ' End If
    End Sub


    Private Sub LoadContact()
        Dim AddExtraRow As Boolean = True
        Dim dt As New DataTable
        Dim h As New ASPFormHelper()
        Dim xml As String = h.SessionFormXml   ' this already uses SKey("FormXML") in your helper

        Try
            dt.Columns.Add(New DataColumn("txtKDOTContact"))
            dt.Columns.Add(New DataColumn("txtKDOTContactPhone"))
            Dim dr As DataRow
            'This loads the labor detail.
            Dim myDoc As New XmlDocument
            myDoc.InnerXml = h.SessionFormXml
            Dim ns As New XmlNamespaceManager(myDoc.NameTable)
            ns.AddNamespace("", _KDOTFormclass.myNamespace)

            Dim myDD As New DropDownList
            Dim myTB As New TextBox
            Dim myHF As New TextBox
            Dim myNav As XPathNavigator = myDoc.CreateNavigator()
            Dim myIT As XPathNodeIterator = myNav.Select("/Form0205/FormData/mainSection/VI_TrafficControl/grpKDOTContacts/grpKDOTContact", ns)
            Dim myit2 As XPathNodeIterator = myIT.Current.SelectChildren(XPathNodeType.Element)
            If myIT.Count > 0 Then
                AddExtraRow = False
            End If
            While myIT.MoveNext()
                dr = dt.NewRow()
                myit2 = myIT.Current.SelectChildren(XPathNodeType.Element)
                Do While (myit2.MoveNext())
                    Dim myName As String = myit2.Current.Name
                    Dim myval As String = myit2.Current.Value
                    Try
                        dr(myName) = myval
                    Catch
                        'skip
                    End Try
                Loop

                dt.Rows.Add(dr)
            End While

            grdContact.DataSource = dt
            grdContact.DataBind()
            ViewState("grdContact") = dt
            Dim rowcount = 1
            For Each myrow As GridViewRow In grdContact.Rows
                rowcount = rowcount + 1
                myTB = myrow.FindControl("txtKDOTContact")
                myTB.Text = dt.Rows(myrow.RowIndex)("txtKDOTContact")
                myTB = myrow.FindControl("txtKDOTContactPhone")
                myTB.Text = dt.Rows(myrow.RowIndex)("txtKDOTContactPhone")
            Next
            If myIT.Count = 0 Or AddExtraRow = True Then
                AddNewContactRow()
            End If
        Catch ex As Exception
            File.AppendAllText(myLog, "exception in LoadContact: " & ex.Message & vbCrLf)
            File.AppendAllText(myLog, "exception in LoadContact: " & ex.StackTrace & vbCrLf)
        End Try
    End Sub

    Private Sub SaveContact()
        Dim formxml As New XmlDocument
        Dim h As New ASPFormHelper()
        Dim xml As String = h.SessionFormXml   ' this already uses SKey("FormXML") in your helper

        formxml.InnerXml = h.SessionFormXml
        Dim myNav As XPathNavigator = formxml.CreateNavigator()
        Dim ns As New XmlNamespaceManager(formxml.NameTable)
        ns.AddNamespace("", _KDOTFormclass.myNamespace)

        Dim iter As XPathNodeIterator = myNav.Select("/Form0205/FormData/mainSection/VI_TrafficControl/grpKDOTContacts", ns)
        Dim group2NodesCount As Integer = iter.Count
        Dim lastGroup2NodeNav As XPathNavigator = myNav.SelectSingleNode("/Form0205/FormData/mainSection/VI_TrafficControl/grpKDOTContacts" & "[" & group2NodesCount.ToString() & "]", ns)
        myNav.SelectSingleNode("/Form0205/FormData/mainSection/VI_TrafficControl/grpKDOTContacts", ns).DeleteRange(lastGroup2NodeNav)
        myNav.SelectSingleNode("/Form0205/FormData/mainSection/VI_TrafficControl", ns).AppendChildElement("", "grpKDOTContacts", _KDOTFormclass.myNamespace, String.Empty)

        Dim ct As Integer = grdContact.Rows.Count
        Dim dr As GridViewRow
        Dim myContact As New TextBox
        Dim myPhone As New TextBox
        Dim myTotalTime As Decimal = 0
        Dim myGrandTotalTime As Decimal = 0
        For x = 0 To ct - 1
            dr = grdContact.Rows(x)
            myContact = dr.FindControl("txtKDOTContact")
            myPhone = dr.FindControl("txtKDOTContactPhone")
            'myRateChg = dr.FindControl("RateChg")
            'myLaborTotalChg = dr.FindControl("LaborTotalChg")
            'myTotalTime = (CDec(myTimeHrs.SelectedValue)) + CDec(myTimeMins.SelectedValue)
            'myGrandTotalTime = myGrandTotalTime + myTotalTime
            'If Not String.IsNullOrEmpty(myEmpl.SelectedValue) Then
            Using writer As XmlWriter = formxml.CreateNavigator().SelectSingleNode("/Form0205/FormData/mainSection/VI_TrafficControl/grpKDOTContacts", ns).AppendChild()
                writer.WriteStartElement("grpKDOTContact", _KDOTFormclass.myNamespace)
                writer.WriteElementString("txtKDOTContact", _KDOTFormclass.myNamespace, myContact.Text)
                writer.WriteElementString("txtKDOTContactPhone", _KDOTFormclass.myNamespace, myPhone.Text)

                writer.WriteEndElement()
                writer.Close()

            End Using
            'End If
        Next
        h.SessionFormXml = formxml.InnerXml
        '_aspFormHelper.UpdateXMLDocument("txtActualTime", myGrandTotalTime.ToString)
    End Sub

    Public Sub AddNewContactRow()
        Dim rowIndex As Integer = 0
        Dim dtCurrentTable As New DataTable
        dtCurrentTable = ViewState("grdContact")
        Dim dr As DataRow = Nothing
        If (dtCurrentTable.Rows.Count > 0) Then
            Dim i As Integer = 0
            Dim ct As Integer = dtCurrentTable.Rows.Count
            For i = 0 To ct - 1
                dr = dtCurrentTable.NewRow()
                Dim TBName As TextBox = grdContact.Rows(rowIndex).Cells(0).FindControl("txtKDOTContact")
                'If String.IsNullOrEmpty(TBName.Text) Then TBName.Text = "false"
                dtCurrentTable.Rows(i)("txtKDOTContact") = TBName.Text
                'Dim DDName As DropDownList = grdContact.Rows(rowIndex).Cells(1).FindControl("EmplChg")
                'dtCurrentTable.Rows(i)("EmplChg") = DDName.SelectedValue
                'DDName = grdContact.Rows(rowIndex).Cells(2).FindControl("TaskChg")
                'dtCurrentTable.Rows(i)("TaskChg") = DDName.SelectedValue
                'DDName = grdContact.Rows(rowIndex).Cells(3).FindControl("TimeHoursChg")
                'dtCurrentTable.Rows(i)("TimeHoursChg") = DDName.SelectedValue
                'DDName = grdContact.Rows(rowIndex).Cells(4).FindControl("TimeMinsChg")
                'dtCurrentTable.Rows(i)("TimeMinsChg") = DDName.SelectedValue

                TBName = grdContact.Rows(rowIndex).Cells(1).FindControl("txtKDOTContactPhone")
                dtCurrentTable.Rows(i)("txtKDOTContactPhone") = TBName.Text
                rowIndex = rowIndex + 1
            Next
            dtCurrentTable.Rows.Add(dr)
            ViewState("grdContact") = dtCurrentTable
            grdContact.DataSource = dtCurrentTable
            grdContact.DataBind()
        Else
            dr = dtCurrentTable.NewRow()
            dr("txtKDOTContact") = ""
            dr("txtKDOTContactPhone") = ""
            dtCurrentTable.Rows.Add(dr)
            ViewState("grdContact") = dtCurrentTable
            grdContact.DataSource = dtCurrentTable
            grdContact.DataBind()
        End If
        SetPreviousContactData()
    End Sub

    Public Sub SetPreviousContactData()
        Dim rowIndex As Integer = 0

        'If (ViewState("grdLabor") Is Nothing) Then
        ' Else
        Dim dt As DataTable = ViewState("grdContact")
        Dim i As Integer = 0
        Dim TBName As New TextBox
        If (dt.Rows.Count > 0) Then
            For i = 0 To dt.Rows.Count - 1
                TBName = grdContact.Rows(rowIndex).Cells(0).FindControl("txtKDOTContact")
                TBName.Text = dt.Rows(i).Item("txtKDOTContact").ToString
                'TBName.TabIndex = (rowIndex * 10)
                TBName = grdContact.Rows(rowIndex).Cells(1).FindControl("txtKDOTContactPhone")
                TBName.Text = dt.Rows(i).Item("txtKDOTContactPhone").ToString
                'TBName.TabIndex = (rowIndex * 10) + 2
                rowIndex = rowIndex + 1
            Next
        End If
        ' End If
    End Sub


    Private Sub LoadMaterial()
        Dim AddExtraRow As Boolean = True
        Dim dt As New DataTable
        Dim h As New ASPFormHelper()
        Dim xml As String = h.SessionFormXml   ' this already uses SKey("FormXML") in your helper

        Try
            dt.Columns.Add(New DataColumn("txtSupplier"))
            dt.Columns.Add(New DataColumn("txtMaterial"))
            dt.Columns.Add(New DataColumn("txtMatLocation"))
            Dim dr As DataRow
            'This loads the labor detail.
            Dim myDoc As New XmlDocument
            myDoc.InnerXml = h.SessionFormXml
            Dim ns As New XmlNamespaceManager(myDoc.NameTable)
            ns.AddNamespace("", _KDOTFormclass.myNamespace)

            Dim myDD As New DropDownList
            Dim myTB As New TextBox
            Dim myHF As New TextBox
            Dim myNav As XPathNavigator = myDoc.CreateNavigator()
            Dim myIT As XPathNodeIterator = myNav.Select("/Form0205/FormData/mainSection/VII_ProjectMaterials/grpMaterials/tblMaterials", ns)
            Dim myit2 As XPathNodeIterator = myIT.Current.SelectChildren(XPathNodeType.Element)
            If myIT.Count > 0 Then
                AddExtraRow = False
            End If
            While myIT.MoveNext()
                dr = dt.NewRow()
                myit2 = myIT.Current.SelectChildren(XPathNodeType.Element)
                Do While (myit2.MoveNext())
                    Dim myName As String = myit2.Current.Name
                    Dim myval As String = myit2.Current.Value
                    Try
                        dr(myName) = myval
                    Catch
                        'skip
                    End Try
                Loop

                dt.Rows.Add(dr)
            End While

            grpMaterial.DataSource = dt
            grpMaterial.DataBind()
            ViewState("grpMaterial") = dt
            Dim rowcount = 1
            For Each myrow As GridViewRow In grpMaterial.Rows
                'myDD = CType(myrow.FindControl("EmplChg"), DropDownList)
                'myDD.SelectedValue = dt.Rows(myrow.RowIndex)("EmplChg")

                'myDD = CType(myrow.FindControl("TaskChg"), DropDownList)
                'myDD.SelectedValue = dt.Rows(myrow.RowIndex)("TaskChg")
                'myDD = CType(myrow.FindControl("TimeHoursChg"), DropDownList)
                'myDD.SelectedValue = dt.Rows(myrow.RowIndex)("TimeHoursChg")
                'myDD = CType(myrow.FindControl("TimeMinsChg"), DropDownList)
                'myDD.SelectedValue = dt.Rows(myrow.RowIndex)("TimeMinsChg")

                rowcount = rowcount + 1
                myTB = myrow.FindControl("txtSupplier")
                myTB.Text = dt.Rows(myrow.RowIndex)("txtSupplier")
                myTB = myrow.FindControl("txtMaterial")
                myTB.Text = dt.Rows(myrow.RowIndex)("txtMaterial")
                myTB = myrow.FindControl("txtMatLocation")
                myTB.Text = dt.Rows(myrow.RowIndex)("txtMatLocation")
            Next
            If myIT.Count = 0 Or AddExtraRow = True Then
                AddNewContactRow()
            End If
        Catch ex As Exception
            File.AppendAllText(myLog, "exception in LoadContact: " & ex.Message & vbCrLf)
            File.AppendAllText(myLog, "exception in LoadContact: " & ex.StackTrace & vbCrLf)
        End Try
    End Sub

    Private Sub SaveMaterial()
        Dim formxml As New XmlDocument
        Dim h As New ASPFormHelper()
        Dim xml As String = h.SessionFormXml   ' this already uses SKey("FormXML") in your helper

        formxml.InnerXml = h.SessionFormXml
        Dim myNav As XPathNavigator = formxml.CreateNavigator()
        Dim ns As New XmlNamespaceManager(formxml.NameTable)
        ns.AddNamespace("", _KDOTFormclass.myNamespace)

        Dim iter As XPathNodeIterator = myNav.Select("/Form0205/FormData/mainSection/VII_ProjectMaterials/grpMaterials", ns)
        Dim group2NodesCount As Integer = iter.Count
        Dim lastGroup2NodeNav As XPathNavigator = myNav.SelectSingleNode("/Form0205/FormData/mainSection/VII_ProjectMaterials/grpMaterials" & "[" & group2NodesCount.ToString() & "]", ns)
        myNav.SelectSingleNode("/Form0205/FormData/mainSection/VII_ProjectMaterials/grpMaterials", ns).DeleteRange(lastGroup2NodeNav)
        myNav.SelectSingleNode("/Form0205/FormData/mainSection/VII_ProjectMaterials", ns).AppendChildElement("", "grpMaterials", _KDOTFormclass.myNamespace, String.Empty)

        Dim ct As Integer = grpMaterial.Rows.Count
        Dim dr As GridViewRow
        Dim mySupplier As New TextBox
        Dim myMaterial As New TextBox
        Dim myLocation As New TextBox
        Dim myTotalTime As Decimal = 0
        Dim myGrandTotalTime As Decimal = 0
        For x = 0 To ct - 1
            dr = grpMaterial.Rows(x)
            mySupplier = dr.FindControl("txtSupplier")
            myMaterial = dr.FindControl("txtMaterial")
            myLocation = dr.FindControl("txtMatLocation")
            'myRateChg = dr.FindControl("RateChg")
            'myLaborTotalChg = dr.FindControl("LaborTotalChg")
            'myTotalTime = (CDec(myTimeHrs.SelectedValue)) + CDec(myTimeMins.SelectedValue)
            'myGrandTotalTime = myGrandTotalTime + myTotalTime
            'If Not String.IsNullOrEmpty(myEmpl.SelectedValue) Then
            Using writer As XmlWriter = formxml.CreateNavigator().SelectSingleNode("/Form0205/FormData/mainSection/VII_ProjectMaterials/grpMaterials", ns).AppendChild()
                writer.WriteStartElement("tblMaterials", _KDOTFormclass.myNamespace)
                writer.WriteElementString("txtSupplier", _KDOTFormclass.myNamespace, mySupplier.Text)
                writer.WriteElementString("txtMaterial", _KDOTFormclass.myNamespace, myMaterial.Text)
                writer.WriteElementString("txtMatLocation", _KDOTFormclass.myNamespace, myLocation.Text)

                writer.WriteEndElement()
                writer.Close()

            End Using
            'End If
        Next
        h.SessionFormXml = formxml.InnerXml
        '_aspFormHelper.UpdateXMLDocument("txtActualTime", myGrandTotalTime.ToString)
    End Sub

    Public Sub AddNewMaterialRow()
        Dim rowIndex As Integer = 0
        Dim dtCurrentTable As New DataTable
        dtCurrentTable = ViewState("grpMaterial")
        Dim dr As DataRow = Nothing
        If (dtCurrentTable.Rows.Count > 0) Then
            Dim i As Integer = 0
            Dim ct As Integer = dtCurrentTable.Rows.Count
            For i = 0 To ct - 1
                dr = dtCurrentTable.NewRow()
                Dim TBName As TextBox = grpMaterial.Rows(rowIndex).Cells(0).FindControl("txtSupplier")
                'If String.IsNullOrEmpty(TBName.Text) Then TBName.Text = "false"
                dtCurrentTable.Rows(i)("txtSupplier") = TBName.Text
                'Dim DDName As DropDownList = grpMaterial.Rows(rowIndex).Cells(1).FindControl("EmplChg")
                'dtCurrentTable.Rows(i)("EmplChg") = DDName.SelectedValue
                'DDName = grpMaterial.Rows(rowIndex).Cells(2).FindControl("TaskChg")
                'dtCurrentTable.Rows(i)("TaskChg") = DDName.SelectedValue
                'DDName = grpMaterial.Rows(rowIndex).Cells(3).FindControl("TimeHoursChg")
                'dtCurrentTable.Rows(i)("TimeHoursChg") = DDName.SelectedValue
                'DDName = grpMaterial.Rows(rowIndex).Cells(4).FindControl("TimeMinsChg")
                'dtCurrentTable.Rows(i)("TimeMinsChg") = DDName.SelectedValue

                TBName = grpMaterial.Rows(rowIndex).Cells(1).FindControl("txtMaterial")
                dtCurrentTable.Rows(i)("txtMaterial") = TBName.Text
                TBName = grpMaterial.Rows(rowIndex).Cells(2).FindControl("txtMatLocation")
                dtCurrentTable.Rows(i)("txtMatLocation") = TBName.Text
                rowIndex = rowIndex + 1
            Next
            dtCurrentTable.Rows.Add(dr)
            ViewState("grpMaterial") = dtCurrentTable
            grpMaterial.DataSource = dtCurrentTable
            grpMaterial.DataBind()
        Else
            dr = dtCurrentTable.NewRow()
            dr("txtSupplier") = ""
            dr("txtMaterial") = ""
            dr("txtMatLocation") = ""
            dtCurrentTable.Rows.Add(dr)
            ViewState("grpMaterial") = dtCurrentTable
            grpMaterial.DataSource = dtCurrentTable
            grpMaterial.DataBind()
        End If
        SetPreviousMaterialData()
    End Sub

    Public Sub SetPreviousMaterialData()
        Dim rowIndex As Integer = 0

        'If (ViewState("grdLabor") Is Nothing) Then
        ' Else
        Dim dt As DataTable = ViewState("grpMaterial")
        Dim i As Integer = 0
        Dim TBName As New TextBox
        If (dt.Rows.Count > 0) Then
            For i = 0 To dt.Rows.Count - 1
                TBName = grpMaterial.Rows(rowIndex).Cells(0).FindControl("txtSupplier")
                TBName.Text = dt.Rows(i).Item("txtSupplier").ToString
                'TBName.TabIndex = (rowIndex * 10)
                TBName = grpMaterial.Rows(rowIndex).Cells(1).FindControl("txtMaterial")
                TBName.Text = dt.Rows(i).Item("txtMaterial").ToString
                'TBName.TabIndex = (rowIndex * 10) + 2
                TBName = grpMaterial.Rows(rowIndex).Cells(1).FindControl("txtMatLocation")
                TBName.Text = dt.Rows(i).Item("txtMatLocation").ToString
                'TBName.TabIndex = (rowIndex * 10) + 2
                rowIndex = rowIndex + 1
            Next
        End If
        ' End If
    End Sub

    'Protected Sub AddAttendee_Click(sender As Object, e As EventArgs) Handles AddAttendee.Click
    '    AddNewAttendanceRow()
    'End Sub
    Protected Sub AddAttendee_Click(sender As Object, e As EventArgs) Handles AddAttendee.Click

        Dim dtCurrentTable As DataTable = TryCast(ViewState("grdAttendance"), DataTable)
        If dtCurrentTable Is Nothing Then
            LoadAttendance()
            dtCurrentTable = TryCast(ViewState("grdAttendance"), DataTable)
        End If

        For i As Integer = 0 To grdAttendance.Rows.Count - 1
            Dim row As GridViewRow = grdAttendance.Rows(i)
            dtCurrentTable.Rows(i)("AttendeeName") = CType(row.FindControl("AttendeeName"), TextBox).Text
            dtCurrentTable.Rows(i)("BusinessPhone") = CType(row.FindControl("BusinessPhone"), TextBox).Text
            dtCurrentTable.Rows(i)("CellPhone") = CType(row.FindControl("CellPhone"), TextBox).Text
            dtCurrentTable.Rows(i)("AttendeeOrg") = CType(row.FindControl("AttendeeOrg"), TextBox).Text
            dtCurrentTable.Rows(i)("emailaddress") = CType(row.FindControl("emailaddress"), TextBox).Text
        Next
        ViewState("grdAttendance") = dtCurrentTable
        hfAttendanceData.Value = JsonConvert.SerializeObject(dtCurrentTable)
        AddNewAttendanceRow()
    End Sub

    'Protected Sub BusinessPhone_TextChanged(sender As Object, e As EventArgs) Handles BusinessPhone.TextChanged
    '  BusinessPhone.Text = _aspFormHelper.FormatPhone(BusinessPhone.Text)
    '  _aspFormHelper.UpdateXMLDocument("BusinessPhone", BusinessPhone.Text)
    'End Sub

    Protected Sub Phone_TextChanged(sender As Object, e As EventArgs)
        sender.Text = _aspFormHelper.FormatPhone(sender.Text)
        _aspFormHelper.UpdateXMLDocument(sender.ID, sender.Text)
    End Sub


    Protected Sub txtIC1ProjSuperPhone_TextChanged(sender As Object, e As EventArgs) Handles txtIC1ProjSuperPhone.TextChanged
        txtIC1ProjSuperPhone.Text = _aspFormHelper.FormatPhone(txtIC1ProjSuperPhone.Text)
        _aspFormHelper.UpdateXMLDocument("txtIC1ProjSuperPhone", txtIC1ProjSuperPhone.Text)
    End Sub

    Protected Sub txtIC1ProjSuperCell_TextChanged(sender As Object, e As EventArgs) Handles txtIC1ProjSuperCell.TextChanged
        txtIC1ProjSuperCell.Text = _aspFormHelper.FormatPhone(txtIC1ProjSuperCell.Text)
        _aspFormHelper.UpdateXMLDocument("txtIC1ProjSuperCell", txtIC1ProjSuperCell.Text)
    End Sub

    Protected Sub txtIC1GenSuperPhone_TextChanged(sender As Object, e As EventArgs) Handles txtIC1GenSuperPhone.TextChanged
        txtIC1GenSuperPhone.Text = _aspFormHelper.FormatPhone(txtIC1GenSuperPhone.Text)
        _aspFormHelper.UpdateXMLDocument("txtIC1GenSuperPhone", txtIC1GenSuperPhone.Text)
    End Sub

    Protected Sub txtIC1GenSuperCell_TextChanged(sender As Object, e As EventArgs) Handles txtIC1GenSuperCell.TextChanged
        txtIC1GenSuperCell.Text = _aspFormHelper.FormatPhone(txtIC1GenSuperCell.Text)
        _aspFormHelper.UpdateXMLDocument("txtIC1GenSuperCell", txtIC1GenSuperCell.Text)
    End Sub

    Protected Sub txtIC1ProjMgrPhone_TextChanged(sender As Object, e As EventArgs) Handles txtIC1ProjMgrPhone.TextChanged
        txtIC1ProjMgrPhone.Text = _aspFormHelper.FormatPhone(txtIC1ProjMgrPhone.Text)
        _aspFormHelper.UpdateXMLDocument("txtIC1ProjMgrPhone", txtIC1ProjMgrPhone.Text)
    End Sub

    Protected Sub txtIC1ProjMgrCell_TextChanged(sender As Object, e As EventArgs) Handles txtIC1ProjMgrCell.TextChanged
        txtIC1ProjMgrCell.Text = _aspFormHelper.FormatPhone(txtIC1ProjMgrCell.Text)
        _aspFormHelper.UpdateXMLDocument("txtIC1ProjMgrCell", txtIC1ProjMgrCell.Text)
    End Sub

    Protected Sub txtIC2ConstEngPhone_TextChanged(sender As Object, e As EventArgs) Handles txtIC2ConstEngPhone.TextChanged
        txtIC2ConstEngPhone.Text = _aspFormHelper.FormatPhone(txtIC2ConstEngPhone.Text)
        _aspFormHelper.UpdateXMLDocument("txtIC2ConstEngPhone", txtIC2ConstEngPhone.Text)
    End Sub

    Protected Sub txtIC2ConstEngCell_TextChanged(sender As Object, e As EventArgs) Handles txtIC2ConstEngCell.TextChanged
        txtIC2ConstEngCell.Text = _aspFormHelper.FormatPhone(txtIC2ConstEngCell.Text)
        _aspFormHelper.UpdateXMLDocument("txtIC2ConstEngCell", txtIC2ConstEngCell.Text)
    End Sub

    Protected Sub txtFEAPhone_TextChanged(sender As Object, e As EventArgs) Handles txtFEAPhone.TextChanged
        txtFEAPhone.Text = _aspFormHelper.FormatPhone(txtFEAPhone.Text)
        _aspFormHelper.UpdateXMLDocument("txtFEAPhone", txtFEAPhone.Text)
    End Sub

    Protected Sub txtFEACell_TextChanged(sender As Object, e As EventArgs) Handles txtFEACell.TextChanged
        txtFEACell.Text = _aspFormHelper.FormatPhone(txtFEACell.Text)
        _aspFormHelper.UpdateXMLDocument("txtFEACell", txtFEACell.Text)
    End Sub

    Protected Sub txtAreaEngPhone_TextChanged(sender As Object, e As EventArgs) Handles txtAreaEngPhone.TextChanged
        txtAreaEngPhone.Text = _aspFormHelper.FormatPhone(txtAreaEngPhone.Text)
        _aspFormHelper.UpdateXMLDocument("txtAreaEngPhone", txtAreaEngPhone.Text)
    End Sub

    Protected Sub txtAreaEngCell_TextChanged(sender As Object, e As EventArgs) Handles txtAreaEngCell.TextChanged
        txtAreaEngCell.Text = _aspFormHelper.FormatPhone(txtAreaEngCell.Text)
        _aspFormHelper.UpdateXMLDocument("txtAreaEngCell", txtAreaEngCell.Text)
    End Sub

    Private Sub txtIC1ProjSuper_TextChanged(sender As Object, e As EventArgs) Handles txtIC1ProjSuper.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtIC1ProjSuper", txtIC1ProjSuper.Text)
        _aspFormHelper.UpdateXMLDocument("txtIC1ProjSuperOrg", txtIC1ProjSuperOrg.Text)
    End Sub

    Protected Sub txtIC2ProjSuperPhone_TextChanged(sender As Object, e As EventArgs) Handles txtIC2ProjSuperPhone.TextChanged
        txtIC2ProjSuperPhone.Text = _aspFormHelper.FormatPhone(txtIC2ProjSuperPhone.Text)
        _aspFormHelper.UpdateXMLDocument("txtIC2ProjSuperPhone", txtIC2ProjSuperPhone.Text)
    End Sub

    Protected Sub txtIC2ProjSuperCell_TextChanged(sender As Object, e As EventArgs) Handles txtIC2ProjSuperCell.TextChanged
        txtIC2ProjSuperCell.Text = _aspFormHelper.FormatPhone(txtIC2ProjSuperCell.Text)
        _aspFormHelper.UpdateXMLDocument("txtIC2ProjSuperCell", txtIC2ProjSuperCell.Text)
    End Sub

    Protected Sub txtIC2ProjInspPhone_TextChanged(sender As Object, e As EventArgs) Handles txtIC2ProjInspPhone.TextChanged
        txtIC2ProjInspPhone.Text = _aspFormHelper.FormatPhone(txtIC2ProjInspPhone.Text)
        _aspFormHelper.UpdateXMLDocument("txtIC2ProjInspPhone", txtIC2ProjInspPhone.Text)
    End Sub

    Protected Sub txtIC2ProjInspCell_TextChanged(sender As Object, e As EventArgs) Handles txtIC2ProjInspCell.TextChanged
        txtIC2ProjInspCell.Text = _aspFormHelper.FormatPhone(txtIC2ProjInspCell.Text)
        _aspFormHelper.UpdateXMLDocument("txtIC2ProjInspCell", txtIC2ProjInspCell.Text)
    End Sub

    Protected Sub txtEricPhone_TextChanged(sender As Object, e As EventArgs) Handles txtEricPhone.TextChanged
        txtEricPhone.Text = _aspFormHelper.FormatPhone(txtEricPhone.Text)
        _aspFormHelper.UpdateXMLDocument("txtEricPhone", txtEricPhone.Text)
    End Sub

    Protected Sub txtEricCell_TextChanged(sender As Object, e As EventArgs) Handles txtEricCell.TextChanged
        txtEricCell.Text = _aspFormHelper.FormatPhone(txtEricCell.Text)
        _aspFormHelper.UpdateXMLDocument("txtEricCell", txtEricCell.Text)
    End Sub

    Protected Sub txtIC2PubAffPhone_TextChanged(sender As Object, e As EventArgs) Handles txtIC2PubAffPhone.TextChanged
        txtIC2PubAffPhone.Text = _aspFormHelper.FormatPhone(txtIC2PubAffPhone.Text)
        _aspFormHelper.UpdateXMLDocument("txtIC2PubAffPhone", txtIC2PubAffPhone.Text)
    End Sub

    Protected Sub txtIC2PubAffInfoCell_TextChanged(sender As Object, e As EventArgs) Handles txtIC2PubAffInfoCell.TextChanged
        txtIC2PubAffInfoCell.Text = _aspFormHelper.FormatPhone(txtIC2PubAffInfoCell.Text)
        _aspFormHelper.UpdateXMLDocument("txtIC2PubAffInfoCell", txtIC2PubAffInfoCell.Text)
    End Sub

    Protected Sub txtIC2EmrgyPhone_TextChanged(sender As Object, e As EventArgs) Handles txtIC2EmrgyPhone.TextChanged
        txtIC2EmrgyPhone.Text = _aspFormHelper.FormatPhone(txtIC2EmrgyPhone.Text)
        _aspFormHelper.UpdateXMLDocument("txtIC2EmrgyPhone", txtIC2EmrgyPhone.Text)
    End Sub

    Protected Sub txtIC2EmrgyCell_TextChanged(sender As Object, e As EventArgs) Handles txtIC2EmrgyCell.TextChanged
        txtIC2EmrgyCell.Text = _aspFormHelper.FormatPhone(txtIC2EmrgyCell.Text)
        _aspFormHelper.UpdateXMLDocument("txtIC2EmrgyCell", txtIC2EmrgyCell.Text)
    End Sub

    'Protected Sub txtCityPhone_TextChanged(sender As Object, e As EventArgs) Handles txtCityPhone.TextChanged
    '    txtCityPhone.Text = _aspFormHelper.FormatPhone(txtCityPhone.Text)
    '    _aspFormHelper.UpdateXMLDocument("txtCityPhone", txtCityPhone.Text)
    'End Sub

    'Protected Sub txtCityCellPhone_TextChanged(sender As Object, e As EventArgs) Handles txtCityCellPhone.TextChanged
    '    txtCityCellPhone.Text = _aspFormHelper.FormatPhone(txtCityCellPhone.Text)
    '    _aspFormHelper.UpdateXMLDocument("txtCityCellPhone", txtCityCellPhone.Text)
    'End Sub

    'Protected Sub txtKDOTContactPhone_TextChanged(sender As Object, e As EventArgs) Handles txtKDOTContactPhone.TextChanged
    '    txtKDOTContactPhone.Text = _aspFormHelper.FormatPhone(txtKDOTContactPhone.Text)
    '    _aspFormHelper.UpdateXMLDocument("txtKDOTContactPhone", txtKDOTContactPhone.Text)
    'End Sub

    Protected Sub txtCntrsRepPhone_TextChanged(sender As Object, e As EventArgs) Handles txtCntrsRepPhone.TextChanged
        txtCntrsRepPhone.Text = _aspFormHelper.FormatPhone(txtCntrsRepPhone.Text)
        _aspFormHelper.UpdateXMLDocument("txtCntrsRepPhone", txtCntrsRepPhone.Text)
    End Sub

    Protected Sub txtEmergContactPhone_TextChanged(sender As Object, e As EventArgs) Handles txtEmergContactPhone.TextChanged
        txtEmergContactPhone.Text = _aspFormHelper.FormatPhone(txtEmergContactPhone.Text)
        _aspFormHelper.UpdateXMLDocument("txtEmergContactPhone", txtEmergContactPhone.Text)
    End Sub

    'Protected Sub txtSubcontractorPhone_TextChanged(sender As Object, e As EventArgs) Handles txtSubcontractorPhone.TextChanged
    '    txtSubcontractorPhone.Text = _aspFormHelper.FormatPhone(txtSubcontractorPhone.Text)
    '    _aspFormHelper.UpdateXMLDocument("txtSubcontractorPhone", txtSubcontractorPhone.Text)
    'End Sub

    Protected Sub txtDBEGoal_TextChanged(sender As Object, e As EventArgs) Handles txtDBEGoal.TextChanged
        Try
            txtDBEGoal.Text = Format(Convert.ToDecimal(txtDBEGoal.Text), "0.0")
            _aspFormHelper.UpdateXMLDocument("txtDBEGoal", txtDBEGoal.Text)
        Catch ex As Exception
            _aspFormHelper.UpdateXMLDocument("txtDBEGoal", txtDBEGoal.Text)
        End Try
    End Sub

    Protected Sub txtDBECommitment_TextChanged(sender As Object, e As EventArgs) Handles txtDBECommitment.TextChanged
        Try
            txtDBECommitment.Text = Format(Convert.ToDecimal(txtDBECommitment.Text), "0.0")
            _aspFormHelper.UpdateXMLDocument("txtDBECommitment", txtDBECommitment.Text)
        Catch ex As Exception
            _aspFormHelper.UpdateXMLDocument("txtDBECommitment", txtDBECommitment.Text)
        End Try
    End Sub

    Protected Sub AddUtility_Click(sender As Object, e As EventArgs) Handles AddUtility.Click
        Dim dtCurrentTable As DataTable = TryCast(ViewState("grdUtility"), DataTable)
        If dtCurrentTable Is Nothing Then
            LoadAttendance()
            dtCurrentTable = TryCast(ViewState("grdUtility"), DataTable)
        End If


        For i As Integer = 0 To grdUtility.Rows.Count - 1
            Dim row As GridViewRow = grdUtility.Rows(i)
            dtCurrentTable.Rows(i)("txtUtilityName") = CType(row.FindControl("txtUtilityName"), TextBox).Text
            dtCurrentTable.Rows(i)("txtUtilityStatus") = CType(row.FindControl("txtUtilityStatus"), TextBox).Text
            dtCurrentTable.Rows(i)("txtUtilityExpCompl") = CType(row.FindControl("txtUtilityExpCompl"), TextBox).Text
            dtCurrentTable.Rows(i)("txtUtilityComments") = CType(row.FindControl("txtUtilityComments"), TextBox).Text
        Next
        ViewState("grdUtility") = dtCurrentTable
        hfUtilityData.Value = JsonConvert.SerializeObject(dtCurrentTable)
        AddNewUtilityRow()
    End Sub

    Protected Sub AddRep_Click(sender As Object, e As EventArgs) Handles AddRep.Click
        AddNewRepRow()
    End Sub

    Protected Sub AddSubcontractor_Click(sender As Object, e As EventArgs) Handles AddSubcontractor.Click
        AddNewSubcontractorRow()
    End Sub

    Protected Sub AddContract_Click(sender As Object, e As EventArgs) Handles AddContract.Click
        AddNewContactRow()
    End Sub

    Protected Sub AddMaterial_Click(sender As Object, e As EventArgs) Handles AddMaterial.Click
        AddNewMaterialRow()
    End Sub

    Protected Sub txtSupplier_TextChanged(sender As Object, e As EventArgs)
        '_aspFormHelper.UpdateXMLDocument("txtSupplier", sender.text)
    End Sub

    Protected Sub txtMaterial_TextChanged(sender As Object, e As EventArgs)

        '_aspFormHelper.UpdateXMLDocument("txtMaterial", sender.text)
    End Sub

    Protected Sub txtMatLocation_TextChanged(sender As Object, e As EventArgs)

        '_aspFormHelper.UpdateXMLDocument("txtMatLocation", sender.text)
    End Sub

    Public Sub savetables()
        SaveAttendee()
        SaveUtility()
        SaveContact()
        SaveMaterial()
        SaveSubcontractor()
        SaveRep()
    End Sub

    Protected Sub txtSafetyD_TextChanged(sender As Object, e As EventArgs) Handles txtSafetyD.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtSafetyD", txtSafetyD.Text)
    End Sub

    Protected Sub RepVis_Click(sender As Object, e As EventArgs) Handles RepVis.Click
        RepPanel.Visible = True
        RepVis.Visible = False
    End Sub

    'Protected Sub txtContWPCMKDOT_TextChanged(sender As Object, e As EventArgs) Handles txtContWPCMKDOT.TextChanged
    '  _aspFormHelper.UpdateXMLDocument("txtContWPCMKDOT", txtContWPCMKDOT.Text)
    '  _aspFormHelper.UpdateXMLDocument("txtContWPCM", txtContWPCMKDOT.Text)
    '  _aspFormHelper.UpdateXMLDocument("txtContWPCMLPA", txtContWPCMKDOT.Text)
    '  txtContWPCMLPA.Text = txtContWPCMKDOT.Text
    'End Sub

    'Protected Sub txtMetroEngKDOT_TextChanged(sender As Object, e As EventArgs) Handles txtMetroEngKDOT.TextChanged
    '  _aspFormHelper.UpdateXMLDocument("txtMetroEngKDOT", txtMetroEngKDOT.Text)
    '  _aspFormHelper.UpdateXMLDocument("txtMetroEng", txtMetroEngKDOT.Text)
    '  _aspFormHelper.UpdateXMLDocument("txtMetroEngLPA", txtMetroEngKDOT.Text)
    '  txtMetroEngLPA.Text = txtMetroEngKDOT.Text
    'End Sub

    'Protected Sub txtVIIIB1CKDOT_TextChanged(sender As Object, e As EventArgs) Handles txtVIIIB1CKDOT.TextChanged
    '  _aspFormHelper.UpdateXMLDocument("txtVIIIB1CKDOT", txtVIIIB1CKDOT.Text)
    '  _aspFormHelper.UpdateXMLDocument("txtVIIIB1C", txtVIIIB1CKDOT.Text)
    '  _aspFormHelper.UpdateXMLDocument("txtVIIIB1CLPA", txtVIIIB1CKDOT.Text)
    '  txtVIIIB1CLPA.Text = txtVIIIB1CKDOT.Text
    'End Sub

    'Protected Sub txtVIIIB1DKDOT_TextChanged(sender As Object, e As EventArgs) Handles txtVIIIB1DKDOT.TextChanged
    '  _aspFormHelper.UpdateXMLDocument("txtVIIIB1DKDOT", txtVIIIB1DKDOT.Text)
    '  _aspFormHelper.UpdateXMLDocument("txtVIIIB1D", txtVIIIB1DKDOT.Text)
    '  _aspFormHelper.UpdateXMLDocument("txtVIIIB1DLPA", txtVIIIB1DKDOT.Text)
    '  txtVIIIB1DLPA.Text = txtVIIIB1DKDOT.Text
    'End Sub

    'Protected Sub txtStormwaterPreconstConfKDOT_TextChanged(sender As Object, e As EventArgs) Handles txtStormwaterPreconstConfKDOT.TextChanged
    '  _aspFormHelper.UpdateXMLDocument("txtStormwaterPreconstConfKDOT", txtStormwaterPreconstConfKDOT.Text)
    '  _aspFormHelper.UpdateXMLDocument("txtStormwaterPreconstConf", txtStormwaterPreconstConfKDOT.Text)
    '  _aspFormHelper.UpdateXMLDocument("txtStormwaterPreconstConfLPA", txtStormwaterPreconstConfKDOT.Text)
    '  txtStormwaterPreconstConfLPA.Text = txtStormwaterPreconstConfKDOT.Text
    'End Sub

    'Protected Sub txtContWPCMLPA_TextChanged(sender As Object, e As EventArgs) Handles txtContWPCMLPA.TextChanged
    '  _aspFormHelper.UpdateXMLDocument("txtContWPCM", txtContWPCMLPA.Text)
    '  _aspFormHelper.UpdateXMLDocument("txtContWPCMLPA", txtContWPCMLPA.Text)
    '  _aspFormHelper.UpdateXMLDocument("txtContWPCMKDOT", txtContWPCMLPA.Text)
    '  txtContWPCMLPA.Text = txtContWPCMLPA.Text
    'End Sub

    'Protected Sub txtMetroEngLPA_TextChanged(sender As Object, e As EventArgs) Handles txtMetroEngLPA.TextChanged
    '  _aspFormHelper.UpdateXMLDocument("txtMetroEng", txtMetroEngLPA.Text)
    '  _aspFormHelper.UpdateXMLDocument("txtMetroEngLPA", txtMetroEngLPA.Text)
    '  _aspFormHelper.UpdateXMLDocument("txtMetroEngKDOT", txtMetroEngLPA.Text)
    '  txtMetroEngKDOT.Text = txtMetroEngLPA.Text
    'End Sub

    'Protected Sub txtVIIIB1CLPA_TextChanged(sender As Object, e As EventArgs) Handles txtVIIIB1CLPA.TextChanged
    '  _aspFormHelper.UpdateXMLDocument("txtVIIIB1C", txtVIIIB1CLPA.Text)
    '  _aspFormHelper.UpdateXMLDocument("txtVIIIB1CLPA", txtVIIIB1CLPA.Text)
    '  _aspFormHelper.UpdateXMLDocument("txtVIIIB1CKDOT", txtVIIIB1CLPA.Text)
    '  txtVIIIB1CKDOT.Text = txtVIIIB1CLPA.Text
    'End Sub

    'Protected Sub txtVIIIB1DLPA_TextChanged(sender As Object, e As EventArgs) Handles txtVIIIB1DLPA.TextChanged
    '  _aspFormHelper.UpdateXMLDocument("txtVIIIB1D", txtVIIIB1DLPA.Text)
    '  _aspFormHelper.UpdateXMLDocument("txtVIIIB1DLPA", txtVIIIB1DLPA.Text)
    '  _aspFormHelper.UpdateXMLDocument("txtVIIIB1DKDOT", txtVIIIB1DLPA.Text)
    '  txtVIIIB1DKDOT.Text = txtVIIIB1DLPA.Text
    'End Sub

    'Protected Sub txtStormwaterPreconstConfLPA_TextChanged(sender As Object, e As EventArgs) Handles txtStormwaterPreconstConfLPA.TextChanged
    '  _aspFormHelper.UpdateXMLDocument("txtStormwaterPreconstConf", txtStormwaterPreconstConfLPA.Text)
    '  _aspFormHelper.UpdateXMLDocument("txtStormwaterPreconstConfLPA", txtStormwaterPreconstConfLPA.Text)
    '  _aspFormHelper.UpdateXMLDocument("txtStormwaterPreconstConfKDOT", txtStormwaterPreconstConfLPA.Text)
    '  txtStormwaterPreconstConfKDOT.Text = txtStormwaterPreconstConfLPA.Text
    'End Sub

    Protected Sub txtVIIIB1_TextChanged(sender As Object, e As EventArgs) Handles txtVIIIB1.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtVIIIB1", txtVIIIB1.Text)
    End Sub

    Protected Sub txtAreaEngineer2_TextChanged(sender As Object, e As EventArgs) Handles txtAreaEngineer2.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtAreaEngineer", sender.text)
        txtAreaEngineer.Text = sender.text
        _aspFormHelper.UpdateXMLDocument("txtAreaEngEmail", txtAreaEngEmail.Text)
    End Sub

    Protected Sub txtAreaEngineer_TextChanged(sender As Object, e As EventArgs) Handles txtAreaEngineer.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtAreaEngineer", sender.text)
        txtAreaEngineer2.Text = sender.text
    End Sub

    Protected Sub addCC_Click(sender As Object, e As EventArgs) Handles addCC.Click
        AddNewCCRow()
    End Sub

    Private Sub ContractNumber_TextChanged(sender As Object, e As EventArgs) Handles ContractNumber.TextChanged
        '
        HttpContext.Current.Session("ContractMessage") = ""
        '
        If Not String.IsNullOrEmpty(ContractNumber.Text) Then
            Dim myWS As New CMSForms.CMSForms
            Dim myDS As New DataSet
            Dim myErrorMsg As String = Nothing
            '
            Dim myContType = myWS.ContractDetails(ContractNumber.Text)
            '
            If String.IsNullOrEmpty(myContType.ContType) Then
                '
                myErrorMsg = "Invalid Contract Number"
                '
            ElseIf myContType.ContType <> "C" And myContType.ContType <> "EMR" Then
                '
                myErrorMsg = "Invalid Contract type, only 'C' and 'EMR' Type contracts are allowed. "
                '
            End If
            '
            If String.IsNullOrEmpty(myErrorMsg) Then
                '
                myDS = myWS.DOT0220fromContract(ContractNumber.Text)
                '
                If myDS.Tables(0).Columns(0).ColumnName = "ERROR_FLAG" Then
                    '
                    myErrorMsg = "Invalid ContractNumber"
                    '
                Else
                    '
                    GetFCAInfo()
                    'Reset fields before loading
                    _aspFormHelper.UpdateXMLDocument("FedProjectNumber", "")
                    _aspFormHelper.UpdateXMLDocument("ProjectNumber", "")
                    _aspFormHelper.UpdateXMLDocument("txtContractorName", "")
                    _aspFormHelper.UpdateXMLDocument("txtCounty", "")
                    _aspFormHelper.UpdateXMLDocument("txtConstType", "")
                    _aspFormHelper.UpdateXMLDocument("txtRoute", """")
                    _aspFormHelper.UpdateXMLDocument("txtCountyNumber", """""")
                    _aspFormHelper.UpdateXMLDocument("txtDistrict", "")
                    _aspFormHelper.UpdateXMLDocument("txtArea", "")
                    _aspFormHelper.UpdateXMLDocument("txtPrimaryOBS", "")
                    _aspFormHelper.UpdateXMLDocument("txtDistrictEngineer", "")
                    _aspFormHelper.UpdateXMLDocument("txtAreaEngineer", "")
                    _aspFormHelper.UpdateXMLDocument("txtAreaEngineer2", "")
                    _aspFormHelper.UpdateXMLDocument("txtAreaEngEmail", "")
                    _aspFormHelper.UpdateXMLDocument("txtAreaEngPhone", "")
                    _aspFormHelper.UpdateXMLDocument("txtAreaEngCell", "")
                    _aspFormHelper.UpdateXMLDocument("txtIC2PubAffInfo", "")
                    _aspFormHelper.UpdateXMLDocument("txtIC2PubAffEmail", "")
                    _aspFormHelper.UpdateXMLDocument("txtIC2PubAffPhone", "")
                    _aspFormHelper.UpdateXMLDocument("txtIC2PubAffInfoCell", "")
                    _aspFormHelper.UpdateXMLDocument("txtIC2ConstEng", "")
                    _aspFormHelper.UpdateXMLDocument("txtIC2ConstEngEmail", "")
                    _aspFormHelper.UpdateXMLDocument("txtIC2ConstEngPhone", "")
                    _aspFormHelper.UpdateXMLDocument("txtIC2ConstEngCell", "")
                    _aspFormHelper.UpdateXMLDocument("txtFEAName", "")
                    _aspFormHelper.UpdateXMLDocument("txtFEAEmail", "")
                    _aspFormHelper.UpdateXMLDocument("txtFEAPhone", "")
                    _aspFormHelper.UpdateXMLDocument("txtFEACell", "")
                    '
                    'Load basic contract info
                    Try
                        _aspFormHelper.UpdateXMLDocument("FedProjectNumber", myDS.Tables(0).Rows(0).Item("CONTRACT_FEDERAL_PROJ_NUM"))
                    Catch ex As Exception
                        _aspFormHelper.UpdateXMLDocument("FedProjectNumber", "")
                    End Try
                    Dim hldJur As String
                    If Len(myDS.Tables(0).Rows(0).Item("PROJECT_JUR")) = 1 Then
                        hldJur = myDS.Tables(0).Rows(0).Item("PROJECT_JUR") & " "
                    Else
                        hldJur = myDS.Tables(0).Rows(0).Item("PROJECT_JUR")
                    End If
                    _aspFormHelper.UpdateXMLDocument("ProjectNumber", hldJur & "-" & myDS.Tables(0).Rows(0).Item("PROJECT_SERIAL_NUM") & "-" & myDS.Tables(0).Rows(0).Item("PROJECT_STAGE"))
                    _aspFormHelper.UpdateXMLDocument("txtContractorName", myDS.Tables(0).Rows(0).Item("CONTRACTOR_NAME"))
                    _aspFormHelper.UpdateXMLDocument("txtCounty", myDS.Tables(0).Rows(0).Item("COUNTY_NAME"))
                    _aspFormHelper.UpdateXMLDocument("txtConstType", myDS.Tables(0).Rows(0).Item("WORKTYPE_DESC"))
                    _aspFormHelper.UpdateXMLDocument("txtRoute", myDS.Tables(0).Rows(0).Item("PRIMARY_ROUTE_ID"))
                    _aspFormHelper.UpdateXMLDocument("txtCountyNumber", myDS.Tables(0).Rows(0).Item("PRIMARY_COUNTY_NUMBER"))
                    _aspFormHelper.UpdateXMLDocument("txtDistrict", myDS.Tables(0).Rows(0).Item("CONTRACT_DISTRICT"))
                    _aspFormHelper.UpdateXMLDocument("txtArea", myDS.Tables(0).Rows(0).Item("CONTRACT_AREA_OFFICE"))
                    _aspFormHelper.UpdateXMLDocument("txtPrimaryOBS", myDS.Tables(0).Rows(0).Item("PRIMARY_OBSE_NUMBER"))
                    If Not String.IsNullOrEmpty(myDS.Tables(0).Rows(0).Item("CONTRACT_DISTRICT")) Then
                        'Load district and area engineer info
                        Dim myWS2 As New OrgDBRoles1.OrgDBRoles
                        Dim myDS2 As New DataSet
                        Dim myDS3 As New DataSet
                        Dim myWS3 As New OrgDBEmployeeandPosition.OrgDBEmployeeAndPosition
                        myDS2 = myWS2.GetParticipantWithRole("District Engineer", "", myDS.Tables(0).Rows(0).Item("CONTRACT_DISTRICT"), "", "")
                        If myDS2.Tables(0).Columns(0).ColumnName <> "ERROR_FLAG" Then
                            _aspFormHelper.UpdateXMLDocument("txtDistrictEngineer", myDS2.Tables(0).Rows(0).Item("FullName"))
                        End If
                        '
                        myDS2 = myWS2.GetParticipantWithRole("Area Engineer", "", myDS.Tables(0).Rows(0).Item("CONTRACT_DISTRICT"), myDS.Tables(0).Rows(0).Item("CONTRACT_AREA_OFFICE"), "")
                        If myDS2.Tables(0).Columns(0).ColumnName <> "ERROR_FLAG" Then
                            _aspFormHelper.UpdateXMLDocument("txtAreaEngineer", myDS2.Tables(0).Rows(0).Item("FullName"))
                            _aspFormHelper.UpdateXMLDocument("txtAreaEngineer2", myDS2.Tables(0).Rows(0).Item("FullName"))
                            Try
                                _aspFormHelper.UpdateXMLDocument("txtAreaEngEmail", myDS2.Tables(1).Rows(0).Item("EmailAddress"))
                            Catch ex As Exception
                                _aspFormHelper.UpdateXMLDocument("txtAreaEngEmail", "")
                            End Try
                            myDS3 = myWS3.GetUserADInformation2(myDS2.Tables(0).Rows(0).Item("NTLogin"), "")
                            _aspFormHelper.UpdateXMLDocument("txtAreaEngPhone", _aspFormHelper.FormatPhone(myDS3.Tables(0).Rows(0).Item("WorkPhone")))
                            _aspFormHelper.UpdateXMLDocument("txtAreaEngCell", _aspFormHelper.FormatPhone(myDS3.Tables(0).Rows(0).Item("CellPhone")))
                        End If
                        '
                        'Load Public Involvement Liason
                        myDS2 = myWS2.GetParticipantWithRole("Public Involvement Liaison", "", myDS.Tables(0).Rows(0).Item("CONTRACT_DISTRICT"), "", "")
                        If myDS2.Tables(0).Columns(0).ColumnName <> "ERROR_FLAG" Then
                            _aspFormHelper.UpdateXMLDocument("txtIC2PubAffInfo", myDS2.Tables(0).Rows(0).Item("FullName"))
                            _aspFormHelper.UpdateXMLDocument("txtIC2PubAffEmail", myDS2.Tables(1).Rows(0).Item("EmailAddress"))
                            myDS3 = myWS3.GetUserADInformation2(myDS2.Tables(0).Rows(0).Item("NTLogin"), "")
                            _aspFormHelper.UpdateXMLDocument("txtIC2PubAffPhone", _aspFormHelper.FormatPhone(myDS3.Tables(0).Rows(0).Item("WorkPhone")))
                            _aspFormHelper.UpdateXMLDocument("txtIC2PubAffInfoCell", _aspFormHelper.FormatPhone(myDS3.Tables(0).Rows(0).Item("CellPhone")))
                        End If
                        'Load Construction Engineer
                        myDS2 = myWS2.GetParticipantWithRoleandOBS("Area Construction Engineer", "", myDS.Tables(0).Rows(0).Item("CONTRACT_DISTRICT"), myDS.Tables(0).Rows(0).Item("PROJECT_AREA"), "", myDS.Tables(0).Rows(0).Item("PRIMARY_OBSE_NUMBER"))
                        If myDS2.Tables(0).Columns(0).ColumnName <> "ERROR_FLAG" Then
                            _aspFormHelper.UpdateXMLDocument("txtIC2ConstEng", myDS2.Tables(0).Rows(0).Item("FullName"))
                            myDS3 = myWS3.GetUserADInformation2(myDS2.Tables(0).Rows(0).Item("NTLogin"), "")
                            _aspFormHelper.UpdateXMLDocument("txtIC2ConstEngEmail", myDS3.Tables(0).Rows(0).Item("EmailAddress"))
                            _aspFormHelper.UpdateXMLDocument("txtIC2ConstEngPhone", _aspFormHelper.FormatPhone(myDS3.Tables(0).Rows(0).Item("WorkPhone")))
                            _aspFormHelper.UpdateXMLDocument("txtIC2ConstEngCell", _aspFormHelper.FormatPhone(myDS3.Tables(0).Rows(0).Item("CellPhone")))
                        End If
                        '
                        'Set FEA Info
                        myDS2 = myWS2.GetParticipantWithRoleandOBS("CMS Const Eng Designee", "", myDS.Tables(0).Rows(0).Item("CONTRACT_DISTRICT"), myDS.Tables(0).Rows(0).Item("CONTRACT_AREA_OFFICE"), "", myDS.Tables(0).Rows(0).Item("PRIMARY_OBSE_NUMBER"))
                        If myDS2.Tables(0).Columns(0).ColumnName <> "ERROR_FLAG" Then
                            _aspFormHelper.UpdateXMLDocument("txtFEAName", myDS2.Tables(0).Rows(0).Item("FullName"))
                            myDS3 = myWS3.GetUserADInformation2(myDS2.Tables(0).Rows(0).Item("NTLogin"), "")
                            _aspFormHelper.UpdateXMLDocument("txtFEAEmail", myDS3.Tables(0).Rows(0).Item("EmailAddress"))
                            _aspFormHelper.UpdateXMLDocument("txtFEAPhone", _aspFormHelper.FormatPhone(myDS3.Tables(0).Rows(0).Item("WorkPhone")))
                            _aspFormHelper.UpdateXMLDocument("txtFEACell", _aspFormHelper.FormatPhone(myDS3.Tables(0).Rows(0).Item("CellPhone")))
                        End If
                    End If
                    _aspFormHelper.SetPageFields()
                End If
            End If
            '
            If Not (String.IsNullOrEmpty(myErrorMsg)) Then
                '
                _aspFormHelper.MsgBox(myErrorMsg)
                HttpContext.Current.Session("ContractMessage") = myErrorMsg
                '
            End If
        End If
        '
    End Sub

    Private Sub SetNextFocus(ctrl As Control)
        Dim js As String =
        "sessionStorage.setItem('kdot_next_focus','" & ctrl.ClientID & "');"
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "setfocus_" & ctrl.ClientID, js, True)
    End Sub
    Private Sub dteMtgDate_TextChanged(sender As Object, e As EventArgs) Handles dteMtgDate.TextChanged
        Try
            _aspFormHelper.SetErrorField("dteMtgDate", "TextBox", "Reset", "")
            If Not String.IsNullOrEmpty(dteMtgDate.Text) Then
                dteMtgDate.Text = CDate(dteMtgDate.Text).ToString("MMMM dd, yyyy")
                _aspFormHelper.UpdateXMLDocument("dteMtgDate", dteMtgDate.Text)
            End If

            'FORCE focus after postback completes (UpdatePanel-safe)
            SetNextFocus(dteMtgTime)
        Catch ex As Exception
            _aspFormHelper.MsgBox("Invalid Date")
            dteMtgDate.Text = ""
            _aspFormHelper.UpdateXMLDocument("dteMtgDate", "")
        End Try
    End Sub

    Private Sub dteMtgTime_TextChanged(sender As Object, e As EventArgs) Handles dteMtgTime.TextChanged
        If Not String.IsNullOrEmpty(dteMtgTime.Text) Then
            Dim time As Date
            Try
                _aspFormHelper.SetErrorField("dteMtgTime", "TextBox", "Reset", "")
                time = TimeValue(dteMtgTime.Text)
                dteMtgTime.Text = time.ToString("h:mm tt")
                _aspFormHelper.UpdateXMLDocument("dteMtgTime", dteMtgTime.Text)
            Catch
                Try
                    If Not dteMtgTime.Text.Contains(":") Then
                        dteMtgTime.Text = dteMtgTime.Text & ":00"
                        time = TimeValue(dteMtgTime.Text)
                        dteMtgTime.Text = time.ToString("h:mm tt")
                        _aspFormHelper.UpdateXMLDocument("dteMtgTime", dteMtgTime.Text)
                    Else
                        _aspFormHelper.MsgBox("Invalid time entered")
                        dteMtgTime.Text = ""
                        _aspFormHelper.UpdateXMLDocument("dteMtgTime", "")
                    End If
                Catch
                    _aspFormHelper.MsgBox("Invalid time entered.")
                    _aspFormHelper.SetErrorField("dteMtgTime", "TextBox", "Set", "Invalid Time")
                    dteMtgTime.Text = ""
                    _aspFormHelper.UpdateXMLDocument("dteMtgTime", "")
                End Try
            End Try
        End If
    End Sub

    Protected Sub btnUpload_Click(sender As Object, e As EventArgs) Handles btnUpload.Click
        If Not String.IsNullOrEmpty(uplPicture.FileName) Then
            Dim formId As String = _aspFormHelper.GetXMLValue("FormId")
            Dim fileName As String = uplPicture.FileName

            ' Get paths from web.config
            Dim uncBasePathConfig As String = ConfigurationManager.AppSettings("UncBasePath")
            Dim virtualBaseUrl As String = ConfigurationManager.AppSettings("VirtualBaseUrl")

            ' UNC paths for saving
            Dim uncBasePath As String = Path.Combine(uncBasePathConfig, formId)
            Dim uncPrintPath As String = Path.Combine(uncBasePath, "Print")

            ' Ensure directories exist
            If Not IO.Directory.Exists(uncBasePath) Then Directory.CreateDirectory(uncBasePath)
            If Not IO.Directory.Exists(uncPrintPath) Then Directory.CreateDirectory(uncPrintPath)

            ' Full UNC paths
            Dim fullUncPath As String = Path.Combine(uncBasePath, fileName)
            Dim fullUncPrintPath As String = Path.Combine(uncPrintPath, fileName)

            ' Save uploaded image
            uplPicture.SaveAs(fullUncPath)

            ' Load and rotate image if needed
            Dim myImage As Image = Image.FromFile(fullUncPath)
            Dim fi As FileInfo = New FileInfo(fileName)

            If myImage.Width > myImage.Height Then
                myImage.RotateFlip(RotateFlipType.Rotate270FlipNone)
                Select Case fi.Extension.ToLower()
                    Case ".png" : myImage.Save(fullUncPrintPath, Imaging.ImageFormat.Png)
                    Case ".tif", ".tiff" : myImage.Save(fullUncPrintPath, Imaging.ImageFormat.Tiff)
                    Case ".jpg", ".jpeg" : myImage.Save(fullUncPrintPath, Imaging.ImageFormat.Jpeg)
                    Case ".gif" : myImage.Save(fullUncPrintPath, Imaging.ImageFormat.Gif)
                    Case ".bmp" : myImage.Save(fullUncPrintPath, Imaging.ImageFormat.Bmp)
                    Case Else : myImage.Save(fullUncPrintPath)
                End Select
                Dim virtualPrintUrl As String = virtualBaseUrl & formId & "/Print/" & fileName
                _aspFormHelper.UpdateXMLDocument("picAttendeesPrint", virtualPrintUrl)
            End If

            ' Build virtual URL for display
            Dim virtualUrl As String = virtualBaseUrl & formId & "/" & fileName
            picAttendees.ImageUrl = virtualUrl
            _aspFormHelper.UpdateXMLDocument("picAttendees", virtualUrl)

            ' UI updates
            _aspFormHelper.UpdateXMLDocument("blnShowAttendList", "false")
            picAttendees.Visible = True
            uplPicture.Visible = False
            btnUpload.Visible = False
            lblPicture.Visible = False
            btnDelete.Visible = True
            blnShowAttendList.Checked = False
        End If
    End Sub

    Private Sub btnDelete_Click(sender As Object, e As EventArgs) Handles btnDelete.Click
        Dim formId As String = _aspFormHelper.GetXMLValue("FormId")
        Dim fileName As String = Path.GetFileName(picAttendees.ImageUrl)

        ' Get UNC base path from web.config
        Dim uncBasePathConfig As String = ConfigurationManager.AppSettings("UNCBasePath")
        Dim uncPath As String = Path.Combine(uncBasePathConfig, formId, fileName)

        ' Delete the file if it exists
        If File.Exists(uncPath) Then
            File.Delete(uncPath)
        End If

        ' Clear image and update XML
        picAttendees.ImageUrl = ""
        _aspFormHelper.UpdateXMLDocument("picAttendees", "")
        _aspFormHelper.UpdateXMLDocument("blnShowAttendList", "true")

        ' UI updates
        picAttendees.Visible = False
        uplPicture.Visible = True
        btnUpload.Visible = True
        lblPicture.Visible = True
        btnDelete.Visible = False
        blnShowAttendList.Checked = True
    End Sub

    Private Sub dteEarlyStart_TextChanged(sender As Object, e As EventArgs) Handles dteEarlyStart.TextChanged
        txtEarlyStart.Text = dteEarlyStart.Text
        _aspFormHelper.UpdateXMLDocument("txtEarlyStart", txtEarlyStart.Text)
    End Sub

    Private Sub dteLateStart_TextChanged(sender As Object, e As EventArgs) Handles dteLateStart.TextChanged
        txtLateStart.Text = dteLateStart.Text
        _aspFormHelper.UpdateXMLDocument("txtLateStart", txtLateStart.Text)
    End Sub

    Private Sub dteTentStart_TextChanged(sender As Object, e As EventArgs) Handles dteTentStart.TextChanged
        txtTentStart.Text = dteTentStart.Text
        _aspFormHelper.UpdateXMLDocument("txtTentStart", txtTentStart.Text)
    End Sub

    Private Sub txtEarlyStart_TextChanged(sender As Object, e As EventArgs) Handles txtEarlyStart.TextChanged
        Try
            _aspFormHelper.SetErrorField("txtEarlyStart", "TextBox", "Reset", "")
            If Not String.IsNullOrEmpty(txtEarlyStart.Text) Then
                txtEarlyStart.Text = CDate(txtEarlyStart.Text).ToString("MM/dd/yyyy")
                _aspFormHelper.UpdateXMLDocument("txtEarlyStart", txtEarlyStart.Text)
            End If
            SetNextFocus(txtLateStart)
        Catch ex As Exception
            'Valid values include *** or see contract
        End Try
    End Sub

    Private Sub txtLateStart_TextChanged(sender As Object, e As EventArgs) Handles txtLateStart.TextChanged
        Try
            _aspFormHelper.SetErrorField("txtLateStart", "TextBox", "Reset", "")
            If Not String.IsNullOrEmpty(txtLateStart.Text) Then
                txtLateStart.Text = CDate(txtLateStart.Text).ToString("MM/dd/yyyy")
                _aspFormHelper.UpdateXMLDocument("txtLateStart", txtLateStart.Text)
            End If
            SetNextFocus(txtTentStart)
        Catch ex As Exception
            'Valid values include *** or see contract
        End Try
    End Sub

    Private Sub txtTentStart_TextChanged(sender As Object, e As EventArgs) Handles txtTentStart.TextChanged
        Try
            _aspFormHelper.SetErrorField("txtTentStart", "TextBox", "Reset", "")
            If Not String.IsNullOrEmpty(txtTentStart.Text) Then
                txtTentStart.Text = CDate(txtTentStart.Text).ToString("MM/dd/yyyy")
                _aspFormHelper.UpdateXMLDocument("txtTentStart", txtTentStart.Text)
            End If
        Catch ex As Exception
            'Valid values include *** or see contract
        End Try
    End Sub

    'All of the following have autopostback set to false.  As soon as any postback occurs it will process it if the data has changed.
    'This includes the Print Preview or reviewaction changed, F8 etc...  
    Private Sub txtIC1GenSuper_TextChanged(sender As Object, e As EventArgs) Handles txtIC1GenSuper.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtIC1GenSuper", txtIC1GenSuper.Text)
    End Sub
    Private Sub txtIC1GenSuperOrg_TextChanged(sender As Object, e As EventArgs) Handles txtIC1GenSuperOrg.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtIC1GenSuperOrg", txtIC1GenSuperOrg.Text)
    End Sub

    Private Sub txtIC1ProjMgr_TextChanged(sender As Object, e As EventArgs) Handles txtIC1ProjMgr.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtIC1ProjMgr", txtIC1ProjMgr.Text)
    End Sub

    Private Sub txtIC1ProjMgrOrg_TextChanged(sender As Object, e As EventArgs) Handles txtIC1ProjMgrOrg.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtIC1ProjMgrOrg", txtIC1ProjMgrOrg.Text)
    End Sub

    Private Sub txtIC2ConstEng_TextChanged(sender As Object, e As EventArgs) Handles txtIC2ConstEng.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtIC2ConstEng", txtIC2ConstEng.Text)
    End Sub

    Private Sub txtIC2ConstEngEmail_TextChanged(sender As Object, e As EventArgs) Handles txtIC2ConstEngEmail.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtIC2ConstEngEmail", txtIC2ConstEngEmail.Text)
    End Sub

    Private Sub txtFEAName_TextChanged(sender As Object, e As EventArgs) Handles txtFEAName.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtFEAName", txtFEAName.Text)
    End Sub

    Private Sub txtFEAEmail_TextChanged(sender As Object, e As EventArgs) Handles txtFEAEmail.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtFEAEmail", txtFEAEmail.Text)
    End Sub

    Private Sub txtIC2ProjSuper_TextChanged(sender As Object, e As EventArgs) Handles txtIC2ProjSuper.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtIC2ProjSuper", txtIC2ProjSuper.Text)
    End Sub

    Private Sub txtIC2ProjSuperEmail_TextChanged(sender As Object, e As EventArgs) Handles txtIC2ProjSuperEmail.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtIC2ProjSuperEmail", txtIC2ProjSuperEmail.Text)
    End Sub

    Private Sub txtIC2ProjInsp_TextChanged(sender As Object, e As EventArgs) Handles txtIC2ProjInsp.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtIC2ProjInsp", txtIC2ProjInsp.Text)
    End Sub

    Private Sub txtIC2ProjInspEmail_TextChanged(sender As Object, e As EventArgs) Handles txtIC2ProjInspEmail.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtIC2ProjInspEmail", txtIC2ProjInspEmail.Text)
    End Sub

    Private Sub txtEircName_TextChanged(sender As Object, e As EventArgs) Handles txtEircName.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtEircName", txtEircName.Text)
    End Sub
    Private Sub txtEricEmail_TextChanged(sender As Object, e As EventArgs) Handles txtEricEmail.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtEricEmail", txtEricEmail.Text)
    End Sub

    Private Sub txtIC2PubAffInfo_TextChanged(sender As Object, e As EventArgs) Handles txtIC2PubAffInfo.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtIC2PubAffInfo", txtIC2PubAffInfo.Text)
    End Sub

    Private Sub txtIC2PubAffEmail_TextChanged(sender As Object, e As EventArgs) Handles txtIC2PubAffEmail.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtIC2PubAffEmail", txtIC2PubAffEmail.Text)
    End Sub

    Private Sub txtIC2EmrgyContact_TextChanged(sender As Object, e As EventArgs) Handles txtIC2EmrgyContact.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtIC2EmrgyContact", txtIC2EmrgyContact.Text)
    End Sub
    Private Sub grpEmrgyInfoEmail_TextChanged(sender As Object, e As EventArgs) Handles grpEmrgyInfoEmail.TextChanged
        _aspFormHelper.UpdateXMLDocument("grpEmrgyInfoEmail", grpEmrgyInfoEmail.Text)
    End Sub

    Private Sub txtCorrespond_TextChanged(sender As Object, e As EventArgs) Handles txtCorrespond.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtCorrespond", txtCorrespond.Text)
    End Sub
    Private Sub txtIIA_TextChanged(sender As Object, e As EventArgs) Handles txtIIA.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtIIA", txtIIA.Text)
    End Sub
    Private Sub txtIIE_TextChanged(sender As Object, e As EventArgs) Handles txtIIE.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtIIE", txtIIE.Text)
    End Sub
    Private Sub txtIIF_TextChanged(sender As Object, e As EventArgs) Handles txtIIF.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtIIF", txtIIF.Text)
    End Sub
    Private Sub txtIIG_TextChanged(sender As Object, e As EventArgs) Handles txtIIG.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtIIG", txtIIG.Text)
    End Sub
    Private Sub txtIIH_TextChanged(sender As Object, e As EventArgs) Handles txtIIH.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtIIH", txtIIH.Text)
    End Sub
    Private Sub txtIIAdditional_TextChanged(sender As Object, e As EventArgs) Handles txtIIAdditional.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtIIAdditional", txtIIAdditional.Text)
    End Sub
    Private Sub txtIIB1_TextChanged(sender As Object, e As EventArgs) Handles txtIIB1.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtIIB1", txtIIB1.Text)
    End Sub
    Private Sub txtIIB2_TextChanged(sender As Object, e As EventArgs) Handles txtIIB2.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtIIB2", txtIIB2.Text)
    End Sub
    Private Sub txtIIB4_TextChanged(sender As Object, e As EventArgs) Handles txtIIB4.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtIIB4", txtIIB4.Text)
    End Sub
    Private Sub txtIIB5_TextChanged(sender As Object, e As EventArgs) Handles txtIIB5.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtIIB5", txtIIB5.Text)
    End Sub
    Private Sub txtIIB7_TextChanged(sender As Object, e As EventArgs) Handles txtIIB7.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtIIB7", txtIIB7.Text)
    End Sub

    Private Sub txtIIC2_TextChanged(sender As Object, e As EventArgs) Handles txtIIC2.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtIIC2", txtIIC2.Text)
    End Sub
    Private Sub txtIID1_TextChanged(sender As Object, e As EventArgs) Handles txtIID1.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtIID1", txtIID1.Text)
    End Sub
    Private Sub txtIID2_TextChanged(sender As Object, e As EventArgs) Handles txtIID2.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtIID2", txtIID2.Text)
    End Sub
    Private Sub txtIID3_TextChanged(sender As Object, e As EventArgs) Handles txtIID3.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtIID3", txtIID3.Text)
    End Sub
    Private Sub txtIVAdditional_TextChanged(sender As Object, e As EventArgs) Handles txtIVAdditional.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtIVAdditional", txtIVAdditional.Text)
    End Sub
    Private Sub txtSafetyA_TextChanged(sender As Object, e As EventArgs) Handles txtSafetyA.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtSafetyA", txtSafetyA.Text)
    End Sub
    'Private Sub txtSafetyB_TextChanged(sender As Object, e As EventArgs) Handles txtSafetyB.TextChanged
    '  _aspFormHelper.UpdateXMLDocument("txtSafetyB", txtSafetyB.Text)
    'End Sub
    Private Sub txtSafetyC_TextChanged(sender As Object, e As EventArgs) Handles txtSafetyC.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtSafetyC", txtSafetyC.Text)
    End Sub
    Private Sub txtSafetyE_TextChanged(sender As Object, e As EventArgs) Handles txtSafetyE.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtSafetyE", txtSafetyE.Text)
    End Sub
    Private Sub txtSafetyF_TextChanged(sender As Object, e As EventArgs) Handles txtSafetyF.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtSafetyF", txtSafetyF.Text)
    End Sub
    Private Sub txtSafetyAdditional_TextChanged(sender As Object, e As EventArgs) Handles txtSafetyAdditional.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtSafetyAdditional", txtSafetyAdditional.Text)
    End Sub
    Private Sub chkSpecification_TextChanged(sender As Object, e As EventArgs) Handles chkSpecification.TextChanged
        _aspFormHelper.UpdateXMLDocument("chkSpecification", chkSpecification.Text)
    End Sub
    Private Sub txtVIA_TextChanged(sender As Object, e As EventArgs) Handles txtVIA.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtVIA", txtVIA.Text)
    End Sub
    Private Sub txtVIB_TextChanged(sender As Object, e As EventArgs) Handles txtVIB.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtVIB", txtVIB.Text)
    End Sub
    Private Sub txtIVD_TextChanged(sender As Object, e As EventArgs) Handles txtIVD.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtIVD", txtIVD.Text)
    End Sub

    'Private Sub txtCntrsRepPhone_TextChanged(sender As Object, e As EventArgs) Handles txtCntrsRepPhone.TextChanged
    '  _aspFormHelper.UpdateXMLDocument("txtCntrsRepPhone", txtCntrsRepPhone.Text)
    'End Sub
    'Private Sub txtEmergContactPhone_TextChanged(sender As Object, e As EventArgs) Handles txtEmergContactPhone.TextChanged
    '  _aspFormHelper.UpdateXMLDocument("txtEmergContactPhone", txtEmergContactPhone.Text)
    'End Sub
    Private Sub txtTrafficContolAdditional_TextChanged(sender As Object, e As EventArgs) Handles txtTrafficContolAdditional.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtTrafficContolAdditional", txtTrafficContolAdditional.Text)
    End Sub
    Private Sub txtVA_TextChanged(sender As Object, e As EventArgs) Handles txtVA.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtVA", txtVA.Text)
    End Sub
    Private Sub txtVIIC8_TextChanged(sender As Object, e As EventArgs) Handles txtVIIC8.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtVIIC8", txtVIIC8.Text)
    End Sub
    Private Sub txtVF5_TextChanged(sender As Object, e As EventArgs) Handles txtVF5.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtVF5", txtVF5.Text)
    End Sub
    Private Sub txtVG_TextChanged(sender As Object, e As EventArgs) Handles txtVG.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtVG", txtVG.Text)
    End Sub
    Private Sub txtProjMatAdditional_TextChanged(sender As Object, e As EventArgs) Handles txtProjMatAdditional.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtProjMatAdditional", txtProjMatAdditional.Text)
    End Sub
    Private Sub txtVIIIA1_TextChanged(sender As Object, e As EventArgs) Handles txtVIIIA1.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtVIIIA1", txtVIIIA1.Text)
    End Sub
    Private Sub txtVIIIA7_TextChanged(sender As Object, e As EventArgs) Handles txtVIIIA7.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtVIIIA7", txtVIIIA7.Text)
    End Sub

    'Private Sub txtVIIIB1CKDOT_TextChanged(sender As Object, e As EventArgs) Handles txtVIIIB1CKDOT.TextChanged
    '  _aspFormHelper.UpdateXMLDocument("txtVIIIB1CKDOT", txtVIIIB1CKDOT.Text)
    'End Sub
    'Private Sub txtVIIIB1DKDOT_TextChanged(sender As Object, e As EventArgs) Handles txtVIIIB1DKDOT.TextChanged
    '  _aspFormHelper.UpdateXMLDocument("txtVIIIB1DKDOT", txtVIIIB1DKDOT.Text)
    'End Sub
    'Private Sub txtVIIIB1CLPA_TextChanged(sender As Object, e As EventArgs) Handles txtVIIIB1CLPA.TextChanged
    '  _aspFormHelper.UpdateXMLDocument("txtVIIIB1CLPA", txtVIIIB1CLPA.Text)
    'End Sub
    'Private Sub txtVIIIB1DLPA_TextChanged(sender As Object, e As EventArgs) Handles txtVIIIB1DLPA.TextChanged
    '  _aspFormHelper.UpdateXMLDocument("txtVIIIB1DLPA", txtVIIIB1DLPA.Text)
    'End Sub
    Private Sub txtVIIIC_TextChanged(sender As Object, e As EventArgs) Handles txtVIIIC.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtVIIIC", txtVIIIC.Text)
    End Sub
    Private Sub txtVIIID1_TextChanged(sender As Object, e As EventArgs) Handles txtVIIID1.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtVIIID1", txtVIIID1.Text)
    End Sub
    Private Sub txtVIIID2_TextChanged(sender As Object, e As EventArgs) Handles txtVIIID2.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtVIIID2", txtVIIID2.Text)
    End Sub
    Private Sub txtVIIIE1_TextChanged(sender As Object, e As EventArgs) Handles txtVIIIE1.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtVIIIE1", txtVIIIE1.Text)
    End Sub
    Private Sub txtVIIIF2Cat1_TextChanged(sender As Object, e As EventArgs) Handles txtVIIIF2Cat1.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtVIIIF2Cat1", txtVIIIF2Cat1.Text)
    End Sub
    Private Sub txtVIIIF2_TextChanged(sender As Object, e As EventArgs) Handles txtVIIIF2.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtVIIIF2", txtVIIIF2.Text)
    End Sub
    Private Sub txtVIIIF6_TextChanged(sender As Object, e As EventArgs) Handles txtVIIIF6.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtVIIIF6", txtVIIIF6.Text)
    End Sub
    Private Sub txtVIIIF_TextChanged(sender As Object, e As EventArgs) Handles txtVIIIF.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtVIIIF", txtVIIIF.Text)
    End Sub
    Private Sub txtVIIIG_TextChanged(sender As Object, e As EventArgs) Handles txtVIIIG.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtVIIIG", txtVIIIG.Text)
    End Sub
    Private Sub txtVIIIG2_TextChanged(sender As Object, e As EventArgs) Handles txtVIIIG2.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtVIIIG2", txtVIIIG2.Text)
    End Sub
    Private Sub txtVIIIH_TextChanged(sender As Object, e As EventArgs) Handles txtVIIIH.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtVIIIH", txtVIIIH.Text)
    End Sub
    Private Sub txtVIIIK1_TextChanged(sender As Object, e As EventArgs) Handles txtVIIIK1.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtVIIIK1", txtVIIIK1.Text)
    End Sub
    Private Sub txtVIIIK2_TextChanged(sender As Object, e As EventArgs) Handles txtVIIIK2.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtVIIIK2", txtVIIIK2.Text)
    End Sub
    Private Sub txtVIIIK3_TextChanged(sender As Object, e As EventArgs) Handles txtVIIIK3.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtVIIIK3", txtVIIIK3.Text)
    End Sub
    Private Sub txtVIIIK4_TextChanged(sender As Object, e As EventArgs) Handles txtVIIIK4.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtVIIIK4", txtVIIIK4.Text)
    End Sub
    Private Sub txtProjectConstruction_TextChanged(sender As Object, e As EventArgs) Handles txtProjectConstruction.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtProjectConstruction", txtProjectConstruction.Text)
    End Sub
    Private Sub txtIXB_TextChanged(sender As Object, e As EventArgs) Handles txtIXB.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtIXB", txtIXB.Text)
    End Sub
    Private Sub txtIXAdditional_TextChanged(sender As Object, e As EventArgs) Handles txtIXAdditional.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtIXAdditional", txtIXAdditional.Text)
    End Sub

    Private Sub chkVI6DOD_CheckedChanged(sender As Object, e As EventArgs) Handles chkVI6DOD.CheckedChanged
        _aspFormHelper.UpdateXMLDocument("chkVI6DOD", chkVI6DOD.Checked.ToString.ToLower)
    End Sub
    Private Sub chkVI6Ag_CheckedChanged(sender As Object, e As EventArgs) Handles chkVI6Ag.CheckedChanged
        _aspFormHelper.UpdateXMLDocument("chkVI6Ag", chkVI6Ag.Checked.ToString.ToLower)
    End Sub
    Private Sub chkVI6KCC_CheckedChanged(sender As Object, e As EventArgs) Handles chkVI6KCC.CheckedChanged
        _aspFormHelper.UpdateXMLDocument("chkVI6KCC", chkVI6KCC.Checked.ToString.ToLower)
    End Sub
    Private Sub chkVI6Parks_CheckedChanged(sender As Object, e As EventArgs) Handles chkVI6Parks.CheckedChanged
        _aspFormHelper.UpdateXMLDocument("chkVI6Parks", chkVI6Parks.Checked.ToString.ToLower)
    End Sub
    Private Sub chkVI6KDHE_CheckedChanged(sender As Object, e As EventArgs) Handles chkVI6KDHE.CheckedChanged
        _aspFormHelper.UpdateXMLDocument("chkVI6KDHE", chkVI6KDHE.Checked.ToString.ToLower)
    End Sub
    Private Sub chkVI6KHS_CheckedChanged(sender As Object, e As EventArgs) Handles chkVI6KHS.CheckedChanged
        _aspFormHelper.UpdateXMLDocument("chkVI6KHS", chkVI6KHS.Checked.ToString.ToLower)
    End Sub

    Private Sub SetNextFocusClientId(clientId As String)
        Dim safeId = clientId.Replace("\", "\\").Replace("'", "\'")
        Dim js As String =
                            "try{
                              sessionStorage.setItem('kdot_next_focus','" & safeId & "');
                            }catch(e){}
                            (function(){
                              var lf = document.getElementById('__LASTFOCUS') || document.querySelector('input[name=""__LASTFOCUS""]');
                              if(lf) lf.value = '" & safeId & "';
                              setTimeout(function(){
                                var el = document.getElementById('" & safeId & "');
                                if(el) el.focus();
                              }, 50);
                            })();"

        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "kdot_focus_" & safeId, js, True)
    End Sub


    Private Sub txtMtgAdjourned_TextChanged(sender As Object, e As EventArgs) Handles txtMtgAdjourned.TextChanged
        mouseLoc.Value = ""

        ' Determine if this postback was triggered by TAB
        Dim tabbingToReview As Boolean = (hfTabToReviewAction.Value = "1")

        ' Set focus target for the postback lifecycle
        If tabbingToReview Then
            myFocusField = "UCSubmit1_ReviewAction"   ' Focus should move to dropdown
        Else
            myFocusField = "txtMtgAdjourned"          ' Normal behavior
        End If

        If Not String.IsNullOrEmpty(txtMtgAdjourned.Text) Then
            Dim time As Date
            Try
                _aspFormHelper.SetErrorField("txtMtgAdjourned", "TextBox", "Reset", "")
                time = TimeValue(txtMtgAdjourned.Text)
                txtMtgAdjourned.Text = time.ToString("h:mm tt")
                _aspFormHelper.UpdateXMLDocument("txtMtgAdjourned", txtMtgAdjourned.Text)
            Catch
                Try
                    If Not txtMtgAdjourned.Text.Contains(":") Then
                        txtMtgAdjourned.Text = txtMtgAdjourned.Text & ":00"
                        time = TimeValue(txtMtgAdjourned.Text)
                        txtMtgAdjourned.Text = time.ToString("h:mm tt")
                        _aspFormHelper.UpdateXMLDocument("txtMtgAdjourned", txtMtgAdjourned.Text)
                    Else
                        _aspFormHelper.MsgBox("Invalid time entered")
                        txtMtgAdjourned.Text = ""
                        _aspFormHelper.UpdateXMLDocument("txtMtgAdjourned", "")
                    End If
                Catch
                    _aspFormHelper.MsgBox("Invalid time entered.")
                    _aspFormHelper.SetErrorField("txtMtgAdjourned", "TextBox", "Set", "Invalid Time")
                    txtMtgAdjourned.Text = ""
                    _aspFormHelper.UpdateXMLDocument("txtMtgAdjourned", "")
                End Try
            End Try
        End If

        If tabbingToReview Then
            SetNextFocusClientId("UCSubmit1_ReviewAction")
        End If
        hfTabToReviewAction.Value = "0"
    End Sub

    Private Sub LoadSpecialFields()
        Try
            optQCSubmitted.SelectedValue = _aspFormHelper.GetXMLValue("optQCSubmitted")
        Catch
        End Try
        txtVIIIF2Cat1.Text = _aspFormHelper.GetXMLValue("txtVIIIF2Cat1")
        txtVIIIF2.Text = _aspFormHelper.GetXMLValue("txtVIIIF2")
        txtCatBSupervisor.Text = _aspFormHelper.GetXMLValue("txtCatBSupervisor")
        Try
            optDrilledShafts.SelectedValue = _aspFormHelper.GetXMLValue("optDrilledShafts")
        Catch
        End Try
    End Sub
    Private Sub GetFCAInfo()
        Dim myWS As New CMSForms.CMSForms
        Dim myResp As New CMSForms.FCAInfo
        myResp = myWS.GetFCAforContract(ContractNumber.Text)
        _aspFormHelper.UpdateXMLDocument("FCA", myResp.NTLogin)
    End Sub

    Protected Sub txtIIB61A_TextChanged(sender As Object, e As EventArgs) Handles txtIIB61A.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtIIB61A", txtIIB61A.Text)
    End Sub

    Protected Sub txtFieldErectSuper_TextChanged(sender As Object, e As EventArgs) Handles txtFieldErectSuper.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtFieldErectSuper", txtFieldErectSuper.Text)
    End Sub

    Private Sub txtOffice_TextChanged(sender As Object, e As EventArgs) Handles txtOffice.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtOffice", txtOffice.Text)
    End Sub

    Private Sub txtLocation_TextChanged(sender As Object, e As EventArgs) Handles txtLocation.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtLocation", txtLocation.Text)
    End Sub

    Private Sub optElecDep_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optElecDep.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optElecDep", optElecDep.SelectedValue)
    End Sub

    Private Sub optSurveying_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optSurveying.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optSurveying", optSurveying.SelectedValue)
    End Sub

    'Protected Sub optStormwater_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optStormwater.SelectedIndexChanged
    '  _aspFormHelper.UpdateXMLDocument("optStormwater", optStormwater.SelectedValue)
    'End Sub

    Private Sub optAsphPaving_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optAsphPaving.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optAsphPaving", optAsphPaving.SelectedValue)
    End Sub

    Private Sub optConcPaving_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optConcPaving.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optConcPaving", optConcPaving.SelectedValue)
    End Sub

    Private Sub optConcPavQCSub_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optConcPavQCSub.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optConcPavQCSub", optConcPavQCSub.SelectedValue)
    End Sub

    Private Sub optContDemoSuper_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optContDemoSuper.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optContDemoSuper", optContDemoSuper.SelectedValue)
    End Sub

    Private Sub optDBEChanged_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optDBEChanged.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optDBEChanged", optDBEChanged.SelectedValue)
    End Sub

    Private Sub optDBEGoal_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optDBEGoal.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optDBEGoal", optDBEGoal.SelectedValue)
    End Sub

    Private Sub optDBEParticipation_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optDBEParticipation.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optDBEParticipation", optDBEParticipation.SelectedValue)
    End Sub

    Private Sub optDBETruck_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optDBETruck.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optDBETruck", optDBETruck.SelectedValue)
    End Sub

    Private Sub optDBETruckList_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optDBETruckList.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optDBETruckList", optDBETruckList.SelectedValue)
    End Sub

    Private Sub optDesignatedEEO_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optDesignatedEEO.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optDesignatedEEO", optDesignatedEEO.SelectedValue)
    End Sub

    Private Sub optDrilledShafts_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optDrilledShafts.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optDrilledShafts", optDrilledShafts.SelectedValue)
    End Sub

    Private Sub optEnvProtection_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optEnvProtection.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optEnvProtection", optEnvProtection.SelectedValue)
    End Sub

    Private Sub optFalsework_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optFalsework.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optFalsework", optFalsework.SelectedValue)
    End Sub

    Private Sub optFieldErecSuper_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optFieldErecSuper.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optFieldErecSuper", optFieldErecSuper.SelectedValue)
    End Sub

    Private Sub optGrading_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optGrading.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optGrading", optGrading.SelectedValue)
    End Sub

    Private Sub optHaulRoads_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optHaulRoads.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optHaulRoads", optHaulRoads.SelectedValue)
    End Sub

    Private Sub optLogoSigns_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optLogoSigns.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optLogoSigns", optLogoSigns.SelectedValue)
    End Sub

    Private Sub optROWAcquired_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optROWAcquired.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optROWAcquired", optROWAcquired.SelectedValue)
    End Sub

    Private Sub optNAROW_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optNAROW.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optNAROW", optNAROW.SelectedValue)
    End Sub

    Private Sub optUtility_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optUtility.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optUtility", optUtility.SelectedValue)
    End Sub

    Private Sub optLotID_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optLotID.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optLotID", optLotID.SelectedValue)
    End Sub

    Private Sub optLtrDBEMob_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optLtrDBEMob.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optLtrDBEMob", optLtrDBEMob.SelectedValue)
    End Sub

    Private Sub optPmtFreq_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optPmtFreq.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optPmtFreq", optPmtFreq.SelectedValue)
    End Sub

    Private Sub optPosters_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optPosters.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optPosters", optPosters.SelectedValue)
    End Sub

    Private Sub optQC_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optQC.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optQC", optQC.SelectedValue)
    End Sub

    Private Sub optQCSubmitted_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optQCSubmitted.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optQCSubmitted", optQCSubmitted.SelectedValue)
    End Sub

    Private Sub optStoredMaterials_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optStoredMaterials.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optStoredMaterials", optStoredMaterials.SelectedValue)
    End Sub

    Private Sub optStructures_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optStructures.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optStructures", optStructures.SelectedValue)
    End Sub

    Private Sub optTrainees_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optTrainees.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optTrainees", optTrainees.SelectedValue)
    End Sub

    Private Sub optVIIIB1c_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optVIIIB1c.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optVIIIB1c", optVIIIB1c.SelectedValue)
    End Sub

    Private Sub optVIIIB1d_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optVIIIB1d.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optVIIIB1d", optVIIIB1d.SelectedValue)
    End Sub

    Private Sub optVIIIB1ea_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optVIIIB1ea.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optVIIIB1ea", optVIIIB1ea.SelectedValue)
    End Sub

    Private Sub optVIIIB1eb_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optVIIIB1eb.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optVIIIB1eb", optVIIIB1eb.SelectedValue)
    End Sub

    Private Sub optVIIIK3_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optVIIIK3.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optVIIIK3", optVIIIK3.SelectedValue)
    End Sub

    Private Sub txtEEOOfficer_TextChanged(sender As Object, e As EventArgs) Handles txtEEOOfficer.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtEEOOfficer", txtEEOOfficer.Text)
    End Sub

    Private Sub txtCntrsRep_TextChanged(sender As Object, e As EventArgs) Handles txtCntrsRep.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtCntrsRep", txtCntrsRep.Text)
    End Sub

    Private Sub txtEmergContact_TextChanged(sender As Object, e As EventArgs) Handles txtEmergContact.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtEmergContact", txtEmergContact.Text)
    End Sub

    Private Sub txtVIIIJ1_TextChanged(sender As Object, e As EventArgs) Handles txtVIIIJ1.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtVIIIJ1", txtVIIIJ1.Text)
    End Sub

    Private Sub txtCntrlDemoSuper_TextChanged(sender As Object, e As EventArgs) Handles txtCntrlDemoSuper.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtCntrlDemoSuper", txtCntrlDemoSuper.Text)
    End Sub

    Private Sub txtCatBSupervisor_TextChanged(sender As Object, e As EventArgs) Handles txtCatBSupervisor.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtCatBSupervisor", txtCatBSupervisor.Text)
    End Sub

    Private Sub txtVIIII_TextChanged(sender As Object, e As EventArgs) Handles txtVIIII.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtVIIII", txtVIIII.Text)
    End Sub

    Private Sub chkControlDemoCatA_CheckedChanged(sender As Object, e As EventArgs) Handles chkControlDemoCatA.CheckedChanged
        _aspFormHelper.UpdateXMLDocument("chkControlDemoCatA", chkControlDemoCatA.Checked.ToString.ToLower)
    End Sub

    Private Sub chkControlDemoCatB_CheckedChanged(sender As Object, e As EventArgs) Handles chkControlDemoCatB.CheckedChanged
        _aspFormHelper.UpdateXMLDocument("chkControlDemoCatB", chkControlDemoCatB.Checked.ToString.ToLower)
    End Sub

    Private Sub chkControlDemoCatC_CheckedChanged(sender As Object, e As EventArgs) Handles chkControlDemoCatC.CheckedChanged
        _aspFormHelper.UpdateXMLDocument("chkControlDemoCatC", chkControlDemoCatC.Checked.ToString.ToLower)
    End Sub
    Public Sub UpdateDBEFields()
        _aspFormHelper.UpdateXMLDocument("optStormwater", optStormwater.SelectedValue)
        If optStormwater.SelectedValue = "3" Then
            _aspFormHelper.UpdateXMLDocument("txtContWPCM", txtContWPCMKDOT.Text)
            _aspFormHelper.UpdateXMLDocument("txtContWPCMLPA", txtContWPCMKDOT.Text)
            _aspFormHelper.UpdateXMLDocument("txtContWPCMKDOT", txtContWPCMKDOT.Text)
            _aspFormHelper.UpdateXMLDocument("txtMetroEng", txtMetroEngKDOT.Text)
            _aspFormHelper.UpdateXMLDocument("txtMetroEngLPA", txtMetroEngKDOT.Text)
            _aspFormHelper.UpdateXMLDocument("txtMetroEngKDOT", txtMetroEngKDOT.Text)
            _aspFormHelper.UpdateXMLDocument("txtVIIIB1C", txtVIIIB1CKDOT.Text)
            _aspFormHelper.UpdateXMLDocument("txtVIIIB1CLPA", txtVIIIB1CKDOT.Text)
            _aspFormHelper.UpdateXMLDocument("txtVIIIB1CKDOT", txtVIIIB1CKDOT.Text)
            _aspFormHelper.UpdateXMLDocument("txtVIIIB1D", txtVIIIB1DKDOT.Text)
            _aspFormHelper.UpdateXMLDocument("txtVIIIB1DLPA", txtVIIIB1DKDOT.Text)
            _aspFormHelper.UpdateXMLDocument("txtVIIIB1DKDOT", txtVIIIB1DKDOT.Text)
            _aspFormHelper.UpdateXMLDocument("txtStormwaterPreconstConf", txtStormwaterPreconstConfKDOT.Text)
            _aspFormHelper.UpdateXMLDocument("txtStormwaterPreconstConfLPA", txtStormwaterPreconstConfKDOT.Text)
            _aspFormHelper.UpdateXMLDocument("txtStormwaterPreconstConfKDOT", txtStormwaterPreconstConfKDOT.Text)
        ElseIf optStormwater.SelectedValue = "4" Then
            _aspFormHelper.UpdateXMLDocument("txtContWPCM", txtContWPCMLPA.Text)
            _aspFormHelper.UpdateXMLDocument("txtContWPCMKDOT", txtContWPCMLPA.Text)
            _aspFormHelper.UpdateXMLDocument("txtContWPCMLPA", txtContWPCMLPA.Text)
            _aspFormHelper.UpdateXMLDocument("txtMetroEng", txtMetroEngLPA.Text)
            _aspFormHelper.UpdateXMLDocument("txtMetroEngKDOT", txtMetroEngLPA.Text)
            _aspFormHelper.UpdateXMLDocument("txtMetroEngLPA", txtMetroEngLPA.Text)
            _aspFormHelper.UpdateXMLDocument("txtVIIIB1C", txtVIIIB1CLPA.Text)
            _aspFormHelper.UpdateXMLDocument("txtVIIIB1CKDOT", txtVIIIB1CLPA.Text)
            _aspFormHelper.UpdateXMLDocument("txtVIIIB1CLPA", txtVIIIB1CLPA.Text)
            _aspFormHelper.UpdateXMLDocument("txtVIIIB1D", txtVIIIB1DLPA.Text)
            _aspFormHelper.UpdateXMLDocument("txtVIIIB1DKDOT", txtVIIIB1DLPA.Text)
            _aspFormHelper.UpdateXMLDocument("txtVIIIB1DLPA", txtVIIIB1DLPA.Text)
            _aspFormHelper.UpdateXMLDocument("txtStormwaterPreconstConf", txtStormwaterPreconstConfLPA.Text)
            _aspFormHelper.UpdateXMLDocument("txtStormwaterPreconstConfKDOT", txtStormwaterPreconstConfLPA.Text)
            _aspFormHelper.UpdateXMLDocument("txtStormwaterPreconstConfLPA", txtStormwaterPreconstConfLPA.Text)
        End If
    End Sub

    Private Sub optStormwater_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optStormwater.SelectedIndexChanged
        _aspFormHelper.UpdateXMLDocument("optStormwater", optStormwater.SelectedValue)
    End Sub

    Private Sub txtVB_TextChanged(sender As Object, e As EventArgs) Handles txtVB.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtVB", txtVB.Text)
    End Sub

    Private Sub txtIC1ProjSuperOrg_TextChanged(sender As Object, e As EventArgs) Handles txtIC1ProjSuperOrg.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtIC1ProjSuperOrg", txtIC1ProjSuperOrg.Text)
    End Sub

    Private Sub txtIIIAdditional_TextChanged(sender As Object, e As EventArgs) Handles txtIIIAdditional.TextChanged
        _aspFormHelper.UpdateXMLDocument("txtIIIAdditional", txtIIIAdditional.Text)
    End Sub

    Protected Sub optPlanQty_TextChanged(sender As Object, e As EventArgs) Handles optPlanQty.TextChanged
        '
        _aspFormHelper.UpdateXMLDocument("optPlanQty", optPlanQty.SelectedValue)
        '
        If optPlanQty.SelectedValue = "1" Then
            group7.Style.Add("display", "none")
            txtVIIIC.Visible = True
        ElseIf optPlanQty.SelectedValue = "2" Then
            group7.Style.Add("display", "inline")
            txtVIIIC.Visible = True
        ElseIf optPlanQty.SelectedValue = "3" Then
            group7.Style.Add("display", "none")
            txtVIIIC.Visible = False
        End If
        '
    End Sub

End Class