*** Settings ***
Documentation		Exposes "Verify Groups Page" keyword to DjangoAdminApp.robot
...					Uses Page Objects' (i.e. TopNav and GroupsPage) low level keywords such as:
...						Verify <Element> Text   or
...						Verify <Element> Link
...					where <Element> (e.g. Breadcrumbs) is in the corresponding PO (i.e. GroupsPage)


*** Keywords ***
Verify Groups Page Texts
	[Arguments]		${username}			${group_name}
	Verify Top Nav Texts		${username}
	GroupsPage.Verify Breadcrumbs Text
	GroupsPage.Verify Home Text
	GroupsPage.Verify Authentication And Authorization Text
	GroupsPage.Verify Select Group To Change Text
	GroupsPage.Verify Search Button Text
	GroupsPage.Verify Action Text
	GroupsPage.Verify Delete Selected Groups Text
	GroupsPage.Verify Select All Groups Text
	IF 	$group_name
		GroupsPage.Verify Dynamic Text Group X Added Successfully	${group_name}
	END
	GroupsPage.Verify Dynamic Text X of Y Selected

Verify Groups Page Links
	[Arguments]		${group_name}
	Verify Top Nav Links
	GroupsPage.Verify Home Link
	GroupsPage.Verify Authentication and Authorization Link
	GroupsPage.Verify Add Group Link
	IF 	$group_name
		GroupsPage.Verify Dynamic Link For Group Name		${group_name}
		GroupsPage.Verify Group Added		${group_name}
	END

Verify Groups Page
	[Arguments]		${username}		${group_name}=${EMPTY}
	Verify Groups Page Texts	 ${username}		${group_name}
	Verify Groups Page Links	${group_name}
	GroupsPage.Verify Url



