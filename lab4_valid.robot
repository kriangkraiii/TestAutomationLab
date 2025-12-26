*** Settings ***
Documentation    UAT-Lab04-001: ลงทะเบียนเข้าร่วมอบรมเชิงปฏิบัติการสำเร็จ
...              Project: WEB-Lab-04 - เว็บไซต์ Lab 04 Software Engineering
...              Module: Workshop Registration
...              Version: V1.0
...              Test Scenario: เมื่อกรอกชื่อ นามสกุล ต้นสังกัด อีเมล และเบอร์โทรศัพท์ถูกต้อง
...              โดยที่จะกรอกข้อมูลหน่วยงานหรือไม่กรอกก็ได้ เมื่อกดปุ่ม Register 
...              ระบบจะแสดงหน้าลงทะเบียนสำเร็จ (Success.html)
Resource         lab4_keywords.robot
Suite Setup      Lab4 Suite Setup
Suite Teardown   Lab4 Suite Teardown
Test Setup       Lab4 Test Setup
Test Teardown    Lab4 Test Teardown

*** Variables ***
${TEST_DATE}            December 26, 2025

*** Test Cases ***
UAT-Lab04-001-TC01: Open Workshop Registration Page
    [Documentation]    Test Case 1: เปิดเว็บไซต์ Workshop Registration
    ...                Expected Result: แสดงหน้า Workshop Registration
    ...                
    ...                Test Steps:
    ...                1. เปิดเว็บไซต์ http://localhost:7272/Lab4/Registration.html
    ...                
    ...                Expected Result:
    ...                - แสดงหน้า Workshop Registration
    ...                - มีฟอร์มสำหรับกรอกข้อมูล First Name, Last Name, Organization, Email, Phone No.
    ...                - มีปุ่ม Register
    [Tags]    UAT-Lab04-001    Positive    Navigation    Critical
    # Test Setup already navigates to the page
    Page Should Contain    Workshop Registration
    Page Should Contain Element    ${FIRSTNAME_FIELD}
    Page Should Contain Element    ${LASTNAME_FIELD}
    Page Should Contain Element    ${ORGANIZATION_FIELD}
    Page Should Contain Element    ${EMAIL_FIELD}
    Page Should Contain Element    ${PHONE_FIELD}
    Page Should Contain Element    ${REGISTER_BUTTON}
    Location Should Contain    Lab4/Registration.html
    Log    Successfully opened Workshop Registration page

UAT-Lab04-001-TC02: Register Success With Organization Info
    [Documentation]    Test Case 2: ลงทะเบียนสำเร็จพร้อมข้อมูลองค์กร
    ...                Expected Result: แสดงหน้า Success.html
    ...                
    ...                Test Steps:
    ...                1. กรอกข้อมูลที่ช่อง First Name = "Somyod"
    ...                2. กรอกข้อมูลที่ช่อง Last Name = "Sodsai"
    ...                3. กรอกข้อมูลที่ช่อง Organization = "CS KKU"
    ...                4. กรอกข้อมูลที่ช่อง Email = "somyod@kkumail.com"
    ...                5. กรอกข้อมูลที่ช่อง Phone No. = "091-001-1234"
    ...                6. กดปุ่ม "Register"
    ...                
    ...                Expected Result:
    ...                - แสดงหน้า Success.html
    ...                - Title เป็น "Success"
    ...                - แสดงข้อความ "Thank you for registering with us."
    ...                - แสดงข้อความ "We will send a confirmation to your email soon."
    [Tags]    UAT-Lab04-001    Positive    Success    Critical
    # Step 1-5: Fill all form fields with valid data
    Fill Lab4 Complete Registration Form    
    ...    firstname=Somyod    
    ...    lastname=Sodsai    
    ...    organization=CS KKU    
    ...    email=somyod@kkumail.com    
    ...    phone=091-001-1234
    
    # Step 6: Click Register button
    Submit Lab4 Registration Form
    
    # Verify Expected Result
    Verify Lab4 Success Page
    Log    TC02 PASSED: Registration successful with organization info

