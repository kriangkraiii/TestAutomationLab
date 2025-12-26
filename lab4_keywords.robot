*** Settings ***
Documentation    Common keywords for Lab4 Workshop Registration Testing
Resource         config.robot

*** Keywords ***
# Browser Management for Lab4
Open Lab4 Test Browser
    [Documentation]    เปิด Chrome Browser สำหรับการทดสอบ Lab4
    Open Browser    ${LAB4_REGISTRATION_URL}    ${LAB4_BROWSER}
    Set Selenium Speed    ${LAB4_DELAY}
    Maximize Browser Window

Close Lab4 Test Browser
    [Documentation]    ปิด Browser
    Close Browser

# Page Navigation for Lab4
Navigate To Lab4 Registration Page
    [Documentation]    ไปยังหน้า Workshop Registration ของ Lab4
    Go To    ${LAB4_REGISTRATION_URL}
    Wait Until Page Contains Element    ${FIRSTNAME_FIELD}    timeout=10s
    Page Should Contain    Workshop Registration

# Form Management for Lab4
Clear All Lab4 Form Fields
    [Documentation]    ล้างข้อมูลทุกช่องในฟอร์ม Lab4
    Execute Javascript    
    ...    try {
    ...        document.getElementById('firstname').value = '';
    ...        document.getElementById('lastname').value = '';
    ...        document.getElementById('organization').value = '';
    ...        document.getElementById('email').value = '';
    ...        document.getElementById('phone').value = '';
    ...        document.getElementById('errors').innerHTML = '';
    ...    } catch(e) {
    ...        console.log('Form clearing error: ' + e.message);
    ...    }

Fill Lab4 Form Field
    [Arguments]    ${field_locator}    ${value}
    [Documentation]    กรอกข้อมูลในช่องที่กำหนด
    Wait Until Element Is Visible    ${field_locator}    timeout=5s
    Clear Element Text    ${field_locator}
    Input Text    ${field_locator}    ${value}

Submit Lab4 Registration Form
    [Documentation]    กดปุ่มลงทะเบียน Lab4
    Click Button    ${REGISTER_BUTTON}
    Sleep    2s    # รอให้ form submit และ redirect

# Verification Keywords for Lab4
Verify Lab4 Success Page
    [Documentation]    ตรวจสอบหน้า Success ของ Lab4
    Wait Until Location Contains    Success.html    timeout=7s
    Wait Until Page Contains    Success    timeout=5s
    Page Should Contain    Thank you for registering with us.
    Page Should Contain    We will send a confirmation to your email soon.
    Title Should Be    Success
    Log    Lab4 Success page verified successfully

Verify Lab4 Error Message
    [Arguments]    ${expected_message}
    [Documentation]    ตรวจสอบข้อความแสดงข้อผิดพลาดของ Lab4
    Wait Until Element Contains    ${ERROR_MESSAGE}    ${expected_message}    timeout=5s
    Element Should Contain    ${ERROR_MESSAGE}    ${expected_message}
    Log    Error message verified: ${expected_message}

Verify Still On Lab4 Registration Page
    [Documentation]    ตรวจสอบว่ายังอยู่ในหน้า Registration ของ Lab4
    Location Should Contain    Registration.html
    Page Should Contain    Workshop Registration
    Log    Still on Lab4 Registration page

# Form Fill Keywords for Lab4
Fill Lab4 Complete Registration Form
    [Arguments]    ${firstname}=${VALID_FIRST_NAME}    ${lastname}=${VALID_LAST_NAME}    
    ...           ${organization}=${VALID_ORGANIZATION}    ${email}=${VALID_EMAIL}    
    ...           ${phone}=${VALID_PHONE_DASH}
    [Documentation]    กรอกฟอร์มลงทะเบียน Lab4 แบบครบถ้วน
    Clear All Lab4 Form Fields
    Fill Lab4 Form Field    ${FIRSTNAME_FIELD}      ${firstname}
    Fill Lab4 Form Field    ${LASTNAME_FIELD}       ${lastname}
    Fill Lab4 Form Field    ${ORGANIZATION_FIELD}   ${organization}
    Fill Lab4 Form Field    ${EMAIL_FIELD}          ${email}
    Fill Lab4 Form Field    ${PHONE_FIELD}          ${phone}
    Log    Filled complete registration form with all fields

Fill Lab4 Registration Form Without Organization
    [Arguments]    ${firstname}=${VALID_FIRST_NAME}    ${lastname}=${VALID_LAST_NAME}    
    ...           ${email}=${VALID_EMAIL}    ${phone}=${VALID_PHONE_DASH}
    [Documentation]    กรอกฟอร์มลงทะเบียน Lab4 โดยไม่มีองค์กร
    Clear All Lab4 Form Fields
    Fill Lab4 Form Field    ${FIRSTNAME_FIELD}    ${firstname}
    Fill Lab4 Form Field    ${LASTNAME_FIELD}     ${lastname}
    Fill Lab4 Form Field    ${EMAIL_FIELD}        ${email}
    Fill Lab4 Form Field    ${PHONE_FIELD}        ${phone}
    Log    Filled registration form without organization

Fill Lab4 Partial Form
    [Arguments]    ${firstname}=${EMPTY}    ${lastname}=${EMPTY}    
    ...           ${organization}=${EMPTY}    ${email}=${EMPTY}    ${phone}=${EMPTY}
    [Documentation]    กรอกฟอร์ม Lab4 บางส่วนตามที่กำหนด
    Clear All Lab4 Form Fields
    Run Keyword If    '${firstname}' != '${EMPTY}'      Fill Lab4 Form Field    ${FIRSTNAME_FIELD}      ${firstname}
    Run Keyword If    '${lastname}' != '${EMPTY}'       Fill Lab4 Form Field    ${LASTNAME_FIELD}       ${lastname}
    Run Keyword If    '${organization}' != '${EMPTY}'   Fill Lab4 Form Field    ${ORGANIZATION_FIELD}   ${organization}
    Run Keyword If    '${email}' != '${EMPTY}'          Fill Lab4 Form Field    ${EMAIL_FIELD}          ${email}
    Run Keyword If    '${phone}' != '${EMPTY}'          Fill Lab4 Form Field    ${PHONE_FIELD}          ${phone}
    Log    Filled partial form with selected fields

# Setup and Teardown for Lab4
Lab4 Test Setup
    [Documentation]    Setup สำหรับแต่ละ test case ของ Lab4
    Navigate To Lab4 Registration Page

Lab4 Test Teardown
    [Documentation]    Teardown สำหรับแต่ละ test case ของ Lab4
    Run Keyword If    '${TEST STATUS}' == 'FAIL'    Capture Page Screenshot
    # ไปกลับไปหน้า Registration ก่อนจะล้างข้อมูล
    Run Keyword And Ignore Error    Go To    ${LAB4_REGISTRATION_URL}
    Sleep    1s
    Run Keyword And Ignore Error    Clear All Lab4 Form Fields

Lab4 Suite Setup
    [Documentation]    Setup สำหรับ test suite ของ Lab4
    Open Lab4 Test Browser
    Log    Lab4 Test Suite Started with Chrome Browser

Lab4 Suite Teardown
    [Documentation]    Teardown สำหรับ test suite ของ Lab4
    Close Lab4 Test Browser
    Log    Lab4 Test Suite Completed
