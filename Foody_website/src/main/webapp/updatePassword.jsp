<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.tap.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Password</title>
    <style>
        :root {
            --primary-color: #4CAF50;
            --secondary-color: #007BFF;
            --text-color: #333;
            --background-color: #f0f8ff;
            --form-background-color: rgba(255, 255, 255, 0.9);
            --input-border-color: #ccc;
            --shadow-color: rgba(0, 0, 0, 0.1);
            --error-background: #f8d7da;
            --error-text: #721c24;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            line-height: 1.5;
        }

        body, html {
            height: 100%;
            font-family: Arial, sans-serif;
            background-color: var(--background-color);
            background-image: url('download.jpg');
            background-size: cover;
            background-position: center;
        }

        header {
            background-color: #ff6347;
            padding: 10px 20px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 8px var(--shadow-color);
        }

        header .logo h1 {
            margin: 0;
            font-size: 1.8em;
            font-weight: bold;
        }

        header nav ul {
            list-style: none;
            display: flex;
            gap: 20px;
        }

        header nav ul li a {
            color: white;
            text-decoration: none;
            font-size: 1em;
            transition: color 0.3s;
        }

        header nav ul li a:hover {
            color: #e8f5e9;
        }

        main {
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 60px);
            padding: 20px;
        }

        .form-container {
            background-color: var(--form-background-color);
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0 4px 8px var(--shadow-color);
            text-align: center;
            max-width: 400px;
            width: 100%;
        }

        .form-container h1 {
            font-size: 2em;
            color: var(--text-color);
            margin-bottom: 20px;
        }

        .form-container label {
            display: block;
            font-size: 1.2em;
            color: var(--text-color);
            margin-bottom: 5px;
        }

        .form-container input[type="email"],
        .form-container input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid var(--input-border-color);
            border-radius: 5px;
            font-size: 1em;
        }

        .form-container input[type="submit"] {
            width: 50%;
            padding: 10px;
            background-color: var(--secondary-color);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 1.2em;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-container input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .error-message {
            background-color: var(--error-background);
            color: var(--error-text);
            border: 1px solid var(--error-text);
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            max-width: 400px;
            width: 100%;
            box-shadow: 0 4px 8px var(--shadow-color);
        }

        .error-message a {
            color: var(--secondary-color);
            text-decoration: none;
            font-weight: bold;
        }

        .error-message a:hover {
            text-decoration: underline;
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
                <li><a href="cart.jsp">Cart</a></li>
                <li><a href="helpLine.jsp">Help</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <%
            User user = (User) session.getAttribute("user");
            if (user != null) {
        %>
        <form action="update" class="form-container" method="post" aria-label="Update Password Form">
            <h1>Update Password</h1>
            <label for="email">Email</label>
            <input type="email" id="email" name="email" value="<%= user.getEmail() %>" readonly>
            <label for="password">Old Password</label>
            <input type="password" id="password" name="password" placeholder="Enter your old password" required>
            <label for="newPassword">New Password</label>
            <input type="password" id="newPassword" name="newPassword" placeholder="Enter your new password" required>
            <input type="submit" value="Update Password">
        </form>
        <% 
            } else { 
        %>
        <div class="form-container error-message">
            <p>You are logged out Already. Please <a href="home.jsp">return to the home page</a> and log in.</p>
        </div>
        <% 
            } 
        %>
    </main>
</body>
</html>
