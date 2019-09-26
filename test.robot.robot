
*** Settings ***
Library         Selenium2Library
Test Teardown   close browser
*** Variables ***
${androidPackage}   com.android.chrome
${google url}       http://google.com
${gc browser}       gc
*** Keywords ***
Search on Google Chrome
    input text  name=q  exoplayer kotlin android github
    submit form
    Wait Until Page Contains    ExoPlayer
Click link2
    Click Element   xpath=//*[@id="rso"]//div[2]//div[1]/a
    Wait Until Page Contains    Android
Open Browser Chrome on PC
    Open Browser    ${google url}   ${gc browser}
Open Browser Chrome on Android
    ${options}=    Create Dictionary    androidPackage=${androidPackage}
    ${caps}=    Create Dictionary    chromeOptions=${options}
    Create Webdriver    Remote    command_executor=http://192.168.230.1:4444/wd/hub    desired_capabilities=${caps}
    Go To    ${google url}

*** Test Cases ***
test mobile
    Open Browser Chrome on Android
    Search on Google Chrome
    Click link2
    GO BACK
test Browser
    Open Browser Chrome on PC
    Search on Google Chrome
    Click link2
    GO BACK
