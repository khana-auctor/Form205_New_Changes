Imports System.Web
Imports System.Web.UI

Public NotInheritable Class FormInstance
    Private Sub New()
    End Sub

    Private Const HiddenName As String = "__formInstance" ' canonical name

    Public Shared Function GetOrCreate(page As Page) As String
        Dim ctx = HttpContext.Current
        If ctx Is Nothing Then Return "no-http"

        ' 0) Per-request cache (critical so every caller gets the SAME value this request)
        Dim cached = TryCast(ctx.Items("FormInstance"), String)
        If Not String.IsNullOrEmpty(cached) Then Return cached

        Dim req = page.Request
        Dim inst As String = Nothing

        ' 1) Canonical hidden field (RegisterHiddenField renders exactly this name)
        inst = req.Form(HiddenName)
        If Not String.IsNullOrEmpty(inst) Then
            ctx.Items("FormInstance") = inst
            Return inst
        End If

        ' 2) If you are using an <asp:HiddenField ID="hfFormInstance" ...>,
        ' its posted key is the UniqueID (can be prefixed by naming containers).
        ' Find it safely by suffix.
        Dim keys = req.Form.AllKeys
        If keys IsNot Nothing Then
            For Each k In keys
                If k IsNot Nothing AndAlso k.EndsWith("$hfFormInstance", StringComparison.OrdinalIgnoreCase) Then
                    inst = req.Form(k)
                    Exit For
                End If
            Next
        End If

        If Not String.IsNullOrEmpty(inst) Then
            ctx.Items("FormInstance") = inst
            Return inst
        End If

        ' 3) First GET (no post yet) -> create new
        inst = Guid.NewGuid().ToString("N")

        ' Ensure the canonical hidden field exists in HTML so it posts back
        page.ClientScript.RegisterHiddenField(HiddenName, inst)

        ctx.Items("FormInstance") = inst
        Return inst
    End Function
End Class
