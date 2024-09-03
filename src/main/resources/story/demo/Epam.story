Scenario: Navigate to the EPAM.com and check that title of the page is correct
Given I am on main application page
Then page title is equal `EPAM | Software Engineering & Product Development Services`

Scenario: Check the ability to switch Light mode
Given I am on main application page
When I wait until element located by `By.cssSelector(.theme-switcher)` appears
And I click on element located by `By.cssSelector(.theme-switcher)`
And I change context to element located by `BycssSelector(.header-ui-23)`
Then the context element has the CSS property '--header-background-color'='#fbfafa'

Scenario: Check the ability to switch Dark mode
Given I am on main application page
When I wait until element located by `By.cssSelector(.theme-switcher)` appears
And I click on element located by `By.cssSelector(.theme-switcher)`
And I change context to element located by `By.cssSelector(.header-ui-23)`
Then the context element has the CSS property '--header-background-color'='#060606'

Scenario: Check that allow to change language to UA
Given I am on main application page
When I wait until element located by `By.cssSelector(button.location-selector__button-language)` appears
And I click on element located by `By.cssSelector(button.location-selector__button-language)`
And I wait until element located by `By.cssSelector(button.location-selector__panel)` appears
And I select `Україна (Українська)` in dropdown located by `By.cssSelector(button.location-selector__panel)`
Then the page with the URL 'https://careers.epam.ua/' is loaded
And page title is equal `EPAM Ukraine - найбільша ІТ-компанія в Україні | Вакансії`

Scenario: Check the policies list

Given I am on main application page
When I scroll element located by `By.cssSelector(.policies)` into view
And I change context to element located by `By.cssSelector(.policies)`
Then text `INVESTORS` exists
And text `COOKIE POLICY` exists
And text `OPEN SOURCE` exists
And text `APPLICANT PRIVACY NOTICE` exists
And text `PRIVACY POLICY` exists
And text `WEB ACCESSIBILITY` exists

Scenario: Check that allow to switch location list by region
Given I am on main application page
When I scroll element located by `By.caseSensitiveText(Our Locations)` into view
And I change context to element located by `By.id(id-890298b8-f4a7-3f75-8a76-be36dc4490fd)`
Then text `AMERICAS` exists
And text `EMEA` exists
And text `APAC` exists

When I click on element located by `By.name(EMEA)`
And I change context to element located by `By.id(id-890298b8-f4a7-3f75-8a76-be36dc4490fd)`
Then text `ARMENIA` exists
And text `AUSTRIA` exists
And text `BELARUS` exists
And text `BELGIUM` exists

When I click on element located by `By.name(APAC)`
And I change context to element located by `By.id(id-890298b8-f4a7-3f75-8a76-be36dc4490fd)`
Then text `AUSTRALIA` exists
And text `CHINA MAINLAND` exists
And text `HONG KONG SAR` exists
And text `INDIA` exists

When I click on element located by `By.name(AMERICAS)`
And I change context to element located by `By.id(id-890298b8-f4a7-3f75-8a76-be36dc4490fd)`
Then text `CANADA` exists
And text `COLOMBIA` exists
And text `DOMINICAN REPUBLIC` exists
And text `MEXICO` exists

Scenario: Check the search function
Given I am on main application page
When I click on element located by `By.cssSelector(button.header-search__button header__icon)`
And I enter `AI` in field located by `By.cssSelector(button.header-search__button header__icon)`
And I click on element located by `By.caseSensitiveText(Find)`
Then the page with the URL 'https://www.epam.com/search?q=AI' is loaded

Scenario: Check form's fields validation
Given I am on main application page
When I go to relative URL `/about/who-we-are/contact`
And I click on element located by `By.name(SUBMIT)`
And I change context to element located by `By.name(First Name*)`
Then text `This is a required field` exists

When I change context to element located by `By.name(Last Name*)`
Then text `This is a required field` exists

When I change context to element located by `By.name(Email*)`
Then text `This is a required field` exists

When I change context to element located by `By.name(Phone*)`
Then text `This is a required field` exists

When I change context to element located by `By.name(How did you hear about EPAM?*)`
Then text `This is a required field` exists

When I change context to element located by `By.name(How did you hear about EPAM?*)`
Then text `This is a required field` exists

When I change context to element located by `By.id(new_form_gdprConsent_d9f9e35e-f4a6-410c-9d10-8854e5b5e517)`
Then text `Please check thix box if you want to proceed` exists

Scenario: Check that the Company logo on the header lead to the main page
Given I am on main application page
When I go to relative URL `/about`
And I click on element located by `By.cssSelector(.header__logo header__logo-light)`
Then the page with the URL 'https://www.epam.com/' is loaded

Scenario: Check that allows to download report
Given I am on main application page
When I go to relative URL `/about`
And I scroll element located by `By.caseSensitiveText(EPAM At a Glance)` into view
And I click on element located by `By.caseSensitiveText(Download)`
Then the page with the URL 'https://www.epam.com/content/dam/epam/free_library/EPAM_Corporate_Overview_Q4_EOY.pdf' is loaded


















