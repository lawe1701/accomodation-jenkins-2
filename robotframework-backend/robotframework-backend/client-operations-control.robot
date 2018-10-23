*** Variables ***
${http content localhost}    localhost:8080
${http context variable}     http
${header content Json}       application/json
${response 200}              200
${response 204}              204
${get client endpoint}       /hotel-rest/webresources/client/
${post client endpoint}      /hotel-rest/webresources/client/

*** Keywords ***

Create a new client with a post request
    ${client Json}             Generate A Random Client
    Create Http Context        ${http content localhost}          ${http context variable}
    
    Set Request Body           ${client Json}
    Set Request Header         Content-Type             ${header content Json}
    Post                       ${post client endpoint}
    ${status code}=            Get Response Status	
    Should Start With	       ${status code}          ${response 204} 

    
Request information of all clients and check status code
    Create Http Context        ${http content localhost}          ${http context variable}
    Get                        ${get client endpoint} 
    ${status code}=            Get Response Status	
    Should Start With	       ${status code}          ${response 200}
    
    
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

   
Request information of a specific clients and check status code    [Arguments]    ${client id}
    Create Http Context        ${http content localhost}          ${http context variable}
    Get                        ${get client endpoint}${client id}
    ${status code}=            Get Response Status	
    Should Start With	       ${status code}          ${response 200}






    