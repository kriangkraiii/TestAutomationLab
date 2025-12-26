# Lab4 Test Automation Summary

## Test Overview
- **Project ID**: WEB-Lab-04
- **Project Name**: เว็บไซต์ Lab 04 – Software Engineering
- **Module**: Workshop Registration
- **Version**: V1.0
- **Test Date**: December 26, 2025
- **Browser**: Chrome
- **Base URL**: http://localhost:7272/Lab4/

## Test Scenarios

### UAT-Lab04-001: ลงทะเบียนเข้าร่วมอบรมเชิงปฏิบัติการสำเร็จ
**Test File**: `lab4_valid.robot`
**Description**: เมื่อกรอกชื่อ นามสกุล ต้นสังกัด อีเมล และเบอร์โทรศัพท์ถูกต้อง โดยที่จะกรอกข้อมูลหน่วยงานหรือไม่กรอกก็ได้ เมื่อกดปุ่ม Register ระบบจะแสดงหน้าลงทะเบียนสำเร็จ (Success.html)

**Test Cases**:
1. TC01: Open Workshop Registration Page
2. TC02: Register Success With Organization Info
3. TC03: Register Success Without Organization Info
4. TC04: Valid Phone Format With Dash (091-001-1234)
5. TC05: Valid Phone Format With Dot (091.001.1234)
6. TC06: Valid Phone Format With Space (091 001 1234)

### UAT-Lab04-002: ลงทะเบียนเข้าร่วมอบรมเชิงปฏิบัติการไม่สำเร็จ
**Test File**: `lab4_invalid.robot`
**Description**: เมื่อกรอกชื่อ นามสกุล อีเมล หรือเบอร์โทรศัพท์ไม่ถูกต้อง ระบบจะต้องแสดงข้อความเตือนและแนะนำวิธีการกรอกข้อมูลให้ถูกต้อง

**Test Cases**:
1. TC01: Open Workshop Registration Page
2. TC02: Empty First Name
3. TC03: Empty Last Name
4. TC04: Empty First Name and Last Name
5. TC05: Empty Email
6. TC06: Empty Phone Number
7. TC07: Invalid Phone Number (1234)
8. TC08: Invalid Phone Number With Letters
9. TC09: Invalid Phone Number Too Short
10. TC10: Invalid Phone Number With Special Characters

## Files Created/Modified

### New Files:
1. **lab4_keywords.robot** - Keywords specific for Lab4 testing with Chrome browser
2. **lab4_valid.robot** - Test cases for UAT-Lab04-001 (Success scenarios)
3. **lab4_invalid.robot** - Test cases for UAT-Lab04-002 (Failure scenarios)

### Modified Files:
1. **config.robot** - Added Lab4 configuration variables and Chrome browser settings

## Prerequisites
1. Python 3.x installed
2. Robot Framework installed
3. SeleniumLibrary installed
4. Chrome browser installed
5. ChromeDriver installed and in PATH

## Installation (if needed)
```bash
pip install robotframework
pip install robotframework-seleniumlibrary
pip install webdriver-manager
```

## How to Run Tests

### 1. Start the Test Server
```bash
chmod +x start_server.sh
./start_server.sh
```
The server should start on http://localhost:7272

### 2. Run All Lab4 Tests
```bash
# Run all Lab4 valid tests
robot lab4_valid.robot

# Run all Lab4 invalid tests
robot lab4_invalid.robot

# Run all Lab4 tests together
robot lab4_valid.robot lab4_invalid.robot
```

### 3. Run Specific Test Cases
```bash
# Run by test case ID
robot --test "UAT-Lab04-001-TC02" lab4_valid.robot

# Run by tag
robot --include Critical lab4_valid.robot
robot --include UAT-Lab04-001 lab4_valid.robot
robot --include Negative lab4_invalid.robot
```

### 4. Generate Detailed Reports
```bash
# Run with custom output directory
robot --outputdir results lab4_valid.robot lab4_invalid.robot

# Run with custom log level
robot --loglevel DEBUG lab4_valid.robot
```

### 5. Stop the Test Server
```bash
./stop_server.sh
```

## Test Data

### Valid Test Data:
- **First Name**: Somyod
- **Last Name**: Sodsai
- **Organization**: CS KKU (optional)
- **Email**: somyod@kkumail.com
- **Phone**: 091-001-1234 (also accepts 091.001.1234 or 091 001 1234)

### Invalid Test Data:
- **Phone**: 1234 (too short)
- **Phone**: abc-def-ghij (contains letters)
- **Phone**: 081@001#1234 (invalid special characters)

## Expected Error Messages:
- "*Please enter your name!!" (when both first name and last name are empty)
- "*Please enter your first name!!" (when first name is empty)
- "*Please enter your last name!!" (when last name is empty)
- "*Please enter your email!!" (when email is empty)
- "*Please enter your phone number!!" (when phone is empty)
- "Please enter a valid phone number!!" (when phone format is invalid)

## Test Reports
After running tests, Robot Framework generates:
- **report.html** - High-level test report
- **log.html** - Detailed test execution log
- **output.xml** - Machine-readable test results

## Test Summary Report Template

| Scenario ID | Scenario Name | Test Cases | Pass | Fail | No Run | Block | Remark | Defect ID |
|-------------|---------------|------------|------|------|--------|-------|--------|-----------|
| UAT-Lab04-001 | ลงทะเบียนเข้าร่วมอบรมเชิงปฏิบัติการสำเร็จ | 6 | - | - | - | - | - | - |
| UAT-Lab04-002 | ลงทะเบียนเข้าร่วมอบรมเชิงปฏิบัติการไม่สำเร็จ | 10 | - | - | - | - | - | - |
| **Total** | | **16** | - | - | - | - | - | - |

## Browser Configuration
- **Browser**: Chrome
- **Window**: Maximized
- **Selenium Speed**: 0.2s
- **Implicit Wait**: Configured in keywords

## Key Features
1. ✅ Complete test coverage for all test scenarios
2. ✅ Detailed documentation in each test case
3. ✅ Chrome browser support
4. ✅ Proper test setup and teardown
5. ✅ Screenshot on failure
6. ✅ Clear error messages verification
7. ✅ Form field validation
8. ✅ Success page verification
9. ✅ Phone number format validation (dash, dot, space)
10. ✅ Tag-based test execution support

## Tags Used
- **UAT-Lab04-001** - Valid registration tests
- **UAT-Lab04-002** - Invalid registration tests
- **Positive** - Positive test scenarios
- **Negative** - Negative test scenarios
- **Critical** - Critical test cases
- **Normal** - Normal priority test cases
- **Validation** - Validation test cases
- **PhoneFormat** - Phone format test cases
- **PhoneValidation** - Phone validation test cases

## Notes
- All test cases follow the exact test steps from the test scenario document
- Error messages match exactly with the HTML validation messages
- Tests are designed to be independent and can run in any order
- Each test case includes detailed documentation with test steps and expected results
- The test framework automatically handles browser lifecycle and page navigation
