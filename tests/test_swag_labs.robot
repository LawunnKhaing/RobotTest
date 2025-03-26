# Created by lawunn at 26.3.2025
*** Settings ***
*** Settings ***
Library           SeleniumLibrary
Suite Teardown    Close All Browsers

*** Variables ***
${URL}    https://lawunnkhaing.github.io/RobotTest/swag_labs.html
${USERNAME}    standard_user
${PASSWORD}    secret_sauce

*** Test Cases ***
Swag Labs Purchase Flow
    Open Browser    ${URL}    headlesschrome
    Maximize Browser Window
    Input Text    id=username    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Button    id=login-button
    Wait Until Element Is Visible    id=products-grid

    # Add two items
    Click Button    xpath=(//button[contains(text(), 'Add to Cart')])[1]
    Click Button    xpath=(//button[contains(text(), 'Add to Cart')])[2]

    # Proceed to cart/checkout
    Click Element    xpath=//div[contains(@class,'cart-icon')]
    Wait Until Element Is Visible    id=checkout-page

    # Remove one item
    Click Button    xpath=(//button[contains(text(), 'Remove')])[1]

    # Fill form
    Input Text    id=first-name    Alice
    Input Text    id=last-name    Tester
    Input Text    id=postal-code    12345
    Click Button    xpath=//button[contains(text(), 'Complete Purchase')]

    # Confirm
    Wait Until Page Contains    Thank You For Your Order!
