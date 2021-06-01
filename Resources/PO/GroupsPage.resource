*** Settings ***
Documentation			Contains links for Group page
...						Contains also the low level keywords that can act on the page
Resource				../Texts/GroupsPageTexts.resource


*** Variable ***
# EAV stands for Expected Attribute Value
&{GROUPS_PAGE_EAV}					search_button_value=Search

${EXPECTED_GROUPS_PAGE_URL}			${BASE_URL}admin/auth/group/

&{GROUPS_PAGE_LINK}
...		home=/admin/
...		authentication_and_authorization=/admin/auth/
...		add_group=/admin/auth/group/add/
# https://glacial-earth-31542.herokuapp.com/admin/auth/group/168/change/
...		added_group=admin\/auth\/group\/\(\?\:\\d\+\)\/change


*** Keywords ***
Verify Url
	Get Url		==		${EXPECTED_GROUPS_PAGE_URL}

Verify Breadcrumbs Text
	Get Text	${GROUPS_PAGE_LOCATOR}[breadcrumbs]	==	${GROUP_PAGE_TEXT}[breadcrumbs]

Verify Home Text
	Get Text	${GROUPS_PAGE_LOCATOR}[home_link]	==	${GROUP_PAGE_TEXT}[home_link]

Verify Authentication And Authorization Text
	Get Text	${GROUPS_PAGE_LOCATOR}[authentication_and_authorization_link]
	...			==
	...			${GROUP_PAGE_TEXT}[authentication_and_authorization_link]

Verify Select Group To Change Text
	Get Text	${GROUPS_PAGE_LOCATOR}[select_group_to_change]
	...			==
	...			${GROUP_PAGE_TEXT}[select_group_to_change]

Verify Search Button Text
	Get Attribute		${GROUPS_PAGE_LOCATOR}[search_button]	value
	...					==
	...					${GROUPS_PAGE_EAV}[search_button_value]

Verify Action Text
	Get Text	${GROUPS_PAGE_LOCATOR}[action]	==	${GROUP_PAGE_TEXT}[action]

Verify Delete Selected Groups Text
	Get Text	${GROUPS_PAGE_LOCATOR}[delete_selected_groups_option]
	...			==
	...			${GROUP_PAGE_TEXT}[delete_selected_groups_option]

Verify Select All Groups Text
	Get Text	${GROUPS_PAGE_LOCATOR}[select_all_groups]
	...			==
	... 		${GROUP_PAGE_TEXT}[select_all_groups]

Verify Dynamic Text Group X Added Successfully
	[Arguments]		${group_name}
	${expected_text} =		Evaluate	$GROUP_PAGE_TEXT['group_x_added_successfully'] % $group_name
	Get Text		${GROUPS_PAGE_LOCATOR}[group_x_added_successfully]
	... 			==
	... 			${expected_text}

Verify Dynamic Text X of Y Selected
	[Documentation]		x and y are dynamic numbers that are present in the following elements in groups_page:
	...						x_of_y_selected
	...						y_groups
	...					This keyword grabs y from y_groups element and then checks if y is in present in x_of_y_selected
	... 				If y is present, then assertion passes, otherwise assertion fails

	${observed_x_of_y_selected} = 		Get Text	${GROUPS_PAGE_LOCATOR}[x_of_y_selected]
	${observed_y_groups} =				Get Text	${GROUPS_PAGE_LOCATOR}[y_groups]
	${y} = 		Evaluate		re.match(r'\\d+', $observed_y_groups).group(0)		modules=re
	Should Contain		${observed_x_of_y_selected}		${y}

Verify Home Link
	Get Attribute	${GROUPS_PAGE_LOCATOR}[home_link]		href
	...		==		${GROUPS_PAGE_LINK}[home]

Verify Authentication and Authorization Link
	Get Attribute		${GROUPS_PAGE_LOCATOR}[authentication_and_authorization_link]	href
	...	== 	${GROUPS_PAGE_LINK}[authentication_and_authorization]

Verify Add Group Link
	Get Attribute		${GROUPS_PAGE_LOCATOR}[add_group]		href
	...	==	${GROUPS_PAGE_LINK}[add_group]

Verify Dynamic Link For Group Name
	[Documentation]		A group element with text group_name is added in groups_page. This method checks that
	... 				the element (which is an anchor with a dynamic href), contains the correct link
	...					:param group_name: the name of the group added to the group page (i.e. 'blog_editors')
	[Arguments]			${group_name}
	${added_group_locator} = 		Evaluate		$GROUPS_PAGE_LOCATOR['generic_group_element'] % $group_name
	${observed_group_link} = 	Get Attribute		${added_group_locator}		href
	${is_link_correct} =	Evaluate		bool(re.search($GROUPS_PAGE_LINK['added_group'], $observed_group_link))		modules=re
	Should Be True		${is_link_correct}

Verify Group Added
	[Arguments]		${group_name}
	${added_group_locator} = 	Evaluate		$GROUPS_PAGE_LOCATOR['generic_group_element'] % $group_name
	Get Text	${added_group_locator}	==		${group_name}

Select Checkbox For Group
	[Arguments]		${group_name}
	${group_element_checkbox_locator} = 	Evaluate		$GROUPS_PAGE_LOCATOR['generic_group_element_checkbox'] % $group_name
	Click	${group_element_checkbox_locator}

Select Delete Selected Groups Dropdown
	Click	${GROUPS_PAGE_LOCATOR}[default_option]
	Select Options By	${GROUPS_PAGE_LOCATOR}[delete_selected_groups_option_2]
	...			text
	...			${GROUP_PAGE_TEXT}[delete_selected_groups_option]

Press Go
	Click	${GROUPS_PAGE_LOCATOR}[go_button]
