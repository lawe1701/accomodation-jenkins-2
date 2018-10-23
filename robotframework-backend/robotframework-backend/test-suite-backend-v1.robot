*** Settings ***
Library                        HttpLibrary.HTTP
Library                        String

*** Keywords ***
Generate A Random Client
    ${id}                        Set Variable              100
    ${name}                      Generate Random String    10    [LOWER]
    ${timestamp}                 Set Variable              14516121010000
    ${email}                     Catenate                  SEPARATOR=    ${name}  @email.com
    ${Social Security Number}    Generate Random String    12    [NUMBERS]
    ${gender}                    Generate Random String    1     FM
    
    ${client dictionary}         Create Dictionary               id=${id}  
                                 ...  name=${name}               createDate=${timestamp} 
                                 ...  email=${email}             gender=${gender}
                                 ...  socialSecurityNumber=${Social Security Number}
                                   
    ${client Json}=            Stringify Json           ${client dictionary}
    
    [Return]                   ${client Json}

*** Test cases ***
Test case 1 - Request data from a Client with ID 1
    Create Http Context        localhost:8080          http
    Get                        /hotel-rest/webresources/client/1
    ${status code}=            Get Response Status	
    Should Start With	       ${status code}          200

Test case 2 - Request data from all clients
    Create Http Context        localhost:8080          http
    Get                        /hotel-rest/webresources/client
    ${status code}=            Get Response Status	
    Should Start With	       ${status code}          200

Test case 3 - Create new client
    
    ${client Json}             Generate A Random Client
    Create Http Context        localhost:8080          http
    
    Set Request Body           ${client Json}
    Set Request Header         Content-Type             application/json
    Post                       /hotel-rest/webresources/client/ 
    ${status code}=            Get Response Status	
    Should Start With	       ${status code}          204
    
    
    
    
    