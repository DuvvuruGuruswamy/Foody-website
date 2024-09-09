<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.tap.daoimplementation.UserImplements" %>
<%@ page import="com.tap.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>User Profile</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f8f8f8;
            color: #333;
            margin-top: 120px; /* Adjusted to avoid overlap with fixed header */
        }

        header {
            background-color: #ff6347;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: white;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
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

        .profile-container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 45%;
            margin: auto;
            transition: box-shadow 0.3s ease;
        }

        .profile-container:hover {
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
        }

        .profile-container h2 {
            text-align: center;
            margin-bottom: 25px;
            font-size: 24px;
            font-weight: 500;
            color: #444;
        }

        .profile-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eaeaea;
        }

        .profile-item label {
            font-weight: 600;
            font-size: 16px;
            color: #555;
            width: 40%;
        }

        .profile-item span {
            font-size: 16px;
            color: #666;
            text-align: right;
            width: 60%;
            word-wrap: break-word;
        }

        .profile-item:last-child {
            margin-bottom: 0;
            border-bottom: none;
        }

        .update-button-container {
            text-align: center;
            margin-top: 20px;
        }

        .update-button, .logout-button {
            display: inline-block;
            width: 200px;
            padding: 12px;
            text-align: center;
            text-decoration: none;
            font-size: 16px;
            font-weight: 600;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            border: none;
            margin: 0.5rem;
        }

        .update-button {
            background-color: #4CAF50;
            color: white;
        }

        .update-button:hover {
            background-color: #45a049;
        }

        .logout-button {
            background-color: #f44336;
            color: white;
        }

        .logout-button:hover {
            background-color: #e53935;
        }

        .error-container {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
            padding: 20px;
            border-radius: 8px;
            width: 45%;
            margin: auto;
            text-align: center;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .error-container a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }

        .error-container a:hover {
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
                <li><a href="orderHistory">Order-History</a></li>
                <li><a href="helpLine.jsp">Help</a></li>
            </ul>
        </nav>
    </header>
    
    <%
        UserImplements userImplements = new UserImplements();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
    %>
    <div class="error-container">
        <p>User not found. Please <a href="home.jsp">log in</a> to access your profile.</p>
    </div>
    <% 
        } else {
    %>
    <div class="profile-container">
        <h2>User Profile</h2>
        <div class="profile-item">
            <label>User ID:</label>
            <span><%= user.getUserId() %></span>
        </div>
        <div class="profile-item">
            <label>Name:</label>
            <span><%= user.getUserName() %></span>
        </div>
        <div class="profile-item">
            <label>Email:</label>
            <span><%= user.getEmail() %></span>
        </div>
        <div class="profile-item">
            <label>Phone Number:</label>
            <span><%= user.getphoneNumber() %></span>
        </div>
        <div class="profile-item">
            <label>Address:</label>
            <span><%= user.getAddress() %></span>
        </div>
        <div class="update-button-container">
            <a href="updatePassword.jsp" class="update-button">Change Password</a>
            <form action="logOut" method="post" style="display: inline;">
                <input type="submit" class="update-button logout-button" value="Log Out">
            </form>
        </div>
    </div>
    <% 
        } 
    %>
</body>
</html>
