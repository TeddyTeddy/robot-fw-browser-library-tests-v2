*** Settings ***
Documentation			Contains links for Confirm Page
...						Contains also the low level keywords that can act on the page
Resource				../Texts/ConfirmPageTexts.resource


*** Variable ***
${EXPECTED_CONFIRM_PAGE_URL} 		${BASE_URL}admin/auth/group/

&{CONFIRM_PAGE_LINK}
...		home=/admin/
...		authentication_and_authorization=/admin/auth/
...		groups=/admin/auth/group/
...		cancel_deletion_button=#
...		group_to_be_deleted=admin\/auth\/group\/\(\?\:\\d\+\)\/change


*** Keywords ***
Verify Url
	Get Url		assertion_operator=equal		assertion_expected=${EXPECTED_CONFIRM_PAGE_URL}

Verify Breadcrumbs Text
	Get Text	selector=${CONFIRM_PAGE_LOCATOR}[breadcrumbs]
	...			assertion_operator=equal
	...			assertion_expected=${CONFIRM_PAGE_TEXT}[breadcrumbs]

Verify Are You Sure Headline Text
	Get Text	selector=${CONFIRM_PAGE_LOCATOR}[are_you_sure_headline]
	...			assertion_operator=equal
	...			assertion_expected=${CONFIRM_PAGE_TEXT}[are_you_sure_headline_text]

Verify Are You Sure Question Text
	Get Text	selector=${CONFIRM_PAGE_LOCATOR}[are_you_sure_question]
	...			assertion_operator=equal
	...			assertion_expected=${CONFIRM_PAGE_TEXT}[are_you_sure_question_text]

Verify Summary Text
	Get Text	selector=${CONFIRM_PAGE_LOCATOR}[summary]
	...			assertion_operator=equal
	...			assertion_expected=${CONFIRM_PAGE_TEXT}[summary_text]

Verify Objects Text
	Get Text	selector=${CONFIRM_PAGE_LOCATOR}[objects]
	...			assertion_operator=equal
	...			assertion_expected=${CONFIRM_PAGE_TEXT}[objects_text]

Verify Dynamic Group Text
	[Arguments]		${group_name}
	${group_locator} = 	Evaluate		$CONFIRM_PAGE_LOCATOR['generic_group_element'] % $group_name
	Get Text	selector=${group_locator}
	...			assertion_operator=equal
	...			assertion_expected=${group_name}

Verify Confirm Deletion Button Text
	Get Attribute	selector=${CONFIRM_PAGE_LOCATOR}[confirm_deletion_button]	attribute=value
	...		assertion_operator=equal
	...	 	assertion_expected=${CONFIRM_PAGE_TEXT}[confirm_deletion_button_text]

Verify Cancel Deletion Button Text
	Get Text	selector=${CONFIRM_PAGE_LOCATOR}[cancel_deletion_button]
	...			assertion_operator=equal
	...			assertion_expected=${CONFIRM_PAGE_TEXT}[cancel_deletion_button_text]

Verify Home Link
	Get Attribute	selector=${CONFIRM_PAGE_LOCATOR}[home]		attribute=href
	...		assertion_operator=equal
	... 	assertion_expected=${CONFIRM_PAGE_LINK}[home]

Verify Authentication And Authorization Link
	Get Attribute	selector=${CONFIRM_PAGE_LOCATOR}[authentication_and_authorization]		attribute=href
	...		assertion_operator=equal
	... 	assertion_expected=${CONFIRM_PAGE_LINK}[authentication_and_authorization]

Verify Groups Link
	Get Attribute	selector=${CONFIRM_PAGE_LOCATOR}[groups]		attribute=href
	...		assertion_operator=equal
	... 	assertion_expected=${CONFIRM_PAGE_LINK}[groups]

Verify Group X Link
	[Documentation]		Let x be the placeholder for group_name. This keyword verifies that a link with group_name has
	...					an href attribute which follows a pattern; /admin/auth/group/<number>/change/
	[Arguments]		${group_name}
	${group_locator} =	 Evaluate		$CONFIRM_PAGE_LOCATOR['generic_group_element'] % $group_name
	${observed_group_link} =		Get Attribute	selector=${group_locator}		attribute=href
	${is_link_correct} = 	Evaluate	bool(re.search($CONFIRM_PAGE_LINK['group_to_be_deleted'], $observed_group_link))
	Should Be True		${is_link_correct}

Verify Cancel Deletion Button Link
	Get Attribute	selector=${CONFIRM_PAGE_LOCATOR}[cancel_deletion_button]		attribute=href
	...		assertion_operator=equal
	... 	assertion_expected=${CONFIRM_PAGE_LINK}[cancel_deletion_button]

Press Confirm Button
	Click		selector=${CONFIRM_PAGE_LOCATOR}[confirm_deletion_button]
