*** settings ****
Library                                  SeleniumLibrary

Test Setup                               Setup
Test Teardown                            Teardown

*** keywords ****
Setup
    #Set Environment Variable             webdriver.chrome.driver                                     /usr/local/bin/chromedriver
    Open Browser                         https://evernote.com/intl/sv         chrome
    Maximize Browser Window
    Wait Until Page Contains             Logga in
    Click Element                        xpath=//a[@class='button-outline']    
    Title Should Be                      Welcome Back
    
    ${uname}                             set Variable                     lweingartner132
    Input Text                           id=username                         ${uname}               
    Click Element                        id=loginButton
    Wait Until Page Contains Element     id=password
    sleep            2
    ${password}                          set Variable                                                                                                    PF-94-tdb
    Input Password                       id=password                ${password}
    Click Element                        id=loginButton
    Wait Until Page Contains Element     id=qa-NAV_SEARCH_BOX
        
Teardown
    Close All Browsers
    
    
   

*** test cases ****
 Test Case 1 - Create new Note   
    Click Element                        id=qa-CREATE_NOTE
#    Click Element                        class=_3UgUxSLR9QvWOSDpQG4Was
    sleep                5
    Input Text                           id=qa-NOTE_EDITOR_TITLE            Titel test 1
    sleep                2
    Input Text                           xpath=//*[@id="en-note"]         gdhagdsh
#    Input Text                           css=#en-note       Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis id odio eu eros posuere 
                                                                            ...convallis ut eu quam. Quisque ac porttitor nibh, ac blandit tortor. Curabitur in ante id sapien mollis imperdiet a sit amet quam. Curabitur vel quam ut tortor accumsan viverra. Quisque sit amet accumsan lacus. In hac habitasse platea dictumst. Praesent ut lobortis dui. Nulla facilisi.
                                                                            ...Maecenas et elit a diam hendrerit ultricies at ut leo. Nulla vulputate sed tellus eu luctus. 
                                                                            ...Donec cursus tincidunt tristique. Curabitur rutrum sem et ex egestas finibus. Nam sit amet enim convallis, imperdiet dui vel, laoreet urna. Morbi lobortis imperdiet mauris et faucibus. Nullam tortor nisl, viverra vel velit quis, viverra mollis arcu. Curabitur eu dignissim velit, non dignissim erat. In hac habitasse platea dictumst. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam ultricies tristique luctus. Morbi lobortis interdum ullamcorper. Donec convallis, orci quis fringilla hendrerit, mi enim vehicula justo, eget elementum ligula dui non dui. Vestibulum in lorem lacus. Ut pharetra lacus neque, ut sodales urna porta pharetra. Duis rutrum elit ante, eu mattis nunc vulputate at.
    Wait Until Element Contains          class=_3TIyCU_wUTMuoCQS94lCzS      Titel test 1  
    sleep                3
