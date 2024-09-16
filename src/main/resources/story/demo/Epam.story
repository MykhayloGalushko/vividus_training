Scenario: Navigate to the EPAM.com and check that title of the page is correct
Given I am on main application page
Then page title is equal to `EPAM | Software Engineering & Product Development Services`

Scenario: Check the ability to switch modes
Given I am on main application page
When I wait until element located by `cssSelector(.theme-switcher)` appears
When I click on element located by `cssSelector(.theme-switcher)`
Then number of elements found by `<classNameLocator>` is equal to `1`
Examples:
|classNameLocator |
|className(light-mode)|
|className(dark-mode)|

Scenario: Check that allows to change language to UA
Given I am on main application page
When I wait until element located by `caseSensitiveText(Global (EN))` appears
When I click on element located by `caseSensitiveText(Global (EN))`
When I wait until element located by `className(location-selector__panel)` appears
When I change context to element located `className(location-selector__panel)`
When I click on element located by `caseSensitiveText(Україна (Українська))`
Then the page with the URL 'https://careers.epam.ua/' is loaded
Then page title is equal to `EPAM Ukraine - найбільша ІТ-компанія в Україні | Вакансії`

Scenario: Check the policies list
Given I am on main application page
When I scroll element located by `cssSelector(.policies)` into view
When I change context to element located by `cssSelector(.policies)`
Then text `<textToCheck>` exists
Examples:
|textToCheck|
|INVESTORS|
|COOKIE POLICY|
|OPEN SOURCE|
|APPLICANT PRIVACY NOTICE|
|PRIVACY POLICY|
|WEB ACCESSIBILITY|

Scenario: Check that allow to switch location list by region
Given I am on main application page
When I scroll element located by `By.caseSensitiveText(Our Locations)` into view
When I change context to element located by `id(id-890298b8-f4a7-3f75-8a76-be36dc4490fd)`
When I click on element located by `<locationName>`
Then text `<countryName>` exists
Examples:
|locationName  | countryName |
|name(AMERICAS)| CANADA      |
|name(EMEA)    | ARMENIA     |
|name(APAC)    | INDIA       |

Scenario: Check the search function
Given I am on main application page
When I click on element located by `className(header-search__search-icon)`
When I enter `AI` in field located by `id(new_form_search)`
When I click on element located by `classname(bth-text-layer)`
Then the page with the URL 'https://www.epam.com/search?q=AI' is loaded

Scenario: Check form's fields validation
Given I am on main application page
When I go to relative URL `/about/who-we-are/contact`
When I click on element located by `name(SUBMIT)`
Then text `This is a required field` exists

Scenario: Check that the Company logo on the header lead to the main page
Given I am on main application page
When I go to relative URL `/about`
When I click on element located by `className(header__logo-link)`
Then the page with the URL 'https://www.epam.com/' is loaded

Scenario: Check that allows to download report
Given I am on main application page
When I go to relative URL `/about`
When I click on element located by `caseInsensitiveText(Download)`
Then page title is equal to `One of the Fastest-Growing Public Tech Companies | About EPAM`




















