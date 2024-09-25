Scenario: Verify that allows register a User
Given I am on page with URL `https://demowebshop.tricentis.com/`
Given I initialize story variable `userPassword` with value `#{generate(Internet.password)}`
Given I initialize story variable `userFirstName` with value `#{generate(Name.firstName)}`
Given I initialize story variable `userLastName` with value `#{generate(Name.lastName)}`
Given I initialize story variable `userEmail` with value `#{generate(Internet.safeEmailAddress)}`
When I wait until element located by `className(ico-register)` appears
When I click on element located by `className(ico-register)`
When I wait until element located by `id(FirstName)` appears
When I wait until element located by `id(LastName)` appears
When I wait until element located by `id(Email)` appears
When I wait until element located by `id(Password)` appears
When I wait until element located by `id(ConfirmPassword)` appears
When I wait until element located by `id(gender-male)` appears
When I click on element located by `id(gender-male)`
When I enter `${userFirstName}` in field located by `id(FirstName)`
When I enter `${userLastName}` in field located by `id(LastName)`
When I enter `${userEmail}` in field located by `id(Email)`
When I enter `${userPassword}` in field located by `id(Password)`
When I enter `${userPassword}` in field located by `id(ConfirmPassword)`
When I click on element located by `name(register-button)`
When I wait until element located by `className(registration-result-page)` appears
Then text `Your registration completed` exists

Scenario: Verify that allows login a User
When I wait until element located by `className(ico-logout)` appears
When I click on element located by `className(ico-logout)`
When I wait until element located by `className(ico-login)` appears
When I click on element located by `className(ico-login)`
When I wait until element located by `id(Email)` appears
When I wait until element located by `id(Password)` appears
When I enter `${userEmail}` in field located by `id(Email)`
When I enter `${userPassword}` in field located by `id(Password)`
When I click on element located by `className(login-button)`
Then the page with the URL 'https://demowebshop.tricentis.com/' is loaded
Then number of elements found by `xpath(//a[normalize-space()='${userEmail}'])` is equal to `1`

Scenario: Verify that ‘Computers’ group has 3 sub-groups with correct names
When I click on element located by `xpath(//li[@class='<className>']//a[normalize-space()='Computers'])`
Then number of elements found by `xpath(//div[@class='block block-category-navigation']//div[@class='listbox']/ul[@class='list']/li[@class='active']/ul[@class='sublist']/li/a)` is equal to `3`
Then number of elements found by `xpath(//li[@class='inactive']//a[normalize-space()='<subcategoryName>'])` is equal to `1`
Examples:
|className|subcategoryName|
|inactive |Desktops       |
|active   |Notebooks      |
|active   |Accessories    |

Scenario: Verify that allows sorting items (different options)
When I click on element located by `xpath(//li[@class='inactive']//a[normalize-space()='Desktops'])`
Then dropdown located by `xpath(//select[@id='products-orderby'])` contains options:
|state|item              |
|true |Position          |
|false|Name: A to Z      |
|false|Name: Z to A      |
|false|Price: Low to High|
|false|Price: High to Low|
|false|Created on        |

Scenario: Verify that allows changing number of items on page
When I select `4` in dropdown located `xpath(//select[@id='products-pagesize'])`
Then number of elements found by `xpath(//div[@class='item-box'])` is equal to `4`

Scenario: Verify that allows adding an item to the cart
When I click on element located by `xpath(//li[@class='inactive']//a[normalize-space()='<categoryName>'])`
When I click on element located by `xpath(//a[normalize-space()='<productName>'])`
When I click on element located by `xpath(//input[@class='button-1 add-to-cart-button'])`
When I wait until element located by `xpath(//div[@id='bar-notification'])` appears
When I hover mouse over element located `xpath(//li[@id='topcartlink']//a[@class='ico-cart'])`
Then number of elements found by `xpath(//div[@id='flyout-cart']/div[@class='mini-shopping-cart']/div[@class='items']//div[@class='product']/div[@class='name']/a[@href='/<productURL>'])` is equal to `1`
Then text `The product has been added to your shopping cart` exists
Examples:
|categoryName|productName     |productURL     |
|Notebooks   |14.1-inch Laptop|141-inch-laptop|

Scenario:Verify that allows removing an item from the card
When I click on element located by `xpath(//li[@id='topcartlink']//a[@class='ico-cart'])`
When I wait until element located by `xpath(//input[@name='removefromcart'])` appears
When I click on element located by `xpath(//input[@name='removefromcart'])`
When I click on element located by `xpath(//input[@name='updatecart'])`
Then text `Your Shopping Cart is empty!` exists

Scenario:Verify that allows checkout an item
Given I am on page with URL `https://demowebshop.tricentis.com/`
Given I initialize story variable `userCountry` with value `Algeria`
Given I initialize story variable `userCity` with value `#{generate(Address.cityName)}`
Given I initialize story variable `userAddress` with value `#{generate(Address.fullAddress)}`
Given I initialize story variable `userZipCode` with value `#{generate(Address.zipCode)}`
Given I initialize story variable `userPhoneNumber` with value `#{generate(PhoneNumber.cellPhone)}`
When I click on element located by `xpath(//li[@class='inactive']//a[normalize-space()='Computers'])`
When I click on element located by `xpath(//li[@class='inactive']//a[normalize-space()='<categoryName>'])`
When I click on element located by `xpath(//a[normalize-space()='<productName>'])`
When I click on element located by `xpath(//input[@class='button-1 add-to-cart-button'])`
When I wait until element located by `xpath(//div[@id='bar-notification'])` appears
When I click on element located by `xpath(//li[@id='topcartlink']//a[@class='ico-cart'])`
When I click on element located by `xpath(//input[@id='termsofservice'])`
When I click on element located by `xpath(//button[@id='checkout'])`
When I enter `${userFirstName}` in field located by `xpath(//input[@id='BillingNewAddress_FirstName'])`
When I enter `${userLastName}` in field located by `xpath(//input[@id='BillingNewAddress_LastName'])`
When I enter `${userEmail}` in field located by `xpath(//input[@id='BillingNewAddress_Email'])`
When I select `${userCountry}` in dropdown located `xpath(//select[@id='BillingNewAddress_CountryId'])`
When I enter `${userCity}` in field located by `xpath(//input[@id='BillingNewAddress_City'])`
When I enter `${userAddress}` in field located by `xpath(//input[@id='BillingNewAddress_Address1'])`
When I enter `${userZipCode}` in field located by `xpath(//input[@id='BillingNewAddress_ZipPostalCode'])`
When I enter `${userPhoneNumber}` in field located by `xpath(//input[@id='BillingNewAddress_PhoneNumber'])`
When I click on element located by `xpath(//input[@title='Continue'])`
When I wait until element located by `xpath(//select[@id='shipping-address-select'])` appears
When I click on element located by `xpath(//div[@id='shipping-buttons-container']//input[@value='Continue'])`
When I click on element located by `xpath(//div[@id='shipping-method-buttons-container']//input[@value='Continue'])`
When I click on element located by `xpath(//div[@id='payment-method-buttons-container']//input[@value='Continue'])`
When I wait until element located by `xpath(//div[@id='checkout-step-payment-info'])` appears
When I click on element located by `xpath(//div[@id='payment-info-buttons-container']//input[@value='Continue'])`
When I click on element located by `xpath(//input[@value='Confirm'])`
Then text `Your order has been successfully processed!` exists
Examples:
|categoryName|productName     |productURL     |
|Notebooks   |14.1-inch Laptop|141-inch-laptop|
















































