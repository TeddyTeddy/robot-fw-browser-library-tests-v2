*** Settings ***
Documentation					Common keywords and variables defined here for the test suite
Library							OperatingSystem
Library							Browser		timeout=30s		auto_closing_level=SUITE	enable_presenter_mode=${True}


*** Variables ***
${LOCATORS_PATH}				${EXECDIR}${/}Resources${/}Locators${/}
${BROWSER}						chromium


*** Keywords ***
Begin Web Test
	Load Locator Resources
	New Browser 	browser=${BROWSER}	 headless=False
	New Context
	New Page
	Login As Admin

End Web Test
	Logout
	Close Browser

Load Locator Resources
	[Documentation]   Depending on the browser used, it loads the corresponding locator resource files
	IF		'${BROWSER}'=='firefox' or '${BROWSER}'=='ff'
	    Import Locators		${LOCATORS_PATH}Firefox
	END
	IF		'${BROWSER}'=='chrome' or '${BROWSER}'=='gc'
	    Import Locators		${LOCATORS_PATH}Chrome
	END
	IF		'${BROWSER}'=='chromium'
		Import Locators		${LOCATORS_PATH}Chromium
	END

Import Locators
	[Arguments]				${locators_path}
	${locator_files} 		List Files In Directory			${locators_path}		*Locators.resource		absolute
	FOR		${locator_file}	IN		@{locator_files}
		Log To Console		Loading the resource file: ${locator_file}
		Import Resource		${locator_file}
	END
