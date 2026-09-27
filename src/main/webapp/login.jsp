<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Student Management - Login</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #2563eb, #4f46e5);
        }

        .login-container {
            width: 400px;
            background: white;
            padding: 40px;
            border-radius: 18px;
            box-shadow: 0 10px 35px rgba(0, 0, 0, 0.2);
        }

        .logo {
            width: 70px;
            height: 70px;
            margin: 0 auto 20px;
            background: #4f46e5;
            color: white;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 30px;
            font-weight: bold;
        }

        h1 {
            text-align: center;
            color: #1e293b;
            margin-bottom: 8px;
        }

        .subtitle {
            text-align: center;
            color: #64748b;
            margin-bottom: 30px;
            font-size: 14px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #334155;
            font-size: 14px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 13px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            font-size: 14px;
            outline: none;
        }

        input:focus {
            border-color: #4f46e5;
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.12);
        }

        .login-btn {
            width: 100%;
            padding: 13px;
            border: none;
            border-radius: 8px;
            background: #4f46e5;
            color: white;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.2s;
        }

        .login-btn:hover {
            background: #3730a3;
        }

        .footer {
            text-align: center;
            margin-top: 25px;
            font-size: 13px;
            color: #64748b;
        }

        .error {
            background: #fee2e2;
            color: #b91c1c;
            padding: 10px;
            border-radius: 7px;
            margin-bottom: 20px;
            text-align: center;
            font-size: 13px;
        }

    </style>

</head>

<body>

<div class="login-container">

    <div class="logo">
        S
    </div>

    <h1>Welcome Back</h1>

    <p class="subtitle">
        Student Management System
    </p>


    <% if (request.getParameter("error") != null) { %>

        <div class="error">
            Invalid username or password
        </div>

    <% } %>


    <form action="login" method="POST">

        <div class="form-group">

            <label for="username">
                Username
            </label>

            <input
                    type="text"
                    id="username"
                    name="username"
                    placeholder="Enter username"
                    required
            >

        </div>


        <div class="form-group">

            <label for="password">
                Password
            </label>

            <input
                    type="password"
                    id="password"
                    name="password"
                    placeholder="Enter password"
                    required
            >

        </div>


        <button
                type="submit"
                class="login-btn">

            Login

        </button>

    </form>


    <div class="footer">

        Student Management System © 2026

    </div>

</div>

</body>

</html>