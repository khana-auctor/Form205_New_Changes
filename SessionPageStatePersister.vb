Imports System
Imports System.IO
Imports System.Web
Imports System.Web.UI

Public Class SessionPageStatePersister
    Inherits PageStatePersister

    Public Sub New(page As Page)
        MyBase.New(page)
    End Sub

    Private Const INSTANCE_CACHE_KEY As String = "__FORM_INSTANCE_ID"

    Private Function GetStableInstanceId() As String
        Try
            ' ✅ Per-request cache
            If Page.Items(INSTANCE_CACHE_KEY) IsNot Nothing Then
                Return CStr(Page.Items(INSTANCE_CACHE_KEY))
            End If

            Dim id As String = Nothing

            ' -------------------------------------------------
            ' 1️⃣ FlowWright task-based forms
            ' -------------------------------------------------
            Dim taskId As String = Nothing
            Try
                taskId = Page.Request.QueryString("taskID")
            Catch
            End Try

            If Not String.IsNullOrEmpty(taskId) Then
                id = "TASK_" & taskId.ToLowerInvariant()

                ' -------------------------------------------------
                ' 2️⃣ TRUE per-tab GUID (STABLE)
                ' -------------------------------------------------
            ElseIf Page.Session IsNot Nothing Then

                Dim guidKey As String =
                Page.AppRelativeVirtualPath & "_TAB_GUID"

                If Page.Session(guidKey) Is Nothing Then
                    Page.Session(guidKey) = Guid.NewGuid().ToString("N")
                End If

                id = "TAB_" & CStr(Page.Session(guidKey))

            Else
                id = "SESSION_MISSING"
            End If

            Page.Items(INSTANCE_CACHE_KEY) = id
            Return id

        Catch
            Return "FAILSAFE"
        End Try
    End Function


    Private Function BuildKey() As String
        Try
            Dim pagePath As String = Page.AppRelativeVirtualPath.ToLowerInvariant()
            If pagePath.EndsWith("/") Then pagePath &= "default.aspx"

            Return "VIEWSTATE_" & pagePath & "_" & GetStableInstanceId()

        Catch
            Return "VIEWSTATE_FAILSAFE"
        End Try
    End Function

    Public Overrides Sub Load()
        Try
            If Page.Session Is Nothing Then
                ViewState = Nothing
                ControlState = Nothing
                Return
            End If

            Dim key As String = BuildKey()
            Dim payload As String = TryCast(Page.Session(key), String)

            If String.IsNullOrEmpty(payload) Then
                ViewState = Nothing
                ControlState = Nothing
                Return
            End If

            Dim formatter As New LosFormatter()
            Using sr As New StringReader(payload)
                Dim pair As Pair = TryCast(formatter.Deserialize(sr), Pair)
                If pair IsNot Nothing Then
                    ViewState = pair.First
                    ControlState = pair.Second
                Else
                    ViewState = Nothing
                    ControlState = Nothing
                End If
            End Using

        Catch
            ViewState = Nothing
            ControlState = Nothing
        End Try
    End Sub

    Public Overrides Sub Save()
        Try
            If Page.Session Is Nothing Then Return
            If ViewState Is Nothing AndAlso ControlState Is Nothing Then Return

            Dim key As String = BuildKey()
            Dim formatter As New LosFormatter()

            Using sw As New StringWriter()
                formatter.Serialize(sw, New Pair(ViewState, ControlState))
                Page.Session(key) = sw.ToString()
            End Using

        Catch
            ' NEVER throw
        End Try
    End Sub

End Class
