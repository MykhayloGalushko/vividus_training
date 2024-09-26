Scenario: Precondition - Generate values for variables
Given I initialize story variable `<variable>` with value `<value>`
Examples:
|variable |value |
|userFirstName| #{generate(Name.firstName)} |
|userLastName|#{generate(Name.lastName)}|
|userPassword|#{generate(Internet.password)}|
|userEmail|#{generate(Internet.safeEmailAddress)}|
|userCountry|Algeria|
|userCity|#{generate(Address.cityName)}|
|userAddress|#{generate(Address.fullAddress)}|
|userZipCode|#{generate(Address.zipCode)}|
|userPhoneNumber|#{generate(PhoneNumber.cellPhone)}|

Scenario: Verify that allows register a User
Given I am on page with URL `https://demowebshop.tricentis.com/`
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
When I click on element located by `className(ico-logout)`
When I click on element located by `className(ico-login)`
When I enter `${userEmail}` in field located by `id(Email)`
When I enter `${userPassword}` in field located by `id(Password)`
When I click on element located by `className(login-button)`
Then the page with the URL 'https://demowebshop.tricentis.com/' is loaded
Then number of elements found by `xpath(//a[normalize-space()='${userEmail}'])` is equal to `1`

Scenario: Verify that ‘Computers’ group has 3 sub-groups with correct nameslistbox
When I click on element located by `xpath(//div[@class='listbox']//a[normalize-space()='Computers'])`
Then number of elements found by `xpath(//div[@class='block block-category-navigation']//div[@class='listbox']/ul[@class='list']/li[@class='active']/ul[@class='sublist']/li/a)` is equal to `3`
Then number of elements found by `xpath(//div[@class='listbox']//a[normalize-space()='<subcategoryName>'])` is equal to `1`
Examples:
|subcategoryName|
|Desktops       |
|Notebooks      |
|Accessories    |

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
When I click on element located by `xpath(//li[@class='inactive']//a[normalize-space()='Notebooks'])`
When I click on element located by `xpath(//a[normalize-space()='14.1-inch Laptop'])`
When I click on element located by `xpath(//input[@class='button-1 add-to-cart-button'])`
When I wait until element located by `xpath(//div[@id='bar-notification'])` appears
When I hover mouse over element located `xpath(//li[@id='topcartlink']//a[@class='ico-cart'])`
Then number of elements found by `xpath(//div[@id='flyout-cart']/div[@class='mini-shopping-cart']/div[@class='items']//div[@class='product']/div[@class='name']/a[@href='/141-inch-laptop'])` is equal to `1`
Then text `The product has been added to your shopping cart` exists

Scenario:Verify that allows removing an item from the card
When I click on element located by `xpath(//li[@id='topcartlink']//a[@class='ico-cart'])`
When I wait until element located by `xpath(//input[@name='removefromcart'])` appears
When I click on element located by `xpath(//input[@name='removefromcart'])`
When I click on element located by `xpath(//input[@name='updatecart'])`
Then text `Your Shopping Cart is empty!` exists

Scenario:Verify that allows checkout an item
Given I am on page with URL `https://demowebshop.tricentis.com/`
When I click on element located by `xpath(//li[@class='inactive']//a[normalize-space()='Computers'])`
When I click on element located by `xpath(//li[@class='inactive']//a[normalize-space()='Notebooks'])`
When I click on element located by `xpath(//a[normalize-space()='14.1-inch Laptop'])`
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
When I scroll element located by `xpath(//div[@id='shipping-method-buttons-container']//input[@value='Continue'])` into view
When I wait until scroll is finished
When I click on element located by `xpath(//div[@id='shipping-method-buttons-container']//input[@value='Continue'])`
When I scroll element located by `xpath(//div[@id='payment-method-buttons-container']//input[@value='Continue'])` into view
When I wait until scroll is finished
When I click on element located by `xpath(//div[@id='payment-method-buttons-container']//input[@value='Continue'])`
When I wait until element located by `xpath(//div[@id='checkout-step-payment-info'])` appears
When I scroll element located by `xpath(//div[@id='payment-info-buttons-container']//input[@value='Continue'])` into view
When I wait until scroll is finished
When I click on element located by `xpath(//div[@id='payment-info-buttons-container']//input[@value='Continue'])`
When I scroll element located by `xpath(//input[@value='Confirm'])` into view
When I wait until scroll is finished
When I click on element located by `xpath(//input[@value='Confirm'])`
When I wait until element located by `xpath(//h1[normalize-space()='Thank you'])` appears
Then number of elements found by `xpath(//div[@class='section order-completed'])` is equal to `1`


Scenario: Verify that allows adding an item to the Wishlist
Given I am on page with URL `https://demowebshop.tricentis.com/black-white-diamond-heart`
When I click on element located by `xpath(//input[@id='add-to-wishlist-button-14'])`
When I click on element located by `xpath(//div[@class='header-links']//a[@class='ico-wishlist'])`
Then number of elements found by `xpath(//td[@class='product'])` is equal to `1`


`
















































