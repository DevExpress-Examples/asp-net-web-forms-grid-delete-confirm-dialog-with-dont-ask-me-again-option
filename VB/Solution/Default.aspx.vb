Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        If (Not IsPostBack) Then
            CustomizePopupControlAppearance()
        End If
    End Sub

    Private Sub CustomizePopupControlAppearance()
        ASPxPopupControl1.Modal = True

        'Make the ASPxPopupControl's elements invisible
        ASPxPopupControl1.BackColor = System.Drawing.Color.Transparent
        ASPxPopupControl1.Border.BorderWidth = 0
        ASPxPopupControl1.ContentStyle.Paddings.Padding = 0
        ASPxPopupControl1.ShowHeader = False
        ASPxPopupControl1.ShowSizeGrip = DevExpress.Web.ShowSizeGrip.False
        ASPxPopupControl1.ShowShadow = False

        'Specify that the ASPxPopupControl can only be invoked and closed programmatically
        ASPxPopupControl1.PopupAction = DevExpress.Web.PopupAction.None
        ASPxPopupControl1.CloseAction = DevExpress.Web.CloseAction.None

        'Make the ASPxPopupControl displayed centered within the ASPxGridView
        ASPxPopupControl1.PopupElementID = "ASPxGridView1"
        ASPxPopupControl1.PopupHorizontalAlign = DevExpress.Web.PopupHorizontalAlign.Center
        ASPxPopupControl1.PopupVerticalAlign = DevExpress.Web.PopupVerticalAlign.Middle
    End Sub

    Protected Sub btnReloadDemo_Click(ByVal sender As Object, ByVal e As EventArgs)
        'Reset the grid's data source
        Session("GridDataSource") = Nothing

        Response.Redirect("Default.aspx")
    End Sub

End Class