*** Settings ***
Resource			../Texts/TopNavTexts.resource


*** Variable ***
&{TOP_NAV_LINK}
...			main_title=/admin/							# on the upper left corner
...			view_site=/									# on the upper right corner
...			change_password=/admin/password_change/		# on the upper right corner
...			logout=/admin/logout/						# on the upper right corner


*** Keywords ***
Verify Main Title Text
	Get Text	${TOP_NAV_LOCATOR}[main_title]	==	${TOP_NAV_TEXT}[main_title]

Verify Wellcome User X Text
	[Documentation]		Given the username, this keyword verifies that a wellcome string appears mentioning the username
	[Arguments]		${username}
	${expected_dynamic_user_tab_text}=		Evaluate		$TOP_NAV_TEXT['dynamic_user_tab'] % $username.upper()
	# user navigation bar on the upper right of the page
	Get Text	${TOP_NAV_LOCATOR}[welcome_user_x]		==	${expected_dynamic_user_tab_text}

Verify View Site Text
	Get Text	${TOP_NAV_LOCATOR}[view_site]	==	${TOP_NAV_TEXT}[view_site]

Verify Change Password Text
	Get Text	${TOP_NAV_LOCATOR}[change_password]		==	${TOP_NAV_TEXT}[change_password]

Verify Logout Text
	Get Text	${TOP_NAV_LOCATOR}[logout]	==	${TOP_NAV_TEXT}[logout]

Verify Main Title Link
	Get Attribute		${TOP_NAV_LOCATOR}[main_title]		href	==	${TOP_NAV_LINK}[main_title]

Verify View Site Link
	Get Attribute		${TOP_NAV_LOCATOR}[view_site]		href	==	${TOP_NAV_LINK}[view_site]

Verify Change Password Link
	Get Attribute		${TOP_NAV_LOCATOR}[change_password]		href	==	${TOP_NAV_LINK}[change_password]

Verify Logout Link
	Get Attribute		${TOP_NAV_LOCATOR}[logout]		href	==	${TOP_NAV_LINK}[logout]

Logout
	Click		${TOP_NAV_LOCATOR}[logout]
