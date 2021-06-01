*** Settings ***
Documentation		Contains low level keywords that are exposed to MainPageVerifier.resource and DjangoAdminApp.robot
Resource			../Texts/MainPageTexts.resource


*** Variable ***
${NUMBER_OF_ADD_BUTTONS}			${3}
${NUMBER_OF_CHANGE_BUTTONS}			${3}

${EXPECTED_MAIN_PAGE_URL} 			${BASE_URL}admin/

&{MAIN_PAGE_LINK}
...			main_title=/admin/							# on the upper left corner
...			view_site=/									# on the upper right corner
...			change_password=/admin/password_change/		# on the upper right corner
...			logout=/admin/logout/						# on the upper right corner
...			authentication_and_authorization=/admin/auth/	# under site_administration_link
...			groups=/admin/auth/group/						# under authentication_and_authorization_link
...			users=/admin/auth/user/							# under groups
...			add_group=/admin/auth/group/add/
...			change_group=/admin/auth/group/
...			add_user=/admin/auth/user/add/
...			change_user=/admin/auth/user/
...			postings=/admin/postings/  					# under users_link
...			blog_posts=/admin/postings/blogpost/		# under postings_link
...			add_blog_post=/admin/postings/blogpost/add/
...			change_blog_post=/admin/postings/blogpost/


*** Keywords ***
Go To Main Page
	Go to		${EXPECTED_MAIN_PAGE_URL}

Verify Url
	[Documentation]		Waits until the "Logout" Element appears enabled on the upper right side of the page
	... 				Checks the page URL is the same as expected_main_page_url
    Get Url		==		${EXPECTED_MAIN_PAGE_URL}

Verify Authentication And Authorization Link
	Get Attribute		${MAIN_PAGE_LOCATOR}[authentication_and_authorization]				href
    ...					==	${MAIN_PAGE_LINK}[authentication_and_authorization]

Verify Groups Link
	Get Attribute		${MAIN_PAGE_LOCATOR}[groups]				href
    ...					==	${MAIN_PAGE_LINK}[groups]

Verify Users Link
	Get Attribute		${MAIN_PAGE_LOCATOR}[users]				href
    ...					==	${MAIN_PAGE_LINK}[users]

Verify Add Group Link
	Get Attribute		${MAIN_PAGE_LOCATOR}[add_group]				href
    ...					==	${MAIN_PAGE_LINK}[add_group]

Verify Change Group Link
	Get Attribute		${MAIN_PAGE_LOCATOR}[change_group]				href
    ...					==	${MAIN_PAGE_LINK}[change_group]

Verify Add User Link
	Get Attribute		${MAIN_PAGE_LOCATOR}[add_user]				href
    ...					==	${MAIN_PAGE_LINK}[add_user]

Verify Change User Link
	Get Attribute		${MAIN_PAGE_LOCATOR}[change_user]				href
    ...					==	${MAIN_PAGE_LINK}[change_user]

Verify Postings Section Link
	Get Attribute		${MAIN_PAGE_LOCATOR}[postings]				href
    ...					==	${MAIN_PAGE_LINK}[postings]

Verify Blog Posts Link
	Get Attribute		${MAIN_PAGE_LOCATOR}[blog_posts]				href
    ...					==	${MAIN_PAGE_LINK}[blog_posts]

Verify Add Blog Post Link
	Get Attribute		${MAIN_PAGE_LOCATOR}[add_blog_post]				href
    ...					==	${MAIN_PAGE_LINK}[add_blog_post]

Verify Change Blog Post Link
	Get Attribute		${MAIN_PAGE_LOCATOR}[change_blog_post]				href
    ...					==	${MAIN_PAGE_LINK}[change_blog_post]

Verify Site Administration Text
	Get Text	${MAIN_PAGE_LOCATOR}[site_administration]	==	${MAIN_PAGE_TEXT}[site_administration]

Verify Authentication And Authentication Text
	Get Text	${MAIN_PAGE_LOCATOR}[authentication_and_authorization]	==	${MAIN_PAGE_TEXT}[authentication_and_authorization]

Verify Groups Text
	Get Text	${MAIN_PAGE_LOCATOR}[groups]	==	${MAIN_PAGE_TEXT}[groups]

Verify Users Text
	Get Text	${MAIN_PAGE_LOCATOR}[users]		==	${MAIN_PAGE_TEXT}[users]

Verify Postings Text
	Get Text	${MAIN_PAGE_LOCATOR}[postings]	==	${MAIN_PAGE_TEXT}[postings]

Verify Blog Posts Text
	Get Text	${MAIN_PAGE_LOCATOR}[blog_posts]	==		${MAIN_PAGE_TEXT}[blog_posts]

Verify Number Of Add Buttons
	Get Element Count	${MAIN_PAGE_LOCATOR}[add_button]	==	${NUMBER_OF_ADD_BUTTONS}

Verify Number Of Change Buttons
	Get Element Count	${MAIN_PAGE_LOCATOR}[change_button]	==	${NUMBER_OF_CHANGE_BUTTONS}

Verify Recent Actions Text
	Get Text	${MAIN_PAGE_LOCATOR}[recent_actions]	==	${MAIN_PAGE_TEXT}[recent_actions]

Verify My Actions Text
	Get Text	${MAIN_PAGE_LOCATOR}[my_actions]	==	${MAIN_PAGE_TEXT}[my_actions]

Click On Add Group Button
	Click	${MAIN_PAGE_LOCATOR}[add_group]

Click On Groups
	Click	${MAIN_PAGE_LOCATOR}[groups]
