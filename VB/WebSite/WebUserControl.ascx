<%-- BeginRegion Tags and page properties --%>
<%@ Control Language="vb" AutoEventWireup="true" CodeFile="WebUserControl.ascx.vb" Inherits="WebUserControl" %>

<%@ Register assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxRoundPanel" tagprefix="dxrp" %>
<%@ Register assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPanel" tagprefix="dxp" %>
<%-- EndRegion --%>

<dxrp:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="300px" HeaderText="Delete Confirmation" DefaultButton="btnYes">
	<PanelCollection>
		<dxp:PanelContent runat="server">
<%-- BeginRegion Dialog information elements: an image and labels --%>
			<table>
				<tr>
					<td rowspan="2">
						<dxe:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="~/Images/img1.png">
						</dxe:ASPxImage>
					</td>

					<td>
						<dxe:ASPxLabel ID="ASPxLabel1" runat="server" Text="Are you sure you want to delete this row?">
						</dxe:ASPxLabel>
					</td>
				</tr>

				<tr>
					<td>
						<dxe:ASPxLabel ID="ASPxLabel2" runat="server" Text="Row ID: " >
						</dxe:ASPxLabel>  

						<dxe:ASPxLabel ID="ASPxLabel3" runat="server" Text="" ClientInstanceName="lbRowId" Font-Bold="True">
						</dxe:ASPxLabel>     
					</td>
				</tr>
			</table>
			<br />
<%-- EndRegion --%>
<%-- BeginRegion Dialog control elements: a check box and buttons --%>
			<table>
				<tr>
					<td>
						<dxe:ASPxCheckBox ID="cbDontAsk" runat="server" Text="Don't&nbsp;ask&nbsp;confirmation" ClientInstanceName="cbDontAsk">
							<ClientSideEvents CheckedChanged="cbDontAsk_CheckedChanged" />
						</dxe:ASPxCheckBox>
					</td>

					<td style="width:100%">
					</td>

					<td>
						<dxe:ASPxButton ID="btnYes" runat="server" Text="Yes" Width="50px" AutoPostBack="False" ClientInstanceName="btnYes">
							<ClientSideEvents Click="btnYes_Click" />
						</dxe:ASPxButton>
					</td>

					<td>
						<dxe:ASPxButton ID="btnNo" runat="server" Text="No" Width="50px" AutoPostBack="False">
							<ClientSideEvents Click="btnNo_Click" />
						</dxe:ASPxButton>
					</td>
				</tr>
			</table>
<%-- EndRegion --%>
		</dxp:PanelContent>
	</PanelCollection>
</dxrp:ASPxRoundPanel>
