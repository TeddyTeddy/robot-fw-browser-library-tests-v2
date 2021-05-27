*** Settings ***
Documentation		Contains higher level keywords having business logic for the test site
Resource			./PO/TopNav.resource
Resource			./PO/LoginPage.resource
Resource			./PO/MainPage.resource
Resource			./Verifiers/LoginPageVerifier.resource
Resource			./Verifiers/MainPageVerifier.resource
Resource			./Verifiers/TopNavVerifier.resource
Resource			./Texts/AddGroupPageTexts.resource


*** Variable ***
${BROWSER}						chromium
${BASE_URL}						https://glacial-earth-31542.herokuapp.com/
${VALID_ADMIN_USERNAME}			hakan
${VALID_ADMIN_PASSWORD}			h1a2k3a4

@{BLOG_EDITORS_PERMISSIONS}		${ADD_GROUP_PAGE_TEXT}[postings_blog_post_can_add_blog_post]
...								${ADD_GROUP_PAGE_TEXT}[postings_blog_post_can_change_blog_post]
...								${ADD_GROUP_PAGE_TEXT}[postings_blog_post_can_delete_blog_post]

@{GROUP_EDITORS_PERMISSIONS}	${ADD_GROUP_PAGE_TEXT}[auth_group_can_add_group]
...								${ADD_GROUP_PAGE_TEXT}[auth_group_can_change_group]
...								${ADD_GROUP_PAGE_TEXT}[auth_group_can_delete_group]

${BLOG_EDITORS_GROUP_NAME}		blog_editors
${GROUP_EDITORS_GROUP_NAME}		group_editors


*** Keywords ***
Login As Admin
	[Documentation]			Logs in with admin credentials. After logging in the current page is the main page
	Go To Login Page
	Verify Login Page Texts
	Login		${VALID_ADMIN_USERNAME}			${VALID_ADMIN_PASSWORD}		# opens admin_main_page
	Verify Main Page		${VALID_ADMIN_USERNAME}
