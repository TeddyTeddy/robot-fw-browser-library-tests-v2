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
