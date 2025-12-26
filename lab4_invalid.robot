*** Settings ***
Documentation    UAT-Lab04-002: ลงทะเบียนเข้าร่วมอบรมเชิงปฏิบัติการไม่สำเร็จ
...              Project: WEB-Lab04 - เว็บไซต์ Lab 04 Software Engineering
...              Module: Workshop Registration
...              Version: V1.0
...              Test Scenario: เมื่อกรอกชื่อ นามสกุล อีเมล หรือเบอร์โทรศัพท์ไม่ถูกต้อง
...              ระบบจะต้องแสดงข้อความเตือนและแนะนำวิธีการกรอกข้อมูลให้ถูกต้อง
Resource         lab4_keywords.robot
Suite Setup      Lab4 Suite Setup
Suite Teardown   Lab4 Suite Teardown
Test Setup       Lab4 Test Setup
Test Teardown    Lab4 Test Teardown

*** Variables ***
${TEST_DATE}            December 26, 2025

*** Test Cases ***
UAT-Lab04-002-TC01: Open Workshop Registration Page
    [Documentation]    Test Case 1: เปิดเว็บไซต์ Workshop Registration
    ...                Expected Result: แสดงหน้า Workshop Registration
    ...                
    ...                Test Steps:
    ...                1. เปิดเว็บไซต์ http://localhost:7272/Lab4/Registration.html
    ...                
    ...                Expected Result:
    ...                - แสดงหน้า Workshop Registration
    [Tags]    UAT-Lab04-002    Negative    Navigation    Critical
    # Test Setup already navigates to the page
    Page Should Contain    Workshop Registration
    Location Should Contain    Lab4/Registration.html
    Log    Successfully opened Workshop Registration page

UAT-Lab04-002-TC02: Empty First Name
    [Documentation]    Test Case 2: ทดสอบการไม่กรอกชื่อ
    ...                Expected Result: แสดงข้อความเตือน "Please enter your first name!!"
    ...                
    ...                Test Steps:
    ...                1. กรอกข้อมูลที่ช่อง Last Name = "Sodyod"
    ...                2. กรอกข้อมูลที่ช่อง Organization = "CS KKU"
    ...                3. กรอกข้อมูลที่ช่อง Email = "somyod@kkumail.com"
    ...                4. กรอกข้อมูลที่ช่อง Phone No. = "091-001-1234"
    ...                5. กดปุ่ม "Register"
    ...                
    ...                Expected Result:
    ...                - อยู่ที่หน้า Workshop Registration เช่นเดิม
    ...                - มีการแสดงข้อความ "*Please enter your first name!!"
    [Tags]    UAT-Lab04-002    Negative    Validation    Critical
    # Step 1-4: Fill form without First Name
    Fill Lab4 Partial Form    
    ...    lastname=Sodyod    
    ...    organization=CS KKU    
    ...    email=somyod@kkumail.com    
    ...    phone=091-001-1234
    
    # Step 5: Click Register button
    Submit Lab4 Registration Form
    
    # Verify Expected Result
    Verify Lab4 Error Message    ${LAB4_MSG_ENTER_FIRST_NAME}
    Verify Still On Lab4 Registration Page
    Log    TC02 PASSED: Empty first name validation working correctly

UAT-Lab04-002-TC03: Empty Last Name
    [Documentation]    Test Case 3: ทดสอบการไม่กรอกนามสกุล
    ...                Expected Result: แสดงข้อความเตือน "Please enter your last name!!"
    ...                
    ...                Test Steps:
    ...                1. กรอกข้อมูลที่ช่อง First Name = "Somyod"
    ...                2. กรอกข้อมูลที่ช่อง Organization = "CS KKU"
    ...                3. กรอกข้อมูลที่ช่อง Email = "somyod@kkumail.com"
    ...                4. กรอกข้อมูลที่ช่อง Phone No. = "091-001-1234"
    ...                5. กดปุ่ม "Register"
    ...                
    ...                Expected Result:
    ...                - อยู่ที่หน้า Workshop Registration เช่นเดิม
    ...                - มีการแสดงข้อความ "*Please enter your last name!!"
    [Tags]    UAT-Lab04-002    Negative    Validation    Critical
    # Step 1-4: Fill form without Last Name
    Fill Lab4 Partial Form    
    ...    firstname=Somyod    
    ...    organization=CS KKU    
    ...    email=somyod@kkumail.com    
    ...    phone=091-001-1234
    
    # Step 5: Click Register button
    Submit Lab4 Registration Form
    
    # Verify Expected Result
    Verify Lab4 Error Message    ${LAB4_MSG_ENTER_LAST_NAME}
    Verify Still On Lab4 Registration Page
    Log    TC03 PASSED: Empty last name validation working correctly

