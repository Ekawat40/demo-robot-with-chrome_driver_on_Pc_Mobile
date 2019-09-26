
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
search google on mobile
    AppiumLibrary.input text  name=q  exoplayer kotlin android github
    AppiumLibrary.Click Element     xpath=//*[@id="tsf"]/div[2]/div[1]/div[1]/button[2]/div/span
    AppiumLibrary.Wait Until Page Contains    GitHub
    AppiumLibrary.Click Element   xpath=//*[@id="rso"]//div[2]//div[1]/a
    AppiumLibrary.Wait Until Page Contains    GitHub
    AppiumLibrary.GO BACK
search google on pc
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
    log to console          ${Cconte    xt}

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

open google on web browser ff
    Open Browser    ${google url}   ff

open goolge on app browser appActivity ff
    Open Application    ${REMOTE_URL}   platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}     	deviceName=${DEVICE_NAME}      appPackage=org.mozilla.firefox      appActivity=org.mozilla.gecko.BrowserApp    noReset=true

*** Test Cases ***

open goolge on app browser Chrome (CHROMIUM)
    open goolge on app browser
    Go To Url   https://www.google.co.th/
    List Contexts
    search on google
    close Application

open goolge on app browser Chrome (WEBVIEW)
    open goolge on app browser appActivity
    AppiumLibrary.Input Text  id=com.android.chrome:id/url_bar    https://google.com
    AppiumLibrary.Wait Until Page Contains    Google
    Press Keycode   16
    List Contexts webview chrome
    search on google
    List Contexts webview native
    close Application

#open goolge on app browser ff (WEBVIEW)
#    open goolge on app browser appActivity ff
#    AppiumLibrary.Wait Until Page Contains    Face
#    List Contexts webview chrome
#    search on google
#    List Contexts webview native
#    close Application

open goolge on browser Chrome (PC)
    open google on web browser
    Maximize Browser Window
    search google on browser

open goolge on browser ff (PC)
    open google on web browser ff
    Maximize Browser Window
    search google on browser

