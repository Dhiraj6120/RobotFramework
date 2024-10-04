*** Settings ***
Documentation    This page is for locators of Checkout screen

*** Variables ***
${firstNameFieldOnCheckoutScreen}    xpath://input[@id='BillingNewAddress_FirstName']
${lastNameFieldOnCheckoutScreen}    xpath://input[@id='BillingNewAddress_LastName']
${emailFieldOnCheckoutScreen}    xpath://input[@id='BillingNewAddress_Email']
${companyFieldOnCheckoutScreen}    xpath://input[@id='BillingNewAddress_Company']
${countryDropdownOnCheckoutScreen}    xpath://select[@class='valid']
${stateDropdownOnCheckoutScreen}    xpath://select[@id='BillingNewAddress_StateProvinceId']
${cityFieldOnCheckoutScreen}    xpath://input[@id='BillingNewAddress_City']
${addressOneFieldOnCheckoutScreen}    xpath://input[@id='BillingNewAddress_Address1']
${addressTwoFieldOnCheckoutScreen}    xpath://input[@id='BillingNewAddress_Address2']
${zipCodeFieldOnCheckoutScreen}    xpath://input[@id='BillingNewAddress_ZipPostalCode']
${phoneNumberFieldOnCheckoutScreen}    xpath://input[@id='BillingNewAddress_PhoneNumber']
${continueButtonForBillingAddress}    xpath://input[@onclick='Billing.save()']
${continueButtonForShippingAddress}    xpath://input[@onclick='Shipping.save()']
${groundShippingMethod}    xpath://input[@id='shippingoption_0']
${nextDayAirShippingMethod}    xpath://input[@id='shippingoption_1']
${secondDayAirShippingMethod}    xpath://input[@id='shippingoption_2']
${continueButtonForShippingMethod}    xpath://input[@onclick='ShippingMethod.save()']
${checkOrMoneyOrderPaymentMethod}    xpath://input[@id='paymentmethod_0']
${creditCardPaymentMethod}    xpath://input[@id='paymentmethod_1']
${purchaseOrderPaymentMethod}    xpath://input[@id='paymentmethod_2']
${continueButtonForPaymentMethod}    xpath://input[@onclick='PaymentMethod.save()']
${continueButtonForPaymentInfo}    xpath://input[@onclick='PaymentInfo.save()']
${confirmOrderButtonConfirmOrderSection}    xpath://input[@onclick='ConfirmOrder.save()']



