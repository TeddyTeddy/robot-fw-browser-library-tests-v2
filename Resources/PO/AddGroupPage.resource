*** Settings ***
Documentation			Contains texts & links for Add Group page
...						Contains also the low level keywords that can act on the page
Resource				../Texts/AddGroupPageTexts.resource
Library					Collections

*** Variable ***
# EAV stands for Expected Attribute Values for an element
&{EAV}
...		remove_all_permissions_active=selector-clearall active
...		remove_all_permissions_inactive=selector-clearall


${EXPECTED_ADD_GROUP_PAGE_URL}			${BASE_URL}admin/auth/group/add/

&{ADD_GROUP_PAGE_LINK}
...		home_link=/admin/
...		authentication_and_authorization_link=/admin/auth/
...		groups_link=/admin/auth/group/
...		choose_all_permissions_link=#
...		remove_all_permissions_link_inactive=#


*** Keywords ***
Verify Url
	[Documentation]		Waits for the page's title to appear in the page. Then
	...					Verifies that URL of the page matches to expected_add_group_page_url
	Wait For Elements State			selector=${ADD_GROUP_PAGE_LOCATOR}[title]		state=visible
	Get Url		assertion_operator=equal		assertion_expected=${EXPECTED_ADD_GROUP_PAGE_URL}

Verify Save And Add Another Button
	Get Attribute		selector=${ADD_GROUP_PAGE_LOCATOR}[save_and_add_another_button]
	...					attribute=value
	...					assertion_operator=equal
	...					assertion_expected=${ADD_GROUP_PAGE_TEXT}[save_and_add_another_button]

Verify Save And Continue Editing Button
	Get Attribute		selector=${ADD_GROUP_PAGE_LOCATOR}[save_and_continue_editing_button]
	...					attribute=value
	...					assertion_operator=equal
	...					assertion_expected=${ADD_GROUP_PAGE_TEXT}[save_and_continue_editing_button]

Verify Save Button
	Get Attribute		selector=${ADD_GROUP_PAGE_LOCATOR}[save_button]
	...					attribute=value
	...					assertion_operator=equal
	...					assertion_expected=${ADD_GROUP_PAGE_TEXT}[save_button]

Verify Breadcrumbs Text
	Get Text			selector=${ADD_GROUP_PAGE_LOCATOR}[breadcrumbs]
	...					assertion_operator=equal
	...					assertion_expected=${ADD_GROUP_PAGE_TEXT}[breadcrumbs]

Verify Add Group Text
	Get Text			selector=${ADD_GROUP_PAGE_LOCATOR}[add_group]
	...					assertion_operator=equal
	...					assertion_expected=${ADD_GROUP_PAGE_TEXT}[add_group]

Verify Name Text
	Get Text			selector=${ADD_GROUP_PAGE_LOCATOR}[name]
	...					assertion_operator=equal
	...					assertion_expected=${ADD_GROUP_PAGE_TEXT}[name]

Verify Permissions Text
	Get Text			selector=${ADD_GROUP_PAGE_LOCATOR}[permissions]
	...					assertion_operator=equal
	...					assertion_expected=${ADD_GROUP_PAGE_TEXT}[permissions]

Verify Available Permissions Text
	Get Text			selector=${ADD_GROUP_PAGE_LOCATOR}[available_permissions_title]
	...					assertion_operator=equal
	...					assertion_expected=${ADD_GROUP_PAGE_TEXT}[available_permissions_title]

Verify Available Permissions Dropdown Text
	Get Text			selector=${ADD_GROUP_PAGE_LOCATOR}[available_permissions_dropdown]
	...					assertion_operator=equal
	...					assertion_expected=${ADD_GROUP_PAGE_TEXT}[available_permissions_dropdown_content]

Verify Available Permissions Tooltip Text
	Get Attribute		selector=${ADD_GROUP_PAGE_LOCATOR}[available_permissions_tooltip]
	...					attribute=title
	...					assertion_operator=equal
	...					assertion_expected=${ADD_GROUP_PAGE_TEXT}[available_permissions_tooltip]

Verify Choose All Permissions Text
	Get Text			selector=${ADD_GROUP_PAGE_LOCATOR}[choose_all_permissions]
	...					assertion_operator=equal
	...					assertion_expected=${ADD_GROUP_PAGE_TEXT}[choose_all_permissions]

Verify Help To Select Multiple Permissions Text
	Get Text			selector=${ADD_GROUP_PAGE_LOCATOR}[help_to_select_multiple_permissions]
	...					assertion_operator=equal
	...					assertion_expected=${ADD_GROUP_PAGE_TEXT}[help_to_select_multiple_permissions]

Verify Chosen Permissions Title Text
	Get Text			selector=${ADD_GROUP_PAGE_LOCATOR}[chosen_permissions_title]
	...					assertion_operator=equal
	...					assertion_expected=${ADD_GROUP_PAGE_TEXT}[chosen_permissions]

Verify Chosen Permissions Tooltip Text
	Get Attribute		selector=${ADD_GROUP_PAGE_LOCATOR}[chosen_permissions_tooltip]
	...					attribute=title
	...					assertion_operator=equal
	...					assertion_expected=${ADD_GROUP_PAGE_TEXT}[chosen_permissions_tooltip]

Verify Chosen Permissions Dropdown Text
	Get Text			selector=${ADD_GROUP_PAGE_LOCATOR}[chosen_permissions_dropdown]
	...					assertion_operator=equal
	...					assertion_expected=${ADD_GROUP_PAGE_TEXT}[chosen_permissions_dropdown]

