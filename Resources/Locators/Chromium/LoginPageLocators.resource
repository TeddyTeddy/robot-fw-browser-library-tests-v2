*** Settings ***
Documentation		Login page's elements' locators are defined here


*** Variables ***
&{LOGIN_PAGE_LOCATOR}
...					title=//*[@id="site-name"]/a
...					username_title=//*[@id="login-form"]/div[1]/label
...					username_field=//*[@id="id_username"]
...					password_title=//*[@id="login-form"]/div[2]/label
...					password_field=//*[@id="id_password"]
...					login_button=//*[@id="login-form"]/div[3]/input
