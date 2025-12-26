# Lab4 Workshop Registration - Test Automation

## 📋 Overview
Complete test automation for **Lab4 Workshop Registration** using Robot Framework and Chrome browser.

## 🎯 Test Scenarios

### UAT-Lab04-001: ลงทะเบียนเข้าร่วมอบรมเชิงปฏิบัติการสำเร็จ
✅ **6 Test Cases** covering successful registration scenarios
- Register with organization info
- Register without organization info  
- Valid phone formats (dash, dot, space)

### UAT-Lab04-002: ลงทะเบียนเข้าร่วมอบรมเชิงปฏิบัติการไม่สำเร็จ
❌ **10 Test Cases** covering validation and error scenarios
- Empty field validations
- Invalid phone number formats
- Error message verification

## 🚀 Quick Start

### 1️⃣ Start Test Server
```bash
./start_server.sh
```

### 2️⃣ Run Tests
```bash
# Run all Lab4 tests
./run_lab4_tests.sh all

# Run only valid tests
./run_lab4_tests.sh valid

# Run only invalid tests
./run_lab4_tests.sh invalid
```

### 3️⃣ View Reports
```bash
open test_results/lab4/report.html
```

### 4️⃣ Stop Server
```bash
./stop_server.sh
```

## 📦 Prerequisites

### Required Software:
- ✅ Python 3.x
- ✅ Robot Framework
- ✅ SeleniumLibrary
- ✅ Chrome Browser
- ✅ ChromeDriver

### Installation:
```bash
pip install robotframework
pip install robotframework-seleniumlibrary
```

## 📁 File Structure
```
TestAutomationLab/
├── Lab4/
│   ├── Registration.html      # Workshop registration page
│   └── Success.html           # Success page
├── config.robot               # Configuration & variables
├── lab4_keywords.robot        # Lab4-specific keywords
├── lab4_valid.robot          # Valid test cases (UAT-Lab04-001)
├── lab4_invalid.robot        # Invalid test cases (UAT-Lab04-002)
├── run_lab4_tests.sh         # Test runner script
├── start_server.sh           # Start test server
├── stop_server.sh            # Stop test server
└── LAB4_TEST_SUMMARY.md      # Detailed documentation
```

## 🧪 Test Execution Options

### Run Specific Test Case:
```bash
robot --test "UAT-Lab04-001-TC02" lab4_valid.robot
```

### Run by Tag:
```bash
# Run all critical tests
robot --include Critical lab4_valid.robot

# Run all negative tests
robot --include Negative lab4_invalid.robot

# Run specific scenario
robot --include UAT-Lab04-001 lab4_valid.robot
```

### Custom Output Directory:
```bash
robot --outputdir custom_results lab4_valid.robot
```

### Debug Mode:
```bash
robot --loglevel DEBUG lab4_valid.robot
```

## 📊 Test Reports

After execution, find reports in `test_results/lab4/`:
- **report.html** - Summary test report with pass/fail statistics
- **log.html** - Detailed execution log with screenshots
- **output.xml** - Machine-readable results for CI/CD

## ✅ Test Coverage

### Valid Scenarios (6 test cases):
1. ✅ Open registration page
2. ✅ Register with organization
3. ✅ Register without organization
4. ✅ Phone format: 091-001-1234
5. ✅ Phone format: 091.001.1234
6. ✅ Phone format: 091 001 1234

### Invalid Scenarios (10 test cases):
1. ❌ Open registration page
2. ❌ Empty first name
3. ❌ Empty last name
4. ❌ Empty first & last name
5. ❌ Empty email
6. ❌ Empty phone
7. ❌ Invalid phone (1234)
8. ❌ Phone with letters
9. ❌ Phone too short
10. ❌ Phone with special chars

## 🏷️ Available Tags

- `UAT-Lab04-001` - Valid registration tests
- `UAT-Lab04-002` - Invalid registration tests
- `Positive` - Positive test cases
- `Negative` - Negative test cases
- `Critical` - Critical priority
- `Normal` - Normal priority
- `Validation` - Field validation tests
- `PhoneFormat` - Phone format tests
- `PhoneValidation` - Phone validation tests

## 🎯 Test Data

### Valid Data:
```
First Name: Somyod
Last Name: Sodsai
Organization: CS KKU (optional)
Email: somyod@kkumail.com
Phone: 091-001-1234 (or 091.001.1234 or 091 001 1234)
```

### Expected Error Messages:
- `*Please enter your name!!`
- `*Please enter your first name!!`
- `*Please enter your last name!!`
- `*Please enter your email!!`
- `*Please enter your phone number!!`
- `Please enter a valid phone number!!`

## 🌐 Test URLs
- **Registration**: http://localhost:7272/Lab4/Registration.html
- **Success**: http://localhost:7272/Lab4/Success.html

## 🔍 Troubleshooting

### Server not running:
```bash
./start_server.sh
```

### Chrome/ChromeDriver issues:
```bash
# Install/update ChromeDriver
brew install --cask chromedriver
```

### Python dependencies:
```bash
pip install -r requirements.txt
```

### Port 7272 already in use:
```bash
lsof -ti:7272 | xargs kill -9
./start_server.sh
```

## 📖 Documentation
See [LAB4_TEST_SUMMARY.md](LAB4_TEST_SUMMARY.md) for detailed test documentation.

## 🎓 Usage Examples

### Example 1: Run and open report
```bash
./run_lab4_tests.sh all && open test_results/lab4/report.html
```

### Example 2: Run only critical tests
```bash
robot --include Critical --outputdir test_results/lab4 lab4_valid.robot lab4_invalid.robot
```

### Example 3: Run specific scenario
```bash
robot --include UAT-Lab04-001 lab4_valid.robot
```

## 📝 Notes
- Tests use Chrome browser (maximized window)
- Automatic screenshots on test failure
- Independent test cases (can run in any order)
- Detailed logging and documentation
- Full compliance with test scenario requirements

---
**Created**: December 26, 2025  
**Version**: 1.0  
**Browser**: Chrome  
**Framework**: Robot Framework + SeleniumLibrary
