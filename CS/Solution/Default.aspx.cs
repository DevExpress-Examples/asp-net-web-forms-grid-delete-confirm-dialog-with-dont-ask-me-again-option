using System;

namespace Solution {
    public partial class Default : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) CustomizePopupControlAppearance();
        }

        void CustomizePopupControlAppearance() {
            ASPxPopupControl1.Modal = true;

            // Make the ASPxPopupControl's elements invisible
            ASPxPopupControl1.BackColor = System.Drawing.Color.Transparent;
            ASPxPopupControl1.Border.BorderWidth = 0;
            ASPxPopupControl1.ContentStyle.Paddings.Padding = 0;
            ASPxPopupControl1.ShowHeader = false;
            ASPxPopupControl1.ShowSizeGrip = DevExpress.Web.ShowSizeGrip.False;
            ASPxPopupControl1.ShowShadow = false;

            // Specify that the ASPxPopupControl can only be invoked and closed programmatically
            ASPxPopupControl1.PopupAction = DevExpress.Web.PopupAction.None;
            ASPxPopupControl1.CloseAction = DevExpress.Web.CloseAction.None;

            // Make the ASPxPopupControl displayed centered within the ASPxGridView
            ASPxPopupControl1.PopupElementID = "ASPxGridView1";
            ASPxPopupControl1.PopupHorizontalAlign = DevExpress.Web.PopupHorizontalAlign.Center;
            ASPxPopupControl1.PopupVerticalAlign = DevExpress.Web.PopupVerticalAlign.Middle;
        }

        protected void btnReloadDemo_Click(object sender, EventArgs e) {
            // Reset the grid's data source
            Session["GridDataSource"] = null;
            Response.Redirect("Default.aspx");
        }
    }
}