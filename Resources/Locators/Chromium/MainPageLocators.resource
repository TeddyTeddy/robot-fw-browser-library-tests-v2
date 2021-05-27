*** Settings ***
Documentation		Login page's elements' locators are defined here
Resource			../../Texts/MainPageTexts.resource


*** Variables ***
&{MAIN_PAGE_LOCATOR}
...			site_administration=//*[@id="content"]/h1		# under main_title
...			authentication_and_authorization=//*[@id="content-main"]/div[1]/table/caption/a			# under site_administration
...			groups=//*[@id="content-main"]/div[1]/table/tbody/tr[1]/th/a							# under authentication and authorization
...			users=//*[@id="content-main"]/div[1]/table/tbody/tr[2]/th/a								# under groups
...			add_group=//*[@id="content-main"]/div[1]/table/tbody/tr[1]/td[1]/a
...			change_group=//*[@id="content-main"]/div[1]/table/tbody/tr[1]/td[2]/a
...			add_user=//*[@id="content-main"]/div[1]/table/tbody/tr[2]/td[1]/a
...			change_user=//*[@id="content-main"]/div[1]/table/tbody/tr[2]/td[2]/a
...			postings=//*[@id="content-main"]/div[2]/table/caption/a				# under users
...			blog_posts=//*[@id="content-main"]/div[2]/table/tbody/tr/th/a		# under postings
...			add_blog_post=//*[@id="content-main"]/div[2]/table/tbody/tr/td[1]/a
...			change_blog_post=//*[@id="content-main"]/div[2]/table/tbody/tr/td[2]/a
...			add_button=//div[@id="content-main"]//a[contains(., ${MAIN_PAGE_TEXT}[add_button])]		# in the upper center 3 of them
...			change_button=//div[@id="content-main"]//a[contains(., ${MAIN_PAGE_TEXT}[change_button])]		# in the upper center 3 of them
...			recent_actions=//div[@id="recent-actions-module"]/h2			# right column in the middle
...			my_actions=//*[@id="recent-actions-module"]/h3