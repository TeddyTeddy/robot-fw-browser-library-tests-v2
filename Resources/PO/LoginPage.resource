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
	Get Text	selector=${LOGIN_PAGE_LOCATOR}[title]
	...			assertion_operator=equal
	...			assertion_expected=${LOGIN_PAGE_TEXT}[title]

Verify Username Title
	Get Text	selector=${LOGIN_PAGE_LOCATOR}[username_title]
	...			assertion_operator=equal
	...			assertion_expected=${LOGIN_PAGE_TEXT}[username]

Verify Password Title
	Get Text	selector=${LOGIN_PAGE_LOCATOR}[password_title]
	...			assertion_operator=equal
	...			assertion_expected=${LOGIN_PAGE_TEXT}[password]

Verify Login Button Text
	Get Text	selector=${LOGIN_PAGE_LOCATOR}[login_button]
	...			assertion_operator=equal
	...			assertion_expected=${LOGIN_PAGE_TEXT}[login_button]

Login
	[Documentation]		Logins with the given credentials to admin login page.
	...					If the login attempt is successful, user is redirected to admin main page.
	[Arguments]			${username}			${password}
	Fill Secret			selector=${LOGIN_PAGE_LOCATOR}[username_field]		secret=${username}
	Fill Secret			selector=${LOGIN_PAGE_LOCATOR}[password_field]		secret=${password}
	Click				selector=${LOGIN_PAGE_LOCATOR}[login_button]