UAT-Lab04-002-TC04: Empty First Name and Last Name
    [Documentation]    Test Case 4: ทดสอบการไม่กรอกทั้งชื่อและนามสกุล
    ...                Expected Result: แสดงข้อความเตือน "Please enter your name!!"
    ...                
    ...                Test Steps:
    ...                1. กรอกข้อมูลที่ช่อง Organization = "CS KKU"
    ...                2. กรอกข้อมูลที่ช่อง Email = "somyod@kkumail.com"
    ...                3. กรอกข้อมูลที่ช่อง Phone No. = "091-001-1234"
    ...                4. กดปุ่ม "Register"
    ...                
    ...                Expected Result:
    ...                - อยู่ที่หน้า Workshop Registration เช่นเดิม
    ...                - มีการแสดงข้อความ "*Please enter your name!!"
    [Tags]    UAT-Lab04-002    Negative    Validation    Critical
    # Step 1-3: Fill form without First Name and Last Name
    Fill Lab4 Partial Form    
    ...    organization=CS KKU    
    ...    email=somyod@kkumail.com    
    ...    phone=091-001-1234
    
    # Step 4: Click Register button
    Submit Lab4 Registration Form
    
    # Verify Expected Result
    Verify Lab4 Error Message    ${LAB4_MSG_ENTER_NAME}
    Verify Still On Lab4 Registration Page
    Log    TC04 PASSED: Empty name validation working correctly

UAT-Lab04-002-TC05: Empty Email
    [Documentation]    Test Case 5: ทดสอบการไม่กรอกอีเมล
    ...                Expected Result: แสดงข้อความเตือน "Please enter your email!!"
    ...                
    ...                Test Steps:
    ...                1. กรอกข้อมูลที่ช่อง First Name = "Somyod"
    ...                2. กรอกข้อมูลที่ช่อง Last Name = "Sodsai"
    ...                3. กรอกข้อมูลที่ช่อง Organization = "CS KKU"
    ...                4. กรอกข้อมูลที่ช่อง Phone No. = "091-001-1234"
    ...                5. กดปุ่ม "Register"
    ...                
    ...                Expected Result:
    ...                - อยู่ที่หน้า Workshop Registration เช่นเดิม
    ...                - มีการแสดงข้อความ "*Please enter your email!!"
    [Tags]    UAT-Lab04-002    Negative    Validation    Critical
    # Step 1-4: Fill form without Email
    Fill Lab4 Partial Form    
    ...    firstname=Somyod    
    ...    lastname=Sodsai    
    ...    organization=CS KKU    
    ...    phone=091-001-1234
    
    # Step 5: Click Register button
    Submit Lab4 Registration Form
    
    # Verify Expected Result
    Verify Lab4 Error Message    ${LAB4_MSG_ENTER_EMAIL}
    Verify Still On Lab4 Registration Page
    Log    TC05 PASSED: Empty email validation working correctly

UAT-Lab04-002-TC06: Empty Phone Number
    [Documentation]    Test Case 6: ทดสอบการไม่กรอกเบอร์โทรศัพท์
    ...                Expected Result: แสดงข้อความเตือน "Please enter your phone number!!"
    ...                
    ...                Test Steps:
    ...                1. กรอกข้อมูลที่ช่อง First Name = "Somyod"
    ...                2. กรอกข้อมูลที่ช่อง Last Name = "Sodsai"
    ...                3. กรอกข้อมูลที่ช่อง Organization = "CS KKU"
    ...                4. กรอกข้อมูลที่ช่อง Email = "somyod@kkumail.com"
    ...                5. กดปุ่ม "Register"
    ...                
    ...                Expected Result:
    ...                - อยู่ที่หน้า Workshop Registration เช่นเดิม
    ...                - มีการแสดงข้อความ "*Please enter your phone number!!"
    [Tags]    UAT-Lab04-002    Negative    Validation    Critical
    # Step 1-4: Fill form without Phone Number
    Fill Lab4 Partial Form    
    ...    firstname=Somyod    
    ...    lastname=Sodsai    
    ...    organization=CS KKU    
    ...    email=somyod@kkumail.com
    
    # Step 5: Click Register button
    Submit Lab4 Registration Form
    
    # Verify Expected Result
    Verify Lab4 Error Message    ${LAB4_MSG_ENTER_PHONE}
    Verify Still On Lab4 Registration Page
    Log    TC06 PASSED: Empty phone number validation working correctly

