<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="WebUserControl.ascx.vb" Inherits="Solution.WebUserControl" %>

<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" BackColor="LightGray" Width="300px" HeaderText="Delete Confirmation" DefaultButton="btnYes">
    <PanelCollection>
        <dx:PanelContent runat="server">
            <table>
                <tr>
                    <td rowspan="2">
                        <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="~/Images/img1.png">
                        </dx:ASPxImage>
                    </td>

                    <td>
                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Are you sure you want to delete this row?">
                        </dx:ASPxLabel>
                    </td>
                </tr>

                <tr>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Row ID: " >
                        </dx:ASPxLabel>  
                        
                        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="" ClientInstanceName="lbRowId" Font-Bold="True">
                        </dx:ASPxLabel>     
                    </td>
                </tr>
            </table>
            <br />
            <table>
                <tr>
                    <td>
                        <dx:ASPxCheckBox ID="cbDontAsk" runat="server" Text="Don't&nbsp;ask&nbsp;for&nbsp;confirmation" ClientInstanceName="cbDontAsk">
                            <ClientSideEvents CheckedChanged="cbDontAsk_CheckedChanged" />
                        </dx:ASPxCheckBox>
                    </td>
                    
                    <td style="width:100%">
                    </td>
                
                    <td>
                        <dx:ASPxButton ID="btnYes" runat="server" Text="Yes" Width="50px" AutoPostBack="False" ClientInstanceName="btnYes">
                            <ClientSideEvents Click="btnYes_Click" />
                        </dx:ASPxButton>
                    </td>
                    
                    <td>
                        <dx:ASPxButton ID="btnNo" runat="server" Text="No" Width="50px" AutoPostBack="False">
                            <ClientSideEvents Click="btnNo_Click" />
                        </dx:ASPxButton>
                    </td>
                </tr>
            </table>
        </dx:PanelContent>
    </PanelCollection>
</dx:ASPxRoundPanel>