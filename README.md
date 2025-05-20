# 🌐 Employee Management System – Web Version

## 📄 Description
A web-based Employee Management System developed using Java Servlets, JSP, and MySQL. This system allows HR/Admin users to manage employee records, attendance, and salary details through a clean and responsive web interface.

> ✅ **Note:** This web application shares the same MySQL database (`loginform`) as the desktop version of the Employee Management System. Both applications are fully compatible with each other, allowing seamless switching between desktop and web interfaces.

## ✨ Features
- Admin Login (validated using database credentials)
- Add/Search/Delete/Update Employee records
- Attendance marking with validation (no duplicate entries per day)
- Automatic salary calculation based on attendance and hire date
- User feedback via styled popups and redirection
- QR/Face recognition ready (integration support for future enhancements)

## 🛠 Technologies Used
- Java (Servlets, JSP)
- HTML, CSS, JavaScript
- MySQL Database
- JDBC (for DB connectivity)
- NetBeans IDE
- Apache Tomcat (recommended for deployment)

## 🚀 How to Run

### 🖥 Prerequisites:
- Java JDK installed
- Apache Tomcat server
- MySQL server running with a database named `loginform`
- NetBeans IDE (recommended)

### ⚙️ Steps:
1. Clone or download this repository.
2. Import the project into **NetBeans** or your preferred Java IDE.
3. Ensure your MySQL database `loginform` is set up with the necessary table:
   - Table: `employeedetails`
   - Columns: `eName`, `eAge`, `eEmailid`, `eJobPost`, `eEmployeeId`, `eFathersName`, `eMobileNumber`, `eQualification`, `eCitizenshipNumber`, `hiredate`, `attendence`, `salary`
4. Update your DB credentials in the backend files (`LoginServlet.java`, etc.).
5. Build and deploy the project on **Apache Tomcat** via NetBeans.
6. Visit `http://localhost:8080/YourProjectName/loginform.html` to begin.

## 🔁 Compatibility with Desktop Version
- ✅ Uses the **same MySQL database (`loginform`)**.
- ✅ Employee records, attendance, and salary data stay **synced**.
- ✅ Useful for environments with both **web and desktop clients**.

## 📸 Screenshots
![image](https://github.com/user-attachments/assets/9894878c-d5cf-40cc-8c31-7a97143bace1)
![image](https://github.com/user-attachments/assets/c51388c0-3c2b-4b74-a520-4f24e6cce4aa)
![image](https://github.com/user-attachments/assets/facef1b0-7fc9-4068-a27b-85a8a92574e1)
![image](https://github.com/user-attachments/assets/1a7f51b8-f8cf-4530-8762-40a49cd9f0b5)
![image](https://github.com/user-attachments/assets/205e56ca-a3e1-43b6-ab10-4dfe5f0fe6c1)
![image](https://github.com/user-attachments/assets/07401064-ca12-44d2-aa4e-03f9e41f9f06)
![image](https://github.com/user-attachments/assets/7fcc2289-6800-4619-8114-83af0db73622)








## 🧩 Future Enhancements
- Face recognition-based attendance (Python integration)
- QR Code generation for employee check-in/out
- Role-based access (Admin vs HR users)

## 👨‍💻 Author
[Aamir Chaudhary](https://github.com/Aamir-Chaudhary)


---
> 📢 If you find this project useful or would like to contribute, feel free to fork it and star ⭐ the repo!
