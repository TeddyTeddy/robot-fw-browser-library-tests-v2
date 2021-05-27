*** Settings ***
Documentation		Exposes "Verify Main Page" keyword to test suite(s)
...					Uses Page Objects' low level keywords such as:
...					- Verify <Element> Text
...					- Verify <Element> Link
...					where <Element> (e.g. My Actions) is in the corresponding PO (e.g. Main Page)

Resource 			TopNavVerifier.resource
Resource			../PO/MainPage.resource


*** Keywords ***
Verify Main Page Texts
	[Arguments]		${username}
	Verify Top Nav Texts		${username}
	Verify Site Administration Text
	Verify Authentication And Authentication Text
	Verify Groups Text
	Verify Users Text
	Verify Postings Text
	Verify Blog Posts Text
	Verify Recent Actions Text
	Verify My Actions Text

Verify Main Page Links
	Verify Top Nav Links
	Verify Authentication And Authorization Link
	Verify Groups Link
	Verify Users Link
	Verify Add Group Link
	Verify Change Group Link
	Verify Add User Link
	Verify Change User Link
	Verify Postings Section Link
	Verify Blog Posts Link
	Verify Add Blog Post Link

Verify Main Page
	[Arguments]		${username}
	Verify Main Page Texts	 ${username}
	Verify Main Page Links
	Verify Number Of Add Buttons
	Verify Number Of Change Buttons
