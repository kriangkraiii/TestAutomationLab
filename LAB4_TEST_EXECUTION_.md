# Lab4 Test Execution Report 

## Test Scenario ID: UAT-Lab04-001
**Test Scenario Name**: ลงทะเบียนเข้าร่วมอบรมเชิงปฏิบัติการสำเร็จ  
**Date of Test**: December 26, 2025  
**Tested by**: เกรียงไกร ประเสริฐ

---

### Test Case 1: Open Workshop Registration Page

| No. | Test Case and Steps | Expected Result | Actual Result | Test Result | Remark |
|-----|---------------------|-----------------|---------------|-------------|---------|
| 1 | เปิดเว็บไซต์ http://localhost:7272/Lab4/Registration.html | แสดงหน้า Workshop Registration | แสดงหน้า Workshop Registration พร้อมฟอร์มกรอกข้อมูลครบถ้วน | **PASS** | - |

---

### Test Case 2: Register Success

| No. | Test Case and Steps | Expected Result | Actual Result | Test Result | Remark |
|-----|---------------------|-----------------|---------------|-------------|---------|
| 1 | เปิดเว็บไซต์ http://localhost:7272/Lab4/Registration.html | แสดงหน้า Workshop Registration | แสดงหน้า Workshop Registration ตามที่คาดหวัง | **PASS** | - |
| 2 | Register Success:<br/>1. First Name = "Somyod"<br/>2. Last Name = "Sodsai"<br/>3. Organization = "CS KKU"<br/>4. Email = "somyod@kkumail.com"<br/>5. Phone = "091-001-1234"<br/>6. กดปุ่ม "Register" | แสดงหน้า Success.html โดยมี:<br/>- Title เป็น "Success"<br/>- ข้อความ "Thank you for registering with us."<br/>- ข้อความ "We will send a confirmation to your email soon." | แสดงหน้า Success.html ตรงตามที่คาดหวัง:<br/>✓ Title = "Success"<br/>✓ ข้อความแสดงครบถ้วน<br/>✓ Redirect สำเร็จ | **PASS** | - |

---

### Test Case 3: Register Success No Organization Info

| No. | Test Case and Steps | Expected Result | Actual Result | Test Result | Remark |
|-----|---------------------|-----------------|---------------|-------------|---------|
| 1 | เปิดเว็บไซต์ http://localhost:7272/Lab4/Registration.html | แสดงหน้า Workshop Registration | แสดงหน้า Workshop Registration | **PASS** | - |
| 2 | Register Success No Organization:<br/>1. First Name = "Somyod"<br/>2. Last Name = "Sodsai"<br/>3. Email = "somyod@kkumail.com"<br/>4. Phone = "091-001-1234"<br/>5. กดปุ่ม "Register"<br/>(ไม่กรอก Organization) | แสดงหน้า Success.html โดยมี:<br/>- Title เป็น "Success"<br/>- ข้อความต่างๆ ครบถ้วน | ลงทะเบียนสำเร็จโดยไม่กรอก Organization<br/>แสดงหน้า Success.html ถูกต้องครบถ้วน | **PASS** | ช่อง Organization เป็น optional |

---

## Test Scenario ID: UAT-Lab04-002
**Test Scenario Name**: ลงทะเบียนเข้าร่วมอบรมเชิงปฏิบัติการไม่สำเร็จ  
**Date of Test**: December 26, 2025  
**Tested by**: เกรียงไกร ประเสริฐ

---

### Test Case 1: Empty First Name

| No. | Test Case and Steps | Expected Result | Actual Result | Test Result | Remark |
|-----|---------------------|-----------------|---------------|-------------|---------|
| 1 | เปิดเว็บไซต์ http://localhost:7272/Lab4/Registration.html | แสดงหน้า Workshop Registration | แสดงหน้า Workshop Registration | **PASS** | - |
| 2 | Empty First Name:<br/>1. Last Name = "Sodyod"<br/>2. Organization = "CS KKU"<br/>3. Email = "somyod@kkumail.com"<br/>4. Phone = "091-001-1234"<br/>5. กดปุ่ม "Register"<br/>(ไม่กรอก First Name) | อยู่ที่หน้า Workshop Registration เช่นเดิม<br/>แสดงข้อความ:<br/>"*Please enter your first name!!" | ✓ ยังอยู่ที่หน้า Registration<br/>✓ แสดงข้อความ "*Please enter your first name!!"<br/>✓ ไม่มีการ redirect<br/>✓ ข้อมูลในฟอร์มยังคงอยู่ | **PASS** | ข้อความ error แสดงสีแดงตรง #errors |

---

### Test Case 2: Empty Last Name

| No. | Test Case and Steps | Expected Result | Actual Result | Test Result | Remark |
|-----|---------------------|-----------------|---------------|-------------|---------|
| 1 | เปิดเว็บไซต์ http://localhost:7272/Lab4/Registration.html | แสดงหน้า Workshop Registration | แสดงหน้า Workshop Registration | **PASS** | - |
| 2 | Empty Last Name:<br/>1. First Name = "Somyod"<br/>2. Organization = "CS KKU"<br/>3. Email = "somyod@kkumail.com"<br/>4. Phone = "091-001-1234"<br/>5. กดปุ่ม "Register"<br/>(ไม่กรอก Last Name) | อยู่ที่หน้า Workshop Registration เช่นเดิม<br/>แสดงข้อความ:<br/>"*Please enter your last name!!" | แสดงข้อความ validation ถูกต้อง:<br/>"*Please enter your last name!!"<br/>ยังคงอยู่ที่หน้า Registration | **PASS** | - |

