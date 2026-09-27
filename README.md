# Java Student Management System

A simple Java web application for managing student records using **Jakarta Servlets, JSP, JDBC, and Maven**.

## 🚀 Features

- 🔐 Student login functionality
- 👨‍🎓 Add and manage student records
- 📋 Display student details
- 🗑️ Delete student records
- 🌐 JSP-based web interface
- 🔗 JDBC-based database connectivity
- 📦 Maven project management

## 🛠️ Technologies Used

- **Java**
- **Jakarta Servlets**
- **JSP (JavaServer Pages)**
- **JDBC**
- **Maven**
- **HTML/CSS**
- **Apache Tomcat**
- **IntelliJ IDEA**

## 🎯 Learning Outcomes
Through this project, I practiced:

Java web application development
Servlet request and response handling
JSP-based frontend development
MVC-style project organization
DAO pattern for database operations
JDBC database connectivity
Maven project management
Deploying Java web applications using Tomcat
🔮 Future Enhancements
Student update functionality
Search and filter students
Improved authentication
Input validation
Responsive UI
Database configuration improvements

## 👩‍💻 Author
Lavanya Palla

## 📂 Project Structure

```text
Student
├── src
│   └── main
│       ├── java
│       │   └── com.example.student
│       │       ├── Controller
│       │       │   ├── LoginServlet.java
│       │       │   └── StudentServlet.java
│       │       ├── DAO
│       │       │   └── StudentDAO.java
│       │       ├── Model
│       │       │   └── Student.java
│       │       └── HelloServlet.java
│       │
│       └── webapp
│           ├── WEB-INF
│           │   └── web.xml
│           ├── index.jsp
│           ├── login.jsp
│           └── student-view.jsp
│
├── pom.xml
├── mvnw
├── mvnw.cmd
└── .gitignore
