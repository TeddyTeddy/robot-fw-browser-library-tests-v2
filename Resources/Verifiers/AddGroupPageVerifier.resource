*** Settings ***
Documentation		Exposes "Verify Add Group Page" keyword to DjangoAdminApp.robot
...					Uses Page Objects' (i.e. TopNav and AddGroupPage) low level keywords such as:
...						Verify <Element> Text	or
...						Verify <Element> Link
...					where <Element> (e.g. Breadcrumbs) is in the corresponding PO (e.g. AddGroupPage)


*** Keywords ***
Verify Add Group Page Texts
	[Arguments]		${username}
	Verify Top Nav Texts		${username}
	AddGroupPage.Verify Save And Add Another Button
	AddGroupPage.Verify Save And Continue Editing Button
	AddGroupPage.Verify Save Button
	AddGroupPage.Verify Breadcrumbs Text
	AddGroupPage.Verify Add Group Text
	AddGroupPage.Verify Name Text
	AddGroupPage.Verify Permissions Text
	AddGroupPage.Verify Available Permissions Text
	AddGroupPage.Verify Available Permissions Dropdown Text
	AddGroupPage.Verify Available Permissions Tooltip Text
	AddGroupPage.Verify Choose All Permissions Text
	AddGroupPage.Verify Help To Select Multiple Permissions Text
	AddGroupPage.Verify Chosen Permissions Title Text
	AddGroupPage.Verify Chosen Permissions Tooltip Text
	AddGroupPage.Verify Chosen Permissions Dropdown Text
	AddGroupPage.Verify Remove All Permissions Text

Verify Add Group Page Links
	Verify Top Nav Links
	AddGroupPage.Verify Home Link
	AddGroupPage.Verify Authentication And Authorization Link
	AddGroupPage.Verify Groups Link
	AddGroupPage.Verify Choose All Permissions Link
	AddGroupPage.Verify Remove All Permissions Link

Verify Add Group Page
	[Arguments]		${username}
	Verify Add Group Page Texts	 ${username}
	Verify Add Group Page Links
	AddGroupPage.Verify Url
