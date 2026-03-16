<%@ WebHandler Language="VB" Class="KeepAlive" %>
Imports System.Web
Imports System.Web.SessionState
Imports System


Public Class KeepAlive : Implements IHttpHandler, IRequiresSessionState
    Public Sub ProcessRequest(context As HttpContext) Implements IHttpHandler.ProcessRequest
        ' Touch session so InProc doesn’t go idle for this user
        context.Session("KeepAlive") = DateTime.UtcNow.Ticks
        context.Response.StatusCode = 204 ' No Content
    End Sub

    Public ReadOnly Property IsReusable As Boolean Implements IHttpHandler.IsReusable
        Get
            Return True
        End Get
    End Property
End Class
