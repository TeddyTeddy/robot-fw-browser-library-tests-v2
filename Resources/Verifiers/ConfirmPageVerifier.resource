*** Settings ***
Documentation		Exposes "Verify Confirm Page" keyword to DjangoAdminApp.robot
...					Uses Page Objects' (i.e. TopNav and ConfirmPage) low level keywords such as:
...						Verify <Element> Text   or
...						Verify <Element> Link
...					where <Element> (e.g. Breadcrumbs) is in the corresponding PO (i.e. ConfirmPage)


*** Keywords ***
Verify Confirm Page Texts
	[Arguments]		${username}			${group_name}
	Verify Top Nav Texts		${username}
	ConfirmPage.Verify Breadcrumbs Text
	ConfirmPage.Verify Are You Sure Headline Text
	ConfirmPage.Verify Are You Sure Question Text
	ConfirmPage.Verify Summary Text
	ConfirmPage.Verify Objects Text
	ConfirmPage.Verify Dynamic Group Text		${group_name}
	ConfirmPage.Verify Confirm Deletion Button Text
	ConfirmPage.Verify Cancel Deletion Button Text

Verify Confirm Page Links
	[Arguments]		${group_name}
	Verify Top Nav Links
	ConfirmPage.Verify Home Link
	ConfirmPage.Verify Authentication And Authorization Link
	ConfirmPage.Verify Groups Link
	ConfirmPage.Verify Group X Link		${group_name}
	ConfirmPage.Verify Cancel Deletion Button Link

Verify Confirm Page
	[Arguments]		${username}		${group_name}
	Verify Confirm Page Texts	 ${username}		${group_name}
	Verify Confirm Page Links	${group_name}
	ConfirmPage.Verify Url




