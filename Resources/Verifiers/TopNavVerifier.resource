*** Settings ***
Resource		../PO/LoginPage.resource


*** Keywords ***
Verify Top Nav Texts
	[Arguments]			${username}
	Verify Main Title Text
	Verify Wellcome User X Text		${username}
	Verify View Site Text
	Verify Change Password Text
	Verify Logout Text

Verify Top Nav Links
	Verify Main Title Link
	Verify View Site Link
	Verify Change Password Link
	Verify Logout Link