---

### Test Case 3: Empty First Name and Last Name

| No. | Test Case and Steps | Expected Result | Actual Result | Test Result | Remark |
|-----|---------------------|-----------------|---------------|-------------|---------|
| 1 | เปิดเว็บไซต์ http://localhost:7272/Lab4/Registration.html | แสดงหน้า Workshop Registration | แสดงหน้า Workshop Registration | **PASS** | - |
| 2 | Empty First & Last Name:<br/>1. Organization = "CS KKU"<br/>2. Email = "somyod@kkumail.com"<br/>3. Phone = "091-001-1234"<br/>4. กดปุ่ม "Register"<br/>(ไม่กรอกทั้ง First Name และ Last Name) | อยู่ที่หน้า Workshop Registration เช่นเดิม<br/>แสดงข้อความ:<br/>"*Please enter your name!!" | Validation ทำงานถูกต้อง<br/>แสดงข้อความ "*Please enter your name!!"<br/>Form ไม่ถูก submit | **PASS** | ตรวจสอบทั้ง 2 field ว่าง |

---

### Test Case 4: Empty Email

| No. | Test Case and Steps | Expected Result | Actual Result | Test Result | Remark |
|-----|---------------------|-----------------|---------------|-------------|---------|
| 1 | เปิดเว็บไซต์ http://localhost:7272/Lab4/Registration.html | แสดงหน้า Workshop Registration | แสดงหน้า Workshop Registration | **PASS** | - |
| 2 | Empty Email:<br/>1. First Name = "Somyod"<br/>2. Last Name = "Sodsai"<br/>3. Organization = "CS KKU"<br/>4. Phone = "091-001-1234"<br/>5. กดปุ่ม "Register"<br/>(ไม่กรอก Email) | อยู่ที่หน้า Workshop Registration เช่นเดิม<br/>แสดงข้อความ:<br/>"*Please enter your email!!" | แสดงข้อความ error ถูกต้อง:<br/>"*Please enter your email!!"<br/>ยังคงอยู่ที่หน้าเดิม | **PASS** | - |

---

### Test Case 5: Empty Phone Number

| No. | Test Case and Steps | Expected Result | Actual Result | Test Result | Remark |
|-----|---------------------|-----------------|---------------|-------------|---------|
| 1 | เปิดเว็บไซต์ http://localhost:7272/Lab4/Registration.html | แสดงหน้า Workshop Registration | แสดงหน้า Workshop Registration | **PASS** | - |
| 2 | Empty Phone Number:<br/>1. First Name = "Somyod"<br/>2. Last Name = "Sodsai"<br/>3. Organization = "CS KKU"<br/>4. Email = "somyod@kkumail.com"<br/>5. กดปุ่ม "Register"<br/>(ไม่กรอก Phone) | อยู่ที่หน้า Workshop Registration เช่นเดิม<br/>แสดงข้อความ:<br/>"*Please enter your phone number!!" | Validation ทำงานถูกต้อง<br/>แสดงข้อความ "*Please enter your phone number!!"<br/>ไม่ redirect ไปหน้า Success | **PASS** | - |

---

### Test Case 6: Invalid Phone Number

| No. | Test Case and Steps | Expected Result | Actual Result | Test Result | Remark |
|-----|---------------------|-----------------|---------------|-------------|---------|
| 1 | เปิดเว็บไซต์ http://localhost:7272/Lab4/Registration.html | แสดงหน้า Workshop Registration | แสดงหน้า Workshop Registration | **PASS** | - |
| 2 | Invalid Phone Number:<br/>1. First Name = "Somyod"<br/>2. Last Name = "Sodsai"<br/>3. Organization = "CS KKU"<br/>4. Email = "somyod@kkumail.com"<br/>5. Phone = "1234"<br/>6. กดปุ่ม "Register" | อยู่ที่หน้า Workshop Registration เช่นเดิม<br/>แสดงข้อความ:<br/>"Please enter a valid phone number!!" | Phone validation ทำงานถูกต้อง<br/>แสดงข้อความ "Please enter a valid phone number!!"<br/>เบอร์สั้นเกินไปถูก reject | **PASS** | Pattern: XXX-XXX-XXXX required |

---

## 📊 Test Summary Report

| Scenario ID | Scenario Name | Test Case# | Pass | Fail | No run | Block | Remark | Defect ID |
|-------------|---------------|------------|------|------|--------|-------|--------|-----------|
| UAT-Lab04-001 | ลงทะเบียนเข้าร่วมอบรมเชิงปฏิบัติการสำเร็จ | 6 | 6 | 0 | 0 | 0 | All test cases passed | - |
| UAT-Lab04-002 | ลงทะเบียนเข้าร่วมอบรมเชิงปฏิบัติการไม่สำเร็จ | 10 | 10 | 0 | 0 | 0 | All validation working correctly | - |
| **รวม** | | **16** | **16** | **0** | **0** | **0** | **100% Pass Rate** | - |

---




**Test Execution Date**: December 26, 2025  
**Browser**: Chrome (Latest)  
**Test Environment**: http://localhost:7272  
**Tester**: เกรียงไกร ประเสริฐ
