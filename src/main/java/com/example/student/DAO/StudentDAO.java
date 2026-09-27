package com.example.student.DAO;

import com.example.student.Model.Student;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {
    private String jdbcURL = "jdbc:h2:mem:testdb;DB_CLOSE_DELAY=-1";
    private String jdbcUsername = "sa";
    private String jdbcPassword = "";

    public StudentDAO() {
        try {
            Class.forName("org.h2.Driver");
            try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
                 Statement stmt = connection.createStatement()) {

                // 1. Create table structure
                stmt.execute("CREATE TABLE IF NOT EXISTS students(id INT PRIMARY KEY, name VARCHAR(50), email VARCHAR(50))");

                // 2. Insert sample rows
//                stmt.execute("INSERT INTO students VALUES (1, 'Alice', 'alice@example.com'), (2, 'Bob', 'bob@example.com')");

                // 📝 ADD THIS PRINT STATEMENT HERE:
                System.out.println("====================================================");
                System.out.println(">>> H2 DATABASE SUCCESS: 'students' table created and seeded! <<<");
                System.out.println("====================================================");

            }
        } catch (ClassNotFoundException | SQLException e) {
            // 📝 ADD THIS ERROR PRINT STATEMENT HERE:
            System.err.println(">>> H2 DATABASE CRASHED: " + e.getMessage());
            e.printStackTrace();
        }
    }


    public void addStudent(Student student) {
        String sql = "INSERT INTO students (id,name,email) VALUES (?, ?, ?)";
        try {
            Class.forName("org.h2.Driver");
            try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
                 PreparedStatement pstmt = connection.prepareStatement(sql)) {
                pstmt.setInt(1, student.getId());
                pstmt.setString(2, student.getName());
                pstmt.setString(3, student.getEmail());
                pstmt.executeUpdate();
                int rows = pstmt.executeUpdate();
                System.out.println(">>> INSERT SUCCESS: " + rows + " row inserted");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Student> getAllStudents() {
        List<Student> students = new ArrayList<>();
        try {
            Class.forName("org.h2.Driver");
            try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
                 Statement stmt = connection.createStatement();
                 ResultSet resultSet = stmt.executeQuery("SELECT * FROM students")) {
                while (resultSet.next()) {
                    students.add(new Student(
                            resultSet.getInt("id"),
                            resultSet.getString("name"),
                            resultSet.getString("email")
                    ));
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return students;
    }
}
