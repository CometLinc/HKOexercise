*** Settings ***
Documentation    Test suite of get current weather report
Resource    ./../init.robot

Test Timeout    ${TIMEOUT}

*** Test Cases ***
Get current weather report with default language
    ${resp} =    Get Current Weather Report
    Verify Status Code As Expected    ${resp}    200
    Verify Schema    current-weather-report.json    get    ${resp.json()}

Get current weather report with english
    ${resp} =    Get Current Weather Report    langValue=en
    Verify Status Code As Expected    ${resp}    200
    Verify Schema    current-weather-report.json    get    ${resp.json()}

Get current weather report with invalid data type
    ${resp} =    Get Current Weather Report    dataTypeValue=123
    ${errorMessage} =    Replace Wrong Query Message From Copy Deck    current-weather-report-error    invalid_message    ${resp.text}
    Verify Status Code As Expected    ${resp}    200
    Verify Response Content As Expected    ${resp.text}    ${errorMessage}

Get current weather report with invalid language
    ${resp} =    Get Current Weather Report    langValue=fr
    ${errorMessage} =    Replace Wrong Query Message From Copy Deck    current-weather-report-error    invalid_message    ${resp.text}
    Verify Status Code As Expected    ${resp}    200
    Verify Response Content As Expected    ${resp.text}    ${errorMessage}

Get current weather report with invalid parameter name
    ${resp} =    Get Current Weather Report    dataType=123
    ${errorMessage} =    Replace Wrong Query Message From Copy Deck    current-weather-report-error    invalid_message    ${resp.text}
    Verify Status Code As Expected    ${resp}    200
    Verify Response Content As Expected    ${resp.text}    ${errorMessage}

Get current weather report with simplified chinese
    ${resp} =    Get Current Weather Report    langValue=sc
    Verify Status Code As Expected    ${resp}    200
    Verify Schema    current-weather-report.json    get    ${resp.json()}

Get current weather report with tranditional chinese
    ${resp} =    Get Current Weather Report    langValue=tc
    Verify Status Code As Expected    ${resp}    200
    Verify Schema    current-weather-report.json    get    ${resp.json()}

Get current weather report without data type
    ${resp} =    Get Current Weather Report    dataType=None
    ${errorMessage} =    Replace Wrong Query Message From Copy Deck    current-weather-report-error    invalid_message    ${resp.text}
    Verify Status Code As Expected    ${resp}    200
    Verify Response Content As Expected    ${resp.text}    ${errorMessage}

*** Keywords ***  
Get Copy Deck Message From File
    [Documentation]    Get copy deck message from file
    [Arguments]     ${location}    ${message}
    ${description} =    Get File    ${CURDIR}/../res/copy_deck/${location}.json
    ${description} =    Evaluate    json.loads(r'''${description}''',strict=False)    json
    [Return]    ${description['${message}']}

Replace Wrong Query Message From Copy Deck
    [Documentation]    Replace error message from copy deck
    [Arguments]    ${location}    ${message}    ${query}
    ${errorMessage} =    Get Copy Deck Message From File    ${location}    ${message}
    ${errorMessage} =    Replace String    ${errorMessage}    {{query}}    ${query}
    [Return]    ${errorMessage}

Verify Response Content As Expected
    [Documentation]     Verify response string is as same as expected text
    [Arguments]    ${response}    ${expect}
    Should Be Equal As Strings    ${response}    ${expect}

Verify Status Code As Expected
    [Documentation]     Verify response status code is as same as expected status code
    [Arguments]    ${response}    ${code}
    Should Be Equal As Strings    ${response.status_code}    ${code}
