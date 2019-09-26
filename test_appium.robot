
*** Settings ***
Library  AppiumLibrary
Library  Selenium2Library
*** Variables ***
${google url}   https://www.google.com/
${REMOTE_URL}     http://localhost:4723/wd/hub
${PLATFORM_NAME}    Android
${PLATFORM_VERSION}    9
${DEVICE_NAME}    309344a
${A2}   309344a

*** Keywords ***
open google on web browser
    Open Browser    ${google url}   gc
open goolge on app browser
    Open Application    ${REMOTE_URL}   platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}     	deviceName=${DEVICE_NAME}      browserName=Chrome
search on google
    AppiumLibrary.input text  name=q  exoplayer kotlin android github
    AppiumLibrary.Click Element     xpath=//*[@id="tsf"]/div[2]/div[1]/div[1]/button[2]/div/span
    AppiumLibrary.Wait Until Page Contains    GitHub
    AppiumLibrary.Click Element   xpath=//*[@id="rso"]//div[2]//div[1]/a
    AppiumLibrary.Wait Until Page Contains    GitHub
    AppiumLibrary.GO BACK
search google on browser
    Selenium2Library.Wait Until Page Contains    Google
    Selenium2Library.input text  name=q  exoplayer kotlin android github
    Selenium2Library.Click Element     xpath=//*[@id="tsf"]/div[2]/div[1]/div[3]/center/input[1]
    Selenium2Library.Wait Until Page Contains    GitHub
    Selenium2Library.Click Element   xpath=//*[@id="rso"]//div[2]//div[1]/a
    Selenium2Library.Wait Until Page Contains    GitHub
    Selenium2Library.GO BACK
    Selenium2Library.Close Browser
List Contexts
    ${contexts}=            Get Contexts
    log to console          ${contexts}
    Switch To Context       CHROMIUM
    ${Ccontext}=            Get Current Context
    log to console          ${Ccontext}

List Contexts webview chrome
    ${contexts}=            Get Contexts
    log to console          ${contexts}
    Switch To Context       WEBVIEW_chrome
    ${Ccontext}=            Get Current Context
    log to console          ${Ccontext}

List Contexts webview native
    ${contexts}=            Get Contexts
    log to console          ${contexts}
    Switch To Context       NATIVE_APP
    ${Ccontext}=            Get Current Context
    log to console          ${Ccontext}

open goolge on app browser appActivity
    Open Application    ${REMOTE_URL}   platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}     	deviceName=${DEVICE_NAME}      appPackage=com.android.chrome      appActivity=com.google.android.apps.chrome.Main    noReset=true


*** Test Cases ***

open goolge on browser Chrome (PC)
    Open Browser    ${google url}   gc
open goolge on browser Chrome (Android)
    Open Application    ${REMOTE_URL}   platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}     	deviceName=${DEVICE_NAME}      appPackage=com.android.chrome      appActivity=com.google.android.apps.chrome.Main    noReset=true
    AppiumLibrary.Click Element   id=com.android.chrome:id/search_box_text
    AppiumLibrary.Input Text      id=com.android.chrome:id/url_bar     https://www.google.com/
    AppiumLibrary.Press Keycode   66

