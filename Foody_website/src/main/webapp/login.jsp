<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f0f8ff;
            background-image: url('download.jpg');
            background-size: cover;
            background-position: center;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        header {
            background-color: #ff6347;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: white;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: 100%;
            position: absolute;
            top: 0;
            left: 0;
        }

        header .logo h1 {
            margin: 0;
            font-size: 36px;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.6);
        }

        header nav ul {
            list-style: none;
            display: flex;
            gap: 20px;
            margin: 0;
            padding: 0;
        }

        header nav ul li {
            margin: 0;
        }

        header nav ul li a {
            color: white;
            text-decoration: none;
            font-size: 16px;
            transition: color 0.3s;
        }

        header nav ul li a:hover {
            color: #e8f5e9;
        }

        .container {
            max-width: 400px;
            width: 100%;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .form-container {
            width: 100%;
        }

        .form-container h1 {
            font-size: 2em;
            margin-bottom: 20px;
            color: #333;
        }

        .form-container label {
            font-size: 1.2em;
            color: #333;
            margin-bottom: 10px;
            display: block;
            text-align: left;
        }

        .form-container input[type="email"],
        .form-container input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1em;
        }

        .form-container .forgot-password {
            display: block;
            margin-bottom: 20px;
            font-size: 0.9em;
            color: #007BFF;
            text-decoration: none;
            text-align: right;
            transition: color 0.3s ease;
        }

        .form-container .forgot-password:hover {
            color: #0056b3;
        }

        .form-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1.2em;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-container input[type="submit"]:hover {
            background-color: #0056b3;
        }


    </style>
</head>
<body>
<header>
    <div class="logo">
        <h1>Foody</h1>
    </div>
    <nav>
        <ul>
            <li><a href="home.jsp">Home</a></li>
            <li><a href="register.jsp">Register</a></li>
            <li><a href="helpLine.jsp">Help</a></li>
        </ul>
    </nav>
</header>

<div class="container">
    <div class="form-container">
        <h1>Login Form</h1>
        <form action="emailCheck" method="post">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>
            <a href="forgetPassword.jsp" class="forgot-password">Forgot Password?</a>
            <input type="submit" value="Login">
        </form>
    </div>
</div>
</body>
</html>
