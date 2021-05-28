*** Settings ***
Documentation		Confirm page's elements' locators are defined here

*** Variable ***
&{CONFIRM_PAGE_LOCATOR}
...		breadcrumbs=//*[@id="container"]/div[2]
...		home=//*[@id="container"]/div[2]/a[1]
...		authentication_and_authorization=//*[@id="container"]/div[2]/a[2]
...		groups=//*[@id="container"]/div[2]/a[3]
...		are_you_sure_headline=//*[@id="content"]/h1
...		are_you_sure_question=//*[@id="content"]/p
...		summary=//*[@id="content"]/h2[1]
...		objects=//*[@id="content"]/h2[2]
...		generic_group_element=//*[@id="content"]/ul[2]/li/a[contains(.,"%s")]
...		confirm_deletion_button=//*[@id="content"]/form/div/input[4]
...		cancel_deletion_button=//*[@id="content"]/form/div/a