*** Settings ***
Documentation		Contains higher level keywords having business logic for the test site
Resource			./PO/TopNav.resource
Resource			./PO/LoginPage.resource
Resource			./PO/MainPage.resource
Resource			./PO/AddGroupPage.resource
Resource            ./PO/GroupsPage.resource
Resource            ./PO/ConfirmPage.resource
Resource			./Verifiers/LoginPageVerifier.resource
Resource			./Verifiers/MainPageVerifier.resource
Resource			./Verifiers/TopNavVerifier.resource
Resource			./Verifiers/AddGroupPageVerifier.resource
Resource            ./Verifiers/GroupsPageVerifier.resource
Resource            ./Verifiers/ConfirmPageVerifier.resource
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

Creating Group
    [Documentation]     Creates a group with a group_name with the given group permissions.
    ...                 Assumes that we are at the main page before executing this keyword
    ...                 After finishing execution, the main page is the current page
    [Arguments]         ${group_name}       ${permissions}
    Click On Add Group Button       # opens add_group_page
    Verify Add Group Page   		${VALID_ADMIN_USERNAME}
	Add Group With Permissions  group_name=${group_name}     search_terms=${permissions}     # opens groups_page
    Verify Groups Page      ${VALID_ADMIN_USERNAME}     ${group_name}
	Go To Main Page

Deleting Group
    [Documentation]     Deletes the group with a given group_name
    ...                 Assumes that we are at the main page before executing this keyword
    ...                 After finishing execution, the main page is the current page
    [Arguments]         ${group_name}
    Click On Groups
    Select Checkbox For Group  group_name=${group_name}
    Select Delete Selected Groups Dropdown
    Press Go    # opens confirm_groups_deletions_page
    Verify Confirm Page     ${VALID_ADMIN_USERNAME}        ${group_name}
    Press Confirm Button
    Verify Groups Page      ${VALID_ADMIN_USERNAME}
    Go To Main Page

Add Group With Permissions
    [Documentation]     Assumes we are in AddGroup Page
    [Arguments]     ${group_name}       ${search_terms}
    Enter Name For New Group            ${group_name}
    FOR  ${search_term}  IN   @{search_terms}
        ${is_filtered_permissions} =    Enter Search Term In Available Permissions Filter  ${search_term}
        IF    ${is_filtered_permissions}
            ${filtered_permissions} =    Choose All Filtered Permissions
            Verify Permissions Added    ${filtered_permissions}
        END
        Clear Available Permissions Filter
    END
    Click On Save Button      # opens groups_page
    Verify Groups Page      ${VALID_ADMIN_USERNAME}     ${group_name}