Verify Remove All Permissions Text
	Get Text			selector=${ADD_GROUP_PAGE_LOCATOR}[remove_all_permissions_option]
	...					assertion_operator=equal
	...					assertion_expected=${ADD_GROUP_PAGE_TEXT}[remove_all_permissions]

Verify Home Link
	Get Attribute		selector=${ADD_GROUP_PAGE_LOCATOR}[home_link]
	...					attribute=href
	...					assertion_operator=equal
	...					assertion_expected=${ADD_GROUP_PAGE_LINK}[home_link]

Verify Authentication And Authorization Link
	Get Attribute		selector=${ADD_GROUP_PAGE_LOCATOR}[authentication_and_authorization_link]
	...					attribute=href
	...					assertion_operator=equal
	...					assertion_expected=${ADD_GROUP_PAGE_LINK}[authentication_and_authorization_link]

Verify Groups Link
	Get Attribute		selector=${ADD_GROUP_PAGE_LOCATOR}[groups_link]
	...					attribute=href
	...					assertion_operator=equal
	...					assertion_expected=${ADD_GROUP_PAGE_LINK}[groups_link]

Verify Choose All Permissions Link
	Get Attribute		selector=${ADD_GROUP_PAGE_LOCATOR}[choose_all_permissions_option]
	...					attribute=href
	...					assertion_operator=equal
	...					assertion_expected=${ADD_GROUP_PAGE_LINK}[choose_all_permissions_link]

Verify Remove All Permissions Link
	[Documentation]		If there are no permissions added under chosen_permissions_dropdown element
	...					then remove_all_permissions_option should not be active.
	...					Otherwise (there are permissions added under chosen_permissions_dropdown element),
	...					then remove_all_permissions_option should have the right class attribute and should be active.

	Get Element State		selector=${ADD_GROUP_PAGE_LOCATOR}[remove_all_permissions_option]		state=visible
	${chosen_permissions} =		Get Text		selector=${ADD_GROUP_PAGE_LOCATOR}[chosen_permissions_dropdown]

	IF		'${chosen_permissions}'==''		# if no permission is selected
		Get Attribute		selector=${ADD_GROUP_PAGE_LOCATOR}[remove_all_permissions_option]
		...					attribute=class
		...					assertion_operator=equal
		...					assertion_expected=${EAV}[remove_all_permissions_inactive]
	ELSE		# if a permission(s) is selected
		Get Attribute		selector=${ADD_GROUP_PAGE_LOCATOR}[remove_all_permissions_option]
		...					attribute=class
		...					assertion_operator=equal
		...					assertion_expected=${EAV}[remove_all_permissions_active]
	END

Enter Name For New Group
	[Arguments]		${group_name}
	Fill Text		selector=${ADD_GROUP_PAGE_LOCATOR}[input_name_field]		txt=${group_name}

Enter Search Term In Available Permissions Filter
	[Documentation]		We enter permission_search_term into the available permissions filter, which then shows
	...					the available permissions matching the permission_search_term.
	...					This keyword types the content of permission_search_term into the filter.
	...					After filtering operation, if the filtering operation yields any permission(s), then
	...					this keyword returns True, otherwise it returns false
	...					Returns (bool):
	...					bool: True, if there are any permission(s) matching permission_search_term
	...					False, if there are not any permissions matching permission_search_term
	[Arguments]		${permission_search_term}
	Type Text		selector=${ADD_GROUP_PAGE_LOCATOR}[input_permission_field]		txt=${permission_search_term}
	${filtered_permissions} = 	Get Text 	selector=${ADD_GROUP_PAGE_LOCATOR}[available_permissions_dropdown]
	${result} = 	Evaluate	bool($filtered_permissions)
	[Return]		${result}

Choose All Filtered Permissions
	[Documentation]		Given that a search term is entered into input_permission_field, the available_permissions_dropdown
	...					lists filtered permissions. This method creates a list of all the filtered permissions. Then it selects
	...					each and every element in filtered_permissions_elements. Then it clicks
	...					on choose_all_permissions_option.
	# create a list of all the permissions listed inside available_permissions_dropdown
	Wait For Elements State			selector=${ADD_GROUP_PAGE_LOCATOR}[generic_filtered_permission]		state=visible
	@{filtered_permission_elements} =		Get Elements	selector=${ADD_GROUP_PAGE_LOCATOR}[generic_filtered_permission]
	@{filtered_permissions} = 		Create List
	FOR		${element}		IN		@{filtered_permission_elements}
		${permission} = 	Get Text		${element}
		Append To List 		${filtered_permissions}			${permission}
		Click				${element}		left		${1}		${0}	${1.0}	${1.0}	${False}	${False}   Control
	END

	Click	selector=${ADD_GROUP_PAGE_LOCATOR}[choose_all_permissions_option]
	[Return]	${filtered_permissions}

Verify Permissions Added
	[Documentation]		Verifies that filtered_permissions is found under chosen_permissions_dropdown. Fails with assert otherwise.
	...					param filtered_permissions: a list of filtered & chosen permissions to be verified to have been added inside
	...					chosen_permissions_dropdown
	[Arguments]			${filtered_permissions}
	${chosen_permission_elements} = 	Get Elements	selector=${ADD_GROUP_PAGE_LOCATOR}[generic_chosen_permission]
	@{chosen_permissions} = 	Create List
	FOR		${element}	IN		@{chosen_permission_elements}
		${permission} = 	Get Text	${element}
		Append To List		${chosen_permissions}		${permission}
	END
	List Should Contain Sub List	${chosen_permissions}		${filtered_permissions}

Clear Available Permissions Filter
	Clear Text		selector=${ADD_GROUP_PAGE_LOCATOR}[input_permission_field]

Click On Save Button
	Click	selector=${ADD_GROUP_PAGE_LOCATOR}[save_button]