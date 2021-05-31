*** Settings ***
Documentation		Group page's elements' locators are defined here
Resource			../../Texts/GroupsPageTexts.resource


*** Variable ***
&{GROUPS_PAGE_LOCATOR}
...		breadcrumbs=//*[@id="container"]/div[2]
...		home_link=//*[@id="container"]/div[2]/a[1]
...		authentication_and_authorization_link=//*[@id="container"]/div[2]/a[2]
...		group_x_added_successfully=//*[@id="container"]/ul/li[@class="success"]
...		select_group_to_change=//*[@id="content"]/h1
...		add_group=//*[@id="content-main"]/ul/li/a
...		search_button=//*[@id="changelist-search"]/div/input[2]
...		action=//*[@id="changelist-form"]/div[1]/label
...		default_option=//*[@id="changelist-form"]/div[1]/label/select
...		delete_selected_groups_option=//*[@id="changelist-form"]/div[1]/label/select/option[contains(.,"${GROUP_PAGE_TEXT}[delete_selected_groups_option]")]
...		delete_selected_groups_option_2=//select[@name="action"]
...		go_button=//*[@id="changelist-form"]/div[1]/button
...		x_of_y_selected=//*[@id="changelist-form"]/div[1]/span
...		select_all_groups=//*[@id="result_list"]/thead/tr/th[2]/div[1]/span
...		generic_group_element_checkbox=//*[@id="result_list"]/tbody/tr[contains(.,"%s")]/td/input[@type="checkbox"]
...		generic_group_element=//table[@id="result_list"]/tbody/tr/th/a[contains(.,"%s")]
...		y_groups=//*[@id="changelist-form"]/p
