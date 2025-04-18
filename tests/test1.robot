*** Settings ***
Library    Browser

*** Test Cases ***
Test1
    [Tags]    XRAYT-8
    New Browser        headless=True
    Go To               url=https://example.com/
    Take Screenshot