UAT-Lab04-002-TC07: Invalid Phone Number
    [Documentation]    Test Case 7: ทดสอบการกรอกเบอร์โทรศัพท์ไม่ถูกต้อง
    ...                Expected Result: แสดงข้อความเตือน "Please enter a valid phone number!!"
    ...                
    ...                Test Steps:
    ...                1. กรอกข้อมูลที่ช่อง First Name = "Somyod"
    ...                2. กรอกข้อมูลที่ช่อง Last Name = "Sodsai"
    ...                3. กรอกข้อมูลที่ช่อง Organization = "CS KKU"
    ...                4. กรอกข้อมูลที่ช่อง Email = "somyod@kkumail.com"
    ...                5. กรอกข้อมูลที่ช่อง Phone No. = "1234"
    ...                6. กดปุ่ม "Register"
    ...                
    ...                Expected Result:
    ...                - อยู่ที่หน้า Workshop Registration เช่นเดิม
    ...                - มีการแสดงข้อความ "Please enter a valid phone number!!"
    [Tags]    UAT-Lab04-002    Negative    Validation    Critical
    # Step 1-5: Fill form with invalid phone number
    Fill Lab4 Complete Registration Form    
    ...    firstname=Somyod    
    ...    lastname=Sodsai    
    ...    organization=CS KKU    
    ...    email=somyod@kkumail.com    
    ...    phone=1234
    
    # Step 6: Click Register button
    Submit Lab4 Registration Form
    
    # Verify Expected Result
    Verify Lab4 Error Message    ${LAB4_MSG_INVALID_PHONE}
    Verify Still On Lab4 Registration Page
    Log    TC07 PASSED: Invalid phone number validation working correctly

UAT-Lab04-002-TC08: Invalid Phone Number With Letters
    [Documentation]    Test Case 8: ทดสอบการกรอกเบอร์โทรศัพท์ที่มีตัวอักษร
    ...                Expected Result: แสดงข้อความเตือน "Please enter a valid phone number!!"
    ...                
    ...                Test Steps:
    ...                1. กรอกข้อมูลครบทุกช่อง
    ...                2. กรอก Phone No. = "abc-def-ghij"
    ...                3. กดปุ่ม "Register"
    ...                
    ...                Expected Result:
    ...                - อยู่ที่หน้า Workshop Registration เช่นเดิม
    ...                - มีการแสดงข้อความเตือนเบอร์โทรศัพท์ไม่ถูกต้อง
    [Tags]    UAT-Lab04-002    Negative    PhoneValidation    Normal
    Fill Lab4 Complete Registration Form    phone=abc-def-ghij
    Submit Lab4 Registration Form
    Verify Lab4 Error Message    ${LAB4_MSG_INVALID_PHONE}
    Verify Still On Lab4 Registration Page
    Log    TC08 PASSED: Phone with letters rejected correctly

UAT-Lab04-002-TC09: Invalid Phone Number Too Short
    [Documentation]    Test Case 9: ทดสอบการกรอกเบอร์โทรศัพท์สั้นเกินไป
    ...                Expected Result: แสดงข้อความเตือน "Please enter a valid phone number!!"
    ...                
    ...                Test Steps:
    ...                1. กรอกข้อมูลครบทุกช่อง
    ...                2. กรอก Phone No. = "123"
    ...                3. กดปุ่ม "Register"
    ...                
    ...                Expected Result:
    ...                - อยู่ที่หน้า Workshop Registration เช่นเดิม
    ...                - มีการแสดงข้อความเตือนเบอร์โทรศัพท์ไม่ถูกต้อง
    [Tags]    UAT-Lab04-002    Negative    PhoneValidation    Normal
    Fill Lab4 Complete Registration Form    phone=123
    Submit Lab4 Registration Form
    Verify Lab4 Error Message    ${LAB4_MSG_INVALID_PHONE}
    Verify Still On Lab4 Registration Page
    Log    TC09 PASSED: Short phone number rejected correctly

UAT-Lab04-002-TC10: Invalid Phone Number With Special Characters
    [Documentation]    Test Case 10: ทดสอบการกรอกเบอร์โทรศัพท์ที่มีอักขระพิเศษที่ไม่อนุญาต
    ...                Expected Result: แสดงข้อความเตือน "Please enter a valid phone number!!"
    ...                
    ...                Test Steps:
    ...                1. กรอกข้อมูลครบทุกช่อง
    ...                2. กรอก Phone No. = "081@001#1234"
    ...                3. กดปุ่ม "Register"
    ...                
    ...                Expected Result:
    ...                - อยู่ที่หน้า Workshop Registration เช่นเดิม
    ...                - มีการแสดงข้อความเตือนเบอร์โทรศัพท์ไม่ถูกต้อง
    [Tags]    UAT-Lab04-002    Negative    PhoneValidation    Normal
    Fill Lab4 Complete Registration Form    phone=081@001#1234
    Submit Lab4 Registration Form
    Verify Lab4 Error Message    ${LAB4_MSG_INVALID_PHONE}
    Verify Still On Lab4 Registration Page
    Log    TC10 PASSED: Phone with special characters rejected correctly

*** Keywords ***
