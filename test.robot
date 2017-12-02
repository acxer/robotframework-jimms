*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${PAGE}  http://www.jimms.fi
${BROWSER}  ff

*** Test Cases ***
User can search for GPU and add it to basket
  Given page can be opened
  Then user can search for GPU
  When user adds GPU to basket
  Then item is visible in basket

*** Keywords ***
Given page can be opened
  Open Browser  ${PAGE}  ${BROWSER}

Then user can search for GPU
  Input Text  name:q  GTX 1080Ti
  Press Key  name:q  \\13

When user adds GPU to basket
  Wait Until Element Is Visible  xpath=//a[contains(text(),'LISÄÄ KORIIN')]
  Click Element   xpath=//a[contains(text(),'LISÄÄ KORIIN')]

Then item is visible in basket
  Wait Until Element Is Visible  xpath=//*[@id="scrollable"]
  Close Browser
