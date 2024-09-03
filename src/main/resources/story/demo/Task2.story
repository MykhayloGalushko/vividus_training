Scenario: Verify that allows registering a User
Given I am on page with URL `https://demowebshop.tricentis.com/`
When I click on element located by `By.cssSelector(a.ico-register)`
And I wait until element located by `By.cssSelector(.center-2)` appears
And I change context to element located by `By.cssSelector(.fieldset)`
And I click on element located by `By.id(gender-male)`
And I enter `Michael` in field located by `By.id(#FirstName)`
And I enter `Jordan` in field located by `By.id(#LastName)`
And I enter `humanyoggy@gmail.com` in field located by `By.id(Email)`
And I enter `123456` in field located by `By.id(#Password)`
And I enter `123456` in field located by `By.id(#ConfirmPassword)`
And I click on element located by `By.id(#register-button)`
Then the page with the URL 'https://demowebshop.tricentis.com/register/1' is loaded
And text `Your registration completed` exists

Scenario: Verify that allows login a User
Given I am on page with URL `https://demowebshop.tricentis.com/`
When I click on element located by `By.cssSelector(a.ico-login)`
And I wait until element located by `By.cssSelector(.center-2)` appears
And I change context to element located by `By.cssSelector(.returning-wrapper)`
And I enter `humanyoggy@gmail.com` in field located by `By.id(#Email)`
And I enter `123456` in field located by `By.id(#Password)`
And I click on element located by `By.cssSelector(.login-button)`
Then the page with the URL 'https://demowebshop.tricentis.com/' is loaded
And text `humanyoggy@gmail.com` exists

Scenario: Verify that ‘Computers’ group has 3 sub-groups with correct names
Given I am on page with URL `https://demowebshop.tricentis.com/`
When I click on element located by `By.cssSelector(a.a[href^="/computers"])`
Then each element with locator `By.cssSelector(a.a[href^="/computers"] > ul.sublist)` has `3` child elements with locator `By.cssSelector(il.inactive)`

Scenario: Verify that allows sorting items (different options)
Given I am on page with URL `https://demowebshop.tricentis.com/computers`
When I change context to element located by `By.cssSelector(.page-body)`
And I click on element located by `By.caseSensitiveText(Desktops)`
Then the page with the URL 'https://demowebshop.tricentis.com/desktops' is loaded
And dropdown located `By.id(products-orderby)` exists and selected option is `Position`

Scenario: Verify that allows changing number of items on page
Given I am on page with URL `https://demowebshop.tricentis.com/desktops`
When I click on element located by `By.id(products-pagesize)`
Then dropdown located by `By.id(products-pagesize)` contains options:
|state|item |
|false|4    |
|true |8    |
|false|12   |

Given I am on page with URL `https://demowebshop.tricentis.com/desktops`
When I click on element located by `By.id(products-pagesize)`
And I click on element located by `By.caseSensitiveText([value^="https://demowebshop.tricentis.com/desktops?pagesize=4")`
Then each element with locator `By.cssSelector(.product-grid)` has `4` child elements with locator `By.cssSelector(.item-box)`

Scenario: Verify that allows adding an item to the card
Given I am on page with URL `https://demowebshop.tricentis.com/notebooks`
When I click on element located by `By.caseSensitiveText(14.1-inch Laptop)`
And I wait until element located by `By.cssSelector(.page product-details-page)` appears
And I click on element located by `By.id(#add-to-cart-button-31)`
Then text `The product has been added to your shopping cart` exists
And text `Sopping cart(1)` exists

Scenario: Removing from the cart
Given I am on page with URL `https://demowebshop.tricentis.com/`
When I click on element located by `By.cssSelector(.cart-label)`
Then the page with the URL 'https://demowebshop.tricentis.com/cart' is loaded

When I add `0` to field located by `By.cssSelector(.qty-input)`
And I click on element located by `By.caseSensitiveText(.button-2.update-cart-button)`
Then text `Shopping cart Your Shopping Cart is empty!` exists

Scenario: Verify that allows checkout an item 
Given I am on page with URL `https://demowebshop.tricentis.com/notebooks`
When I click on element located by `By.caseSensitiveText(14.1-inch Laptop)`
And I wait until element located by `By.cssSelector(.page product-details-page)` appears
And I click on element located by `By.id(#add-to-cart-button-31)`
And I click on element located by `By.id(#termsofservice)` then page does not refresh
And I click on element located by `By.cssSelector(.button-1.checkout-button)`
Then the page with the URL 'https://demowebshop.tricentis.com/onepagecheckout' is loaded

When I change context to element located by `By.id(#checkout-step-billing)`
And I enter `London` in field located by `By.id(#BillingNewAddress_City)`
And I enter `123 boulevard` in field located by `By.id(#BillingNewAddress_Address1)`
And I enter `123456` in field located by `By.id(#BillingNewAddress_ZipPostalCode)`
And I enter `7123456789` in field located by `By.id(#BillingNewAddress_PhoneNumber)`
And I select `United Kingdom` in dropdown located by `By.id(#BillingNewAddress_CountryId)`
And I click on element located by `By.cssSelector(.button-1.new-address-next-step-button)`
And I click on element located by `By.cssSelector(.button-1.new-address-next-step-button)`
And I click on element located by `By.cssSelector(.button-1.new-address-next-step-button)`
And I click on element located by `By.cssSelector(.button-1.new-address-next-step-button)`
And I click on element located by `By.cssSelector(.button-1.confirm-order-next-step-button)`
Then the page with the URL 'https://demowebshop.tricentis.com/checkout/completed/' is loaded
And text `Your order has been successfully processed!` exists























