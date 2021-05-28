*** Settings ***
Documentation		Exposes "Verify Main Page" keyword to test suite(s)
...					Uses Page Objects' low level keywords such as:
...						Verify <Element> Text
...						Verify <Element> Link
...					where <Element> (e.g. My Actions) is in the corresponding PO (e.g. Main Page)


*** Keywords ***
Verify Main Page Texts
	[Arguments]		${username}
	Verify Top Nav Texts		${username}
	MainPage.Verify Site Administration Text
	MainPage.Verify Authentication And Authentication Text
	MainPage.Verify Groups Text
	MainPage.Verify Users Text
	MainPage.Verify Postings Text
	MainPage.Verify Blog Posts Text
	MainPage.Verify Recent Actions Text
	MainPage.Verify My Actions Text

Verify Main Page Links
	Verify Top Nav Links
	MainPage.Verify Authentication And Authorization Link
	MainPage.Verify Groups Link
	MainPage.Verify Users Link
	MainPage.Verify Add Group Link
	MainPage.Verify Change Group Link
	MainPage.Verify Add User Link
	MainPage.Verify Change User Link
	MainPage.Verify Postings Section Link
	MainPage.Verify Blog Posts Link
	MainPage.Verify Add Blog Post Link

Verify Main Page
	[Arguments]		${username}
	Verify Main Page Texts	 ${username}
	Verify Main Page Links
	Verify Number Of Add Buttons
	Verify Number Of Change Buttons
	MainPage.Verify Url
