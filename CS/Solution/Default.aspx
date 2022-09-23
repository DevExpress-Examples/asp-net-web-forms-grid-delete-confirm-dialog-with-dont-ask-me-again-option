<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Solution.Default" %>
<%@ Register Src="WebUserControl.ascx" TagName="WebUserControl" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Delete Confirm Dialog</title>
    <script type="text/javascript">
        var dontAskConfirmation; //Store the value specifying whether delete operations should be confirmed
        var rowVisibleIndex; //Store the visible index of the grid row to be deleted

        function popupControl_Init(s, e) {
            //Synchronize the client variable's value with the confirm dialog checkbox' setting
            dontAskConfirmation = cbDontAsk.GetChecked();
        }

        function grid_CustomButtonClick(s, e) {
            if (e.buttonID != 'del') return;
            //If confirmation is not required, delete the processed grid row 
            if (dontAskConfirmation) DeleteGridRow(e.visibleIndex);
            //If confirmation is required, preserve the row's visible index and show the confirmation dialog, passing it the row's ID value
            else {
                rowVisibleIndex = e.visibleIndex;
                s.GetRowValues(e.visibleIndex, 'ID', ShowPopup);
            }
        }

        function ShowPopup(rowId) {
            //Assign the row's ID value to a specific label within the confirmation dialog, show the dialog, and set focus to the Yes button
            lbRowId.SetText(rowId);
            popupControl.Show();
            btnYes.Focus();
        }

        function cbDontAsk_CheckedChanged(s, e) {
            //Synchronize the client variable's value with the confirm dialog checkbox' setting, and focus the Yes button
            dontAskConfirmation = cbDontAsk.GetChecked();
            btnYes.Focus();
        }

        function btnYes_Click(s, e) {
            ClosePopup(true);
        }

        function btnNo_Click(s, e) {
            ClosePopup(false);
        }

        function ClosePopup(result) {
            popupControl.Hide();
            if (result) DeleteGridRow(rowVisibleIndex);
        }

        function DeleteGridRow(visibleIndex) {
            gridView.DeleteRow(visibleIndex);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <dx:ASPxButton ID="btnReloadDemo" runat="server" OnClick="btnReloadDemo_Click" Text="Reload demo">
        </dx:ASPxButton>
        <dx:aspxgridview id="ASPxGridView1" runat="server" clientinstancename="gridView"
            datasourceid="ObjectDataSource1" keyfieldname="ID" autogeneratecolumns="False">
            <settingsbehavior columnresizemode="Control" />
            <clientsideevents custombuttonclick="grid_CustomButtonClick" />
            <columns>
                <dx:gridviewcommandcolumn visibleindex="0" width="100px">
                    <custombuttons>
                        <dx:gridviewcommandcolumncustombutton text="Delete" id="del">
                        </dx:gridviewcommandcolumncustombutton>
                    </custombuttons>
                </dx:gridviewcommandcolumn>
                <dx:gridviewdatatextcolumn fieldname="ID" readonly="True" visibleindex="1" width="50px">
                </dx:gridviewdatatextcolumn>
                <dx:gridviewdatatextcolumn fieldname="Description" visibleindex="2" width="200px">
                </dx:gridviewdatatextcolumn>
            </columns>
        </dx:aspxgridview>

        <dx:aspxpopupcontrol id="ASPxPopupControl1" runat="server" clientinstancename="popupControl">
            <clientsideevents init="popupControl_Init" />
            <contentcollection>
                <dx:popupcontrolcontentcontrol runat="server">
                    <uc1:webusercontrol id="WebUserControl1" runat="server" />
                </dx:popupcontrolcontentcontrol>
            </contentcollection>
        </dx:aspxpopupcontrol>

        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetRows" TypeName="GridDataSource" DeleteMethod="DeleteRow">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
        </asp:ObjectDataSource>
        <br />
    </form>
</body>
</html>
