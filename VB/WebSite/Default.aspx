<%-- BeginRegion Page starting tags --%>

<%@ Page Language="vb" AutoEventWireup="true"  CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Src="WebUserControl.ascx" TagName="WebUserControl" TagPrefix="uc1" %>

<%@ Register assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dxpc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<title>Delete Confirm Dialog</title>
</head>
<body>
	<form id="form1" runat="server">
<%-- EndRegion --%>

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

function cbDontAsk_CheckedChanged(s, e){
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
	if(result) DeleteGridRow(rowVisibleIndex);
}

function DeleteGridRow(visibleIndex) {
	gridView.DeleteRow(visibleIndex);
}
</script>    


<dxe:ASPxButton ID="btnReloadDemo" runat="server" onclick="btnReloadDemo_Click" Text="Reload demo" >
</dxe:ASPxButton>

<br/>     

<dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" ClientInstanceName="gridView"
	DataSourceID="ObjectDataSource1" KeyFieldName="ID" AutoGenerateColumns="False" >
	<SettingsBehavior ColumnResizeMode="Control" />
	<ClientSideEvents CustomButtonClick="grid_CustomButtonClick" />
	<Columns>
		<dxwgv:GridViewCommandColumn VisibleIndex="0" Width="100px">
			<CustomButtons>
				<dxwgv:GridViewCommandColumnCustomButton Text="Delete" ID="del">
				</dxwgv:GridViewCommandColumnCustomButton>
			</CustomButtons>
		</dxwgv:GridViewCommandColumn>
<%-- BeginRegion Data Columns --%>
		<dxwgv:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1" Width="50px">
		</dxwgv:GridViewDataTextColumn>
		<dxwgv:GridViewDataTextColumn FieldName="Description" VisibleIndex="2" Width="200px">
		</dxwgv:GridViewDataTextColumn>
<%-- EndRegion --%>         
	</Columns>
</dxwgv:ASPxGridView>    

<dxpc:ASPxPopupControl ID="ASPxPopupControl1" runat="server" ClientInstanceName="popupControl" >
	<ClientSideEvents Init="popupControl_Init" />
	<ContentCollection>
		<dxpc:PopupControlContentControl runat="server">
			<uc1:WebUserControl ID="WebUserControl1" runat="server" />
		</dxpc:PopupControlContentControl>
	</ContentCollection>
</dxpc:ASPxPopupControl>       

<%-- BeginRegion DataSource --%>
<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetRows" TypeName="GridDataSource" DeleteMethod="DeleteRow" >
	<DeleteParameters>
		<asp:Parameter Name="id" Type="Int32" />
	</DeleteParameters>
</asp:ObjectDataSource>    
<%-- EndRegion --%>

<%-- BeginRegion Page ending tags --%>
	</form>
</body>
</html>
<%-- EndRegion --%>
