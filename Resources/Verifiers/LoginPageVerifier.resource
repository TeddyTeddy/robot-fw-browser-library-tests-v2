*** Settings ***
Documentation		Exposes "Verify Login Page Texts" keyword to DjangoAdminApp.robot

*** Keywords ***
Verify Login Page Texts
	LoginPage.Verify Page Title
	LoginPage.Verify Username Title
	LoginPage.Verify Password Title
	LoginPage.Verify Login Button Text
