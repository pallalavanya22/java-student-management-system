<%@ page import="java.util.List" %>
<%@ page import="com.example.student.Model.Student" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Management System</title>

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f4f7fb;
            color: #1e293b;
        }

        /* ---------- HEADER ---------- */

        .header {
            background: linear-gradient(135deg, #2563eb, #4f46e5);
            color: white;
            padding: 30px 60px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.12);
        }

        .header h1 {
            font-size: 30px;
            margin-bottom: 7px;
        }
        .header p {
            font-size: 15px;
            opacity: 0.9;
        }
        /* ---------- MAIN ---------- */
        .container {
            width: 90%;
            max-width: 1100px;
            margin: 35px auto;
        }
        /* ---------- CARD ---------- */
        .card {
            background: white;
            padding: 30px;
            margin-bottom: 30px;
            border-radius: 16px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }
        .card-title {
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 25px;
            color: #1e293b;
        }
        /* ---------- FORM ---------- */
        .form-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }
        .form-group {
            display: flex;
            flex-direction: column;
        }
        .form-group label {
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 8px;
            color: #475569;
        }
        .form-group input {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            font-size: 14px;
            outline: none;
            transition: 0.2s;
        }

        .form-group input:focus {
            border-color: #4f46e5;
            box-shadow: 0 0 0 3px rgba(79,70,229,0.12);
        }

        /* ---------- REGISTER BUTTON ---------- */

        .button-container {
            margin-top: 22px;
        }
        .register-btn {
            background: #4f46e5;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 8px;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.2s;
        }
        .register-btn:hover {
            background: #3730a3;
            transform: translateY(-1px);
        }
        /* ---------- TABLE ---------- */
        .table-container {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        thead {
            background: #eef2ff;
        }

        th {
            padding: 15px;
            text-align: left;
            color: #3730a3;
            font-size: 14px;
        }

        td {
            padding: 15px;
            border-bottom: 1px solid #e2e8f0;
            font-size: 14px;
        }

        tbody tr:hover {
            background: #f8fafc;
        }

        /* ---------- ID BADGE ---------- */

        .id-badge {
            display: inline-block;
            background: #e0e7ff;
            color: #3730a3;
            padding: 5px 11px;
            border-radius: 20px;
            font-weight: bold;
            font-size: 12px;
        }

        /* ---------- EMPTY MESSAGE ---------- */

        .empty {
            text-align: center;
            padding: 30px;
            color: #64748b;
        }

        /* ---------- RESPONSIVE ---------- */

        @media (max-width: 800px) {

            .header {
                padding: 25px;
            }

            .container {
                width: 95%;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }

            .card {
                padding: 20px;
            }

            .header h1 {
                font-size: 24px;
            }
        }

    </style>
</head>

<body>

<!-- ================= HEADER ================= -->

<div class="header">

    <h1>Student Management System</h1>

    <p>
        Register and manage student records
    </p>

</div>
<!-- ================= MAIN CONTAINER ================= -->

<div class="container">

   <!-- ================= REGISTER STUDENT ================= -->

    <div class="card">

        <div class="card-title">
            Register New Student
        </div>

        <form action="students" method="POST">
            <div class="form-grid">

                <!-- ID -->

                <div class="form-group">

                    <label for="id">
                        Student ID
                    </label>

                    <input
                            type="number"
                            id="id"
                            name="id"
                            placeholder="Enter student ID"
                            required
                    >

                </div>


                <!-- NAME -->

                <div class="form-group">

                    <label for="name">
                        Student Name
                    </label>

                    <input
                            type="text"
                            id="name"
                            name="name"
                            placeholder="Enter student name"
                            required
                    >

                </div>


                <!-- EMAIL -->

                <div class="form-group">

                    <label for="email">
                        Email Address
                    </label>

                    <input
                            type="email"
                            id="email"
                            name="email"
                            placeholder="Enter email address"
                            required
                    >

                </div>


            </div>


            <div class="button-container">

                <button
                        type="submit"
                        class="register-btn">

                    + Register Student

                </button>

            </div>


        </form>

    </div>


    <!-- ================= STUDENT LIST ================= -->

    <div class="card">

        <div class="card-title">
            Registered Students
        </div>


        <div class="table-container">

            <table>

                <thead>

                <tr>

                    <th>
                        ID
                    </th>

                    <th>
                        Student Name
                    </th>

                    <th>
                        Email Address
                    </th>

                </tr>

                </thead>


                <tbody>


                <%

                    List<Student> students =
                            (List<Student>)
                                    request.getAttribute("studentList");


                    if (students != null && !students.isEmpty()) {

                        for (Student student : students) {

                %>


                <tr>

                    <td>

                        <span class="id-badge">

                            <%= student.getId() %>

                        </span>

                    </td>


                    <td>

                        <%= student.getName() %>

                    </td>


                    <td>

                        <%= student.getEmail() %>

                    </td>

                </tr>


                <%

                        }

                    } else {

                %>


                <tr>

                    <td
                            colspan="3"
                            class="empty">

                        No students registered yet.

                    </td>

                </tr>


                <%

                    }

                %>


                </tbody>

            </table>

        </div>

    </div>
</div>

</body>

</html>