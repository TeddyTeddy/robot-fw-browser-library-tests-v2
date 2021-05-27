*** Settings ***
Documentation		Navigation bar at the top of every page is called TopNav


*** Variables ***
&{TOP_NAV_LOCATOR}
...					main_title=//*[@id="site-name"]/a				# on the upper left corner
...					welcome_user_x=//*[@id="user-tools"]			# on the upper right corner
...					view_site=//*[@id="user-tools"]/a[1]			# on the upper right corner
...					change_password=//*[@id="user-tools"]/a[2]		# on the upper right corner
...					logout=//*[@id="user-tools"]/a[3]				# on the upper right corner
