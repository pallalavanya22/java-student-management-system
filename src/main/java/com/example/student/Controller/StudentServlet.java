package com.example.student.Controller;

import com.example.student.DAO.StudentDAO;
import com.example.student.Model.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/students")
public class StudentServlet extends HttpServlet {
    private StudentDAO studentDAO;

    @Override
    public void init() throws ServletException {
        studentDAO = new StudentDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Student> list = studentDAO.getAllStudents();

        // 📝 ADD THIS TRACKING TRACE TO YOUR SERVLET:
        System.out.println(">>> SERVLET CHECK: Total students retrieved from DAO = " + list.size());
        for(Student s : list) {
            System.out.println("Found student: ID=" + s.getId() + ", Name=" + s.getName());
        }

        request.setAttribute("studentList", list);
        request.getRequestDispatcher("student-view.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");

        Student newStudent = new Student(id,name,email);
        studentDAO.addStudent(newStudent);

        response.sendRedirect("students");
    }
}

