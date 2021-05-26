<!-- default file list -->
*Files to look at*:

* [TestData.cs](./CS/WebSite/App_Code/TestData.cs) (VB: [TestData.vb](./VB/WebSite/App_Code/TestData.vb))
* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
* [WebUserControl.ascx](./CS/WebSite/WebUserControl.ascx) (VB: [WebUserControl.ascx](./VB/WebSite/WebUserControl.ascx))
* [WebUserControl.ascx.cs](./CS/WebSite/WebUserControl.ascx.cs) (VB: [WebUserControl.ascx.vb](./VB/WebSite/WebUserControl.ascx.vb))
<!-- default file list end -->
# How to implement a delete confirm dialog with a "don't ask me again" option
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e1120/)**
<!-- run online end -->


<p>This example demonstrates how you can implement a round-cornered delete confirm dialog providing end-users with an option to prevent subsequent dialog displaying.</p>
<p>The confirm dialog is implemented using the ASPxPopupControl. It contains a WebUserControl representing the dialog content. The content's top control is the ASPxRoundPanel, which provides the round corner appearance of the dialog. Within its children, the ASPxRoundPanel contains an ASPxLabel control showing the ID value of the row to be deleted, two command ASPxButtons ("Yes", "No") and an ASPxCheckBox that, if checked, enables further delete operations to be performed without confirmation.</p>
<p>Pay your attention that in this example the "Don't ask confirmation" check box' value is stored within a client-side script variable ("dontAskConfirmation"). In a real-life application, it's recommended to preserve this value within a user-specific store such as user profile settings or cookies. </p>
<p>Note that in this sample the following features and tricks are realized to make it work as expected:<br /> - The ID value of the processed row is stored within a client script variable ("rowVisibleIndex");<br /> - The ASPxPopupControl is made transparent to display its child ASPxRoundPanel as the dialog's immediate container;<br /> - The ASPxPopupControl is used in modal mode and customized, so that it is always displayed centered within the ASPxGridView control (try to resize grid columns and invoke the dialog);<br /> - The "Yes" button is made the dialog's default button (using the ASPxRoundPanel's DefaultButton property) to allow dialog submitting by pressing the Enter key. The "Yes" button programmatically receives input focus after the dialog is shown.</p>
<p>In this demo, the grid's data source is implemented within the TestData.cs file and a collection of data rows is stored within session. To reset the demo to its initial state, click the "Reload demo" button.<br /><br /></p>
<p><strong>See Also:</strong><br /> <a href="https://supportcenter.devexpress.com/ticket/details/e131/how-to-include-a-deleted-row-keyfield-value-into-the-delete-confirmation-dialog">How to include a deleted row KeyField value into the delete confirmation dialog</a><br /> <a href="https://supportcenter.devexpress.com/internal/ticket/details/E2938"> How to insert (or update) ASPxTreeList's row by clicking on an external button and delete rows with custom confirmation popup window<br /></a><a href="https://supportcenter.devexpress.com/internal/ticket/details/T103862">How to show a confirmation dialog using ASPxPopupControl</a><a href="https://supportcenter.devexpress.com/internal/ticket/details/E2938"><br /><br /></a></p>

<br/>


