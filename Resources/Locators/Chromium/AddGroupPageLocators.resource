*** Settings ***
Documentation		Add Group page's elements' locators are defined here

*** Variable ***
&{ADD_GROUP_PAGE_LOCATOR}
...		title=//*[@id="content"]/h1
...		breadcrumbs=//*[@id="container"]/div[2]
...		home_link=//*[@id="container"]/div[2]/a[1]
...		authentication_and_authorization_link=//*[@id="container"]/div[2]/a[2]
...		groups_link=//*[@id="container"]/div[2]/a[3]
...		add_group=//*[@id="content"]/h1
...		name=//*[@id="group_form"]/div/fieldset/div[1]/div/label
...		input_name_field=//*[@id="id_name"]
...		permissions=//*[@id="group_form"]/div/fieldset/div[2]/div/label
...		available_permissions_title=//*[@id="group_form"]/div/fieldset/div[2]/div/div[1]/div/div[1]/h2
...		input_permission_field=//*[@id="id_permissions_input"]
...		available_permissions_tooltip=//*[@id="group_form"]/div/fieldset/div[2]/div/div[1]/div/div[1]/h2/span
...		available_permissions_dropdown=//*[@id="id_permissions_from"]
...		generic_filtered_permission=//*[@id="id_permissions_from"]/option
...		choose_all_permissions_option=//*[@id="id_permissions_add_all_link"]
...		choose_all_permissions=//*[@id="id_permissions_add_all_link"]
...		help_to_select_multiple_permissions=//*[@id="group_form"]/div/fieldset/div[2]/div/div[2]
...		chosen_permissions_title=//*[@id="group_form"]/div/fieldset/div[2]/div/div[1]/div/div[2]/h2
...		chosen_permissions_tooltip=//*[@id="group_form"]/div/fieldset/div[2]/div/div[1]/div/div[2]/h2/span
...		chosen_permissions_dropdown=//*[@id="id_permissions_to"]
...		generic_chosen_permission=//*[@id="id_permissions_to"]/option
...		remove_all_permissions_option=//*[@id="id_permissions_remove_all_link"]
...		save_and_add_another_button=//*[@id="group_form"]/div/div/input[2]
...		save_and_continue_editing_button=//*[@id="group_form"]/div/div/input[3]
...		save_button=//*[@id="group_form"]/div/div/input[1]