UAT-Lab04-001-TC03: Register Success Without Organization Info
    [Documentation]    Test Case 3: ลงทะเบียนสำเร็จโดยไม่มีข้อมูลองค์กร
    ...                Expected Result: แสดงหน้า Success.html
    ...                
    ...                Test Steps:
    ...                1. กรอกข้อมูลที่ช่อง First Name = "Somyod"
    ...                2. กรอกข้อมูลที่ช่อง Last Name = "Sodsai"
    ...                3. กรอกข้อมูลที่ช่อง Email = "somyod@kkumail.com"
    ...                4. กรอกข้อมูลที่ช่อง Phone No. = "091-001-1234"
    ...                5. กดปุ่ม "Register"
    ...                
    ...                Expected Result:
    ...                - แสดงหน้า Success.html
    ...                - Title เป็น "Success"
    ...                - แสดงข้อความ "Thank you for registering with us."
    ...                - แสดงข้อความ "We will send a confirmation to your email soon."
    [Tags]    UAT-Lab04-001    Positive    Success    Critical
    # Step 1-4: Fill form fields without organization
    Fill Lab4 Registration Form Without Organization    
    ...    firstname=Somyod    
    ...    lastname=Sodsai    
    ...    email=somyod@kkumail.com    
    ...    phone=091-001-1234
    
    # Step 5: Click Register button
    Submit Lab4 Registration Form
    
    # Verify Expected Result
    Verify Lab4 Success Page
    Log    TC03 PASSED: Registration successful without organization info

UAT-Lab04-001-TC04: Valid Phone Format With Dash
    [Documentation]    Test Case 4: ทดสอบรูปแบบเบอร์โทรศัพท์ที่ถูกต้องแบบ XXX-XXX-XXXX
    ...                Expected Result: ลงทะเบียนสำเร็จ
    ...                
    ...                Test Steps:
    ...                1. กรอกข้อมูลที่ช่อง First Name = "Somyod"
    ...                2. กรอกข้อมูลที่ช่อง Last Name = "Sodsai"
    ...                3. กรอกข้อมูลที่ช่อง Organization = "CS KKU"
    ...                4. กรอกข้อมูลที่ช่อง Email = "somyod@kkumail.com"
    ...                5. กรอกข้อมูลที่ช่อง Phone No. = "091-001-1234" (format: XXX-XXX-XXXX)
    ...                6. กดปุ่ม "Register"
    ...                
    ...                Expected Result:
    ...                - ลงทะเบียนสำเร็จและแสดงหน้า Success.html
    [Tags]    UAT-Lab04-001    Positive    PhoneFormat    Normal
    Fill Lab4 Complete Registration Form    phone=091-001-1234
    Submit Lab4 Registration Form
    Verify Lab4 Success Page
    Log    TC04 PASSED: Phone format with dash accepted

UAT-Lab04-001-TC05: Valid Phone Format With Dot
    [Documentation]    Test Case 5: ทดสอบรูปแบบเบอร์โทรศัพท์ที่ถูกต้องแบบ XXX.XXX.XXXX
    ...                Expected Result: ลงทะเบียนสำเร็จ
    ...                
    ...                Test Steps:
    ...                1. กรอกข้อมูลที่ช่อง First Name = "Somyod"
    ...                2. กรอกข้อมูลที่ช่อง Last Name = "Sodsai"
    ...                3. กรอกข้อมูลที่ช่อง Organization = "CS KKU"
    ...                4. กรอกข้อมูลที่ช่อง Email = "somyod@kkumail.com"
    ...                5. กรอกข้อมูลที่ช่อง Phone No. = "091.001.1234" (format: XXX.XXX.XXXX)
    ...                6. กดปุ่ม "Register"
    ...                
    ...                Expected Result:
    ...                - ลงทะเบียนสำเร็จและแสดงหน้า Success.html
    [Tags]    UAT-Lab04-001    Positive    PhoneFormat    Normal
    Fill Lab4 Complete Registration Form    phone=091.001.1234
    Submit Lab4 Registration Form
    Verify Lab4 Success Page
    Log    TC05 PASSED: Phone format with dot accepted

UAT-Lab04-001-TC06: Valid Phone Format With Space
    [Documentation]    Test Case 6: ทดสอบรูปแบบเบอร์โทรศัพท์ที่ถูกต้องแบบ XXX XXX XXXX
    ...                Expected Result: ลงทะเบียนสำเร็จ
    ...                
    ...                Test Steps:
    ...                1. กรอกข้อมูลที่ช่อง First Name = "Somyod"
    ...                2. กรอกข้อมูลที่ช่อง Last Name = "Sodsai"
    ...                3. กรอกข้อมูลที่ช่อง Organization = "CS KKU"
    ...                4. กรอกข้อมูลที่ช่อง Email = "somyod@kkumail.com"
    ...                5. กรอกข้อมูลที่ช่อง Phone No. = "091 001 1234" (format: XXX XXX XXXX)
    ...                6. กดปุ่ม "Register"
    ...                
    ...                Expected Result:
    ...                - ลงทะเบียนสำเร็จและแสดงหน้า Success.html
    [Tags]    UAT-Lab04-001    Positive    PhoneFormat    Normal
    Fill Lab4 Complete Registration Form    phone=091 001 1234
    Submit Lab4 Registration Form
    Verify Lab4 Success Page
    Log    TC06 PASSED: Phone format with space accepted

*** Keywords ***
