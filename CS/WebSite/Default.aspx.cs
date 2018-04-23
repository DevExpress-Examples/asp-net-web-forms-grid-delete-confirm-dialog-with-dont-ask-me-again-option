using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.Web.ASPxRoundPanel;
using DevExpress.Web.ASPxEditors;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) CustomizePopupControlAppearance();
    }

    void CustomizePopupControlAppearance() { 
        ASPxPopupControl1.Modal = true;

        //Make the ASPxPopupControl's elements invisible
        ASPxPopupControl1.BackColor = System.Drawing.Color.Transparent;
        ASPxPopupControl1.Border.BorderWidth = 0;
        ASPxPopupControl1.ContentStyle.Paddings.Padding = 0;
        ASPxPopupControl1.ShowHeader = false;
        ASPxPopupControl1.ShowSizeGrip = DevExpress.Web.ASPxPopupControl.ShowSizeGrip.False;
        ASPxPopupControl1.ShowShadow = false;

        //Specify that the ASPxPopupControl can only be invoked and closed programmatically
        ASPxPopupControl1.PopupAction = DevExpress.Web.ASPxClasses.PopupAction.None;
        ASPxPopupControl1.CloseAction = DevExpress.Web.ASPxClasses.CloseAction.None;

        //Make the ASPxPopupControl displayed centered within the ASPxGridView
        ASPxPopupControl1.PopupElementID = "ASPxGridView1";
        ASPxPopupControl1.PopupHorizontalAlign = DevExpress.Web.ASPxClasses.PopupHorizontalAlign.Center;
        ASPxPopupControl1.PopupVerticalAlign = DevExpress.Web.ASPxClasses.PopupVerticalAlign.Middle;
    }

    protected void btnReloadDemo_Click(object sender, EventArgs e){
        //Reset the grid's data source
        Session["GridDataSource"] = null;

        Response.Redirect("Default.aspx");
    }

}
