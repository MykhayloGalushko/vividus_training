Scenario: Navigate to the EPAM.com and check that title of the page is correct
Given I am on main application page
Then page title is equal to `EPAM | Software Engineering & Product Development Services`

Scenario: Check the ability to switch modes
When I wait until element located by `cssSelector(.theme-switcher)` appears
When I click on element located by `cssSelector(.theme-switcher)`
Then number of elements found by `<classNameLocator>` is equal to `1`
Examples:
|classNameLocator     |
|className(light-mode)|
|className(dark-mode) |

Scenario: Check that allows to change language to UA
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
When I reset context
Examples:
|textToCheck             |
|INVESTORS               |
|COOKIE POLICY           |
|OPEN SOURCE             |
|APPLICANT PRIVACY NOTICE|
|PRIVACY POLICY          |
|WEB ACCESSIBILITY       |

Scenario: Check that allow to switch location list by region
When I scroll element located by `caseSensitiveText(Our Locations)` into view
When I change context to element located by `xpath(//*[contains(@class,'tabs-ui-23')])`
When I click on element located by `<locationName>`
Then text `<countryName>` exists
When I reset context
Examples:
|locationName  |countryName|
|name(AMERICAS)|CANADA     |
|name(EMEA)    |ARMENIA    |
|name(APAC)    |INDIA      |

Scenario: Check the search function
When I scroll element located by `className(header-search__search-icon)` into view
When I click on element located by `className(header-search__search-icon)`
When I enter `AI` in field located by `id(new_form_search)`
When I click on element located by `classname(bth-text-layer)`
Then the page with the URL 'https://www.epam.com/search?q=AI' is loaded

Scenario: Check form's fields validation
When I go to relative URL `/about/who-we-are/contact`
When I click on element located by `name(SUBMIT)`
Then number of elements found by `xpath(//input[@aria-required="true"])` is equal to `5`

Scenario: Check that the Company logo on the header lead to the main page
When I go to relative URL `/about`
When I click on element located by `className(header__logo-link)`
Then the page with the URL 'https://www.epam.com/' is loaded

Scenario: Check that allows to download report
When I go to relative URL `/about`
When I save `href` attribute value of element located by `xpath(//span[contains(@class, 'desktop') and contains(text(), 'DOWNLOAD')]/../../..//a[@data-gtm-action='click'])` to scenario variable `FileName`
Then `${FileName}` is = `https://www.epam.com/content/dam/epam/free_library/EPAM_Corporate_Overview_Q4_EOY.pdf`
When I execute HTTP GET request for resource with URL `${FileName}`
Then response code is equal to `200`

















































