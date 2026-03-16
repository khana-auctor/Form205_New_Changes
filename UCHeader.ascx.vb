Imports CommonClass
Imports System.Xml
Partial Public Class UCHeader
    Inherits System.Web.UI.UserControl
    Private _aspFormHelper As New ASPFormHelper
    Private myPage As Page



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            myPage = HttpContext.Current.Session("myPage")

            CurrentTaskName.Text = _aspFormHelper.GetXMLValue("CurrentTaskName")
            ReferenceId.Text = _aspFormHelper.GetXMLValue("FormId")
            If Not String.IsNullOrEmpty(_aspFormHelper.GetXMLValue("Messages")) Then
                UCMessageBox1.Visible = "true"
                Dim myPanel As New Panel
                myPanel = myPage.FindControl("pnlMainPage")
                myPanel.Enabled = False
                'hide the Submit user control
                Dim myPanelSubmit As New Panel
                myPanelSubmit = myPage.FindControl("pnlUCSubmit")
                myPanelSubmit.Enabled = False
                'hide the attachments user control
                Dim myPanelAttachment As New Panel
                myPanelAttachment = myPage.FindControl("pnlUCAttachment")
                myPanelAttachment.Enabled = False
                'see if we have any messages entered from one of the other user controls before a final submit/save has been done
                Dim myMessagebox As New Panel
                myMessagebox = UCMessageBox1.FindControl("pnlMessage")
                Dim myMessages As New TextBox
                myMessages = myMessagebox.FindControl("txtMessage")
                myMessages.Text = _aspFormHelper.GetXMLValue("Messages")
            End If
        End If
    End Sub

    Protected Sub MessagesButton_Click(ByVal sender As Object, ByVal e As EventArgs) Handles MessagesButton.Click
        myPage = HttpContext.Current.Session("myPage")
        UCMessageBox1.Visible = "true"
        'hide the main page
        Dim myPanel As New Panel
        myPanel = myPage.FindControl("pnlMainPage")
        myPanel.Enabled = False

        Try 'hide the Submit user control
            Dim myPanelSubmit As New Panel
            myPanelSubmit = myPage.FindControl("pnlUCSubmit")
            myPanelSubmit.Enabled = False
        Catch
            'skip
        End Try

        Try
            'hide the attachments user control
            Dim myPanelAttachment As New Panel
            myPanelAttachment = myPage.FindControl("pnlUCAttachment")
            myPanelAttachment.Enabled = False
        Catch
            'skip
        End Try

        'see if we have any messages entered from one of the other user controls before a final submit/save has been done
        Dim myMessagebox As New Panel
        myMessagebox = UCMessageBox1.FindControl("pnlMessage")

        Dim myMessages As New TextBox
        myMessages = myMessagebox.FindControl("txtMessage")
        myMessages.Text = _aspFormHelper.GetXMLValue("Messages")

    End Sub

    Protected Sub ReleaseButton_Click(ByVal sender As Object, ByVal e As EventArgs) Handles ReleaseButton.Click
        _aspFormHelper.ReleaseCurrentTask()
    End Sub
    Protected Sub cmdPrintPreview_Click(ByVal sender As Object, ByVal e As EventArgs) Handles cmdPrintPreview.Click

        ' 0) (optional) validate first
        'Page.Validate()
        'If Not Page.IsValid Then Exit Sub

        ' 1) Sync current postback values -> FormXML/DB/Session (whatever CreateHTMLFileX uses)
        SaveLatestValuesForPrintPreview()

        _aspFormHelper.IsPrintPreview = True


        _aspFormHelper.CreateHTMLFileX()
        '
        _aspFormHelper.IsPrintPreview = False
        '
        Dim formid As String = ReferenceId.Text
        Dim myFile As String = ConfigurationManager.AppSettings("HTMLFileLocation") & formid & ".html"
        Response.ContentType = "text/html"  '"application/octet-stream"
        Response.Clear()
        Response.TransmitFile(myFile)
        Response.End()
    End Sub



    Private Sub SaveLatestValuesForPrintPreview()
        Dim xml As String = _aspFormHelper.SessionFormXml
        If String.IsNullOrWhiteSpace(xml) Then Exit Sub

        Dim doc As New XmlDocument()
        doc.LoadXml(xml)

        For Each key As String In Request.Form.AllKeys
            If String.IsNullOrWhiteSpace(key) Then Continue For

            ' Skip ASP.NET framework fields
            If key.StartsWith("__", StringComparison.OrdinalIgnoreCase) Then Continue For
            If key.Equals("ctl00$ScriptManager1", StringComparison.OrdinalIgnoreCase) Then Continue For

            ' WebForms naming containers create keys with "$"
            ' Those almost never match your XML node names directly.
            ' If your XML node names match simple IDs (txtSafetyC, dteMtgDate, etc),
            ' extract the last segment after "$".
            Dim simpleName As String = key
            If key.Contains("$") Then
                simpleName = key.Substring(key.LastIndexOf("$"c) + 1)
            End If

            ' Some controls post additional keys like "txtSomething$State"
            If simpleName.Contains("$") Then
                simpleName = simpleName.Substring(simpleName.LastIndexOf("$"c) + 1)
            End If

            ' Ignore empties
            If String.IsNullOrWhiteSpace(simpleName) Then Continue For

            Dim val As String = Request.Form(key)

            ' Safe XPath: match element by local-name() so we don’t have to embed the name as a token
            Dim xpath As String = "//*[local-name()='" & EscapeForXPathLiteral(simpleName) & "']"
            Dim node As XmlNode = doc.SelectSingleNode(xpath)

            If node IsNot Nothing Then
                node.InnerText = val
            End If
        Next

        _aspFormHelper.SessionFormXml = doc.OuterXml   ' 
    End Sub

    ' Escapes a string for use inside a single-quoted XPath literal
    Private Function EscapeForXPathLiteral(value As String) As String
        ' simplest approach: if no single quote, return as-is
        If value.IndexOf("'"c) < 0 Then Return value

        ' If it contains single quotes, build concat('a',"'",'b')
        Dim parts = value.Split("'"c)
        Dim sb As New System.Text.StringBuilder()
        sb.Append("concat(")
        For i = 0 To parts.Length - 1
            If i > 0 Then sb.Append(",""'"",")
            sb.Append("'" & parts(i) & "'")
            If i < parts.Length - 1 Then sb.Append(",")
        Next
        sb.Append(")")
        Return sb.ToString()
    End Function


End Class