*** Settings ***
Documentation           This is a test suite for Django Admin Site
Resource                ../Resources/Common.robot
Resource                ../Resources/DjangoAdminApp.robot

Suite Setup             Begin Web Test
Suite Teardown          End Web Test


*** Test Cases ***
Creating Different Groups
    [Documentation]    You can create as many groups with given permissions here
    [Template]     Creating Group
    ${BLOG_EDITORS_GROUP_NAME}      ${BLOG_EDITORS_PERMISSIONS}
    ${GROUP_EDITORS_GROUP_NAME}     ${GROUP_EDITORS_PERMISSIONS}

Deleting "Blog Editors" Group
    [Documentation]    You can delete as many groups with given group names here
    ...                as long as they exist in the system, they will be deleted
    [Template]      Deleting Group
    ${BLOG_EDITORS_GROUP_NAME}
    ${GROUP_EDITORS_GROUP_NAME}


*** Keywords ***
Creating Group
    [Documentation]     Creates a group with a group_name with the given group permissions.
    ...                 Assumes that we are at the main page before executing this keyword
    ...                 After finishing execution, the main page is the current page
    [Arguments]         ${group_name}       ${permissions}
    No Operation
#     Click On Add Group Button                   # opens add_group_page
#     Verify Add Group Page
#     Add Group With Permissions  group_name=${group_name}     search_terms=${permissions}     # opens groups_page
#     Verify Groups Page      ${group_name}
#     Go To Main Page

Deleting Group
    [Documentation]     Deletes the group with a given group_name
    ...                 Assumes that we are at the main page before executing this keyword
    ...                 After finishing execution, the main page is the current page
    [Arguments]         ${group_name}
    No Operation
#     Click On Groups
#     Select Checkbox For Group  group_name=${group_name}
#     Select Delete Selected Groups Dropdown
#     Press Go    # opens confirm_groups_deletions_page
#     Verify Confirm Page     group_name=${group_name}
#     Press Confirm Button
#     Verify Groups Page
#     Go To Main Page
