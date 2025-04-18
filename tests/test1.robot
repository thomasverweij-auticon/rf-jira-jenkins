*** Settings ***
Library    Browser

*** Test Cases ***
Test1
    [Tags]    XRAYT-8
    New Browser        headless=True
    New Page               url=https://example.com/
    Take Screenshot
