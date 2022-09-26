<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128540794/13.1.4%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E1120)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
# Grid View for ASP.NET Web Forms - How to implement a delete confirmation dialog with a "don't ask me again" option
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/128540794/)**
<!-- run online end -->

![Delete Confirmation Dialog](delete-confirm-dialog.png)

This example demonstrates how you can implement a delete confirmation dialog with an option to prevent subsequent dialog displays.

The confirm dialog is implemented using the ASPxPopupControl. It contains a WebUserControl representing the dialog content. The content's top control is the ASPxRoundPanel, which provides the round corner appearance of the dialog. Within its children, the ASPxRoundPanel contains an ASPxLabel control showing the ID value of the row to be deleted, two command ASPxButtons ("Yes", "No") and an ASPxCheckBox that, if checked, enables further delete operations to be performed without confirmation.

Pay your attention that in this example the "Don't ask confirmation" check box' value is stored within a client-side script variable ("dontAskConfirmation"). In a real-life application, it's recommended to preserve this value within a user-specific store such as user profile settings or cookies.

Note that in this sample the following features and tricks are realized to make it work as expected:
- The ID value of the processed row is stored within a client script variable ("rowVisibleIndex");.
- The ASPxPopupControl is made transparent to display its child ASPxRoundPanel as the dialog's immediate container;
- The ASPxPopupControl is used in modal mode and customized, so that it is always displayed centered within the ASPxGridView control (try to resize grid columns and invoke the dialog);
- The "Yes" button is made the dialog's default button (using the ASPxRoundPanel's DefaultButton property) to allow dialog submitting by pressing the Enter key. The "Yes" button programmatically receives input focus after the dialog is shown.

## Files to Review

- [TestData.cs](./CS/Solution/App_Code/TestData.cs) (VB: [TestData.vb](./VB/Solution/App_Code/TestData.vb))
- [Default.aspx](./CS/Solution/Default.aspx) (VB: [Default.aspx](./VB/Solution/Default.aspx))
- [Default.aspx.cs](./CS/Solution/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/Solution/Default.aspx.vb))
- [WebUserControl.ascx](./CS/Solution/WebUserControl.ascx) (VB: [WebUserControl.ascx](./VB/Solution/WebUserControl.ascx))
- [WebUserControl.ascx.cs](./CS/Solution/WebUserControl.ascx.cs) (VB: [WebUserControl.ascx.vb](./VB/Solution/WebUserControl.ascx.vb))

## Documentation

## More Examples

- [How to include a deleted row KeyField value into the delete confirmation dialog](https://supportcenter.devexpress.com/ticket/details/e131/how-to-include-a-deleted-row-keyfield-value-into-the-delete-confirmation-dialog)
- [How to insert (or update) ASPxTreeList's row by clicking on an external button and delete rows with custom confirmation popup window](https://supportcenter.devexpress.com/internal/ticket/details/E2938)
- [How to show a confirmation dialog using ASPxPopupControl](https://supportcenter.devexpress.com/internal/ticket/details/T103862)

