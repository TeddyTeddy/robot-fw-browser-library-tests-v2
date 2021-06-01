*** Settings ***
Documentation			Contains texts for Login page
...						Contains also the low level keywords that can act on Login page


*** Variables ***
&{LOGIN_PAGE_TEXT}
...						title=Django administration
...						username=Username:
...						password=Password:
...						login_button=Log in

${LOGIN_PAGE_URL}		${BASE_URL}admin/login/?next=/admin/


*** Keywords ***
Go To Login Page
	Go To	url=${LOGIN_PAGE_URL}
	Wait For Elements State		selector=${LOGIN_PAGE_LOCATOR}[login_button]		state=visible

Verify Page Title
	Get Text	${LOGIN_PAGE_LOCATOR}[title]	==	${LOGIN_PAGE_TEXT}[title]

Verify Username Title
	Get Text	${LOGIN_PAGE_LOCATOR}[username_title]	==	${LOGIN_PAGE_TEXT}[username]

Verify Password Title
	Get Text	${LOGIN_PAGE_LOCATOR}[password_title] 	== 	${LOGIN_PAGE_TEXT}[password]

Verify Login Button Text
	Get Text	${LOGIN_PAGE_LOCATOR}[login_button]	==	${LOGIN_PAGE_TEXT}[login_button]

Login
	[Documentation]		Logins with the given credentials to admin login page.
	...					If the login attempt is successful, user is redirected to admin main page.
	[Arguments]			${username}			${password}
	Type Text			${LOGIN_PAGE_LOCATOR}[username_field]		${username}
	Type Text			${LOGIN_PAGE_LOCATOR}[password_field]		${password}
	Click				${LOGIN_PAGE_LOCATOR}[login_button]
