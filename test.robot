
*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${PAGE}  http://www.jimms.fi
${BROWSER}  ff
*** Test Cases ***
User must be able to open jimms.fi
  [Tags]  Smoke
  Open Browser  ${PAGE}  ${BROWSER}
Search for the GPU and press enter
  Input Text  name:q  GTX 1080Ti
  Press Key  name:q  \\13
Click add to basket on the first GPU found
  Wait Until Element Is Visible  xpath=//a[contains(text(),'LISÄÄ KORIIN')] 
  Click Element   xpath=//a[contains(text(),'LISÄÄ KORIIN')]
  Close Browser
*** Keywords ***
