<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.tap.daoimplementation.UserImplements" %>
<%@ page import="com.tap.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HelpLine</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        :root {
            --primary-color: #4CAF50;
            --secondary-color: #ff6347;
            --text-color: #333;
            --bg-color: #f8f8f8;
            --header-bg-color: #4CAF50;
            --footer-bg-color: #333;
            --form-bg-color: white;
            --input-border-color: #ddd;
            --shadow-color: rgba(0, 0, 0, 0.1);
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f8f8f8;
            color: #333;
        }

        header {
            background-color: #ff6347;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: white;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
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
        }

        header nav ul li {
            margin-left: 20px;
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


        main {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background: var(--form-bg-color);
            box-shadow: 0 4px 8px var(--shadow-color);
            border-radius: 10px;
            font-size: 16px;
        }

        main h1 {
            margin-bottom: 20px;
            color: var(--secondary-color);
            text-align: center;
            font-size: 2em;
            font-weight: 600;
        }

        .contact-info {
            margin-bottom: 30px;
        }

        .contact-info h2 {
            font-size: 1.5em;
            margin-bottom: 10px;
            color: var(--secondary-color);
            font-weight: 500;
        }

        .contact-info p {
            margin: 5px 0;
        }

        .contact-form {
            margin-top: 20px;
        }

        .contact-form label {
            font-size: 1em;
            margin-bottom: 5px;
            font-weight: 500;
            display: block;
        }

        .contact-form input, .contact-form textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid var(--input-border-color);
            border-radius: 5px;
            margin-bottom: 15px;
            font-size: 1em;
            resize: vertical;
        }

        .contact-form button {
            padding: 10px 20px;
            background-color: var(--secondary-color);
            border: none;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            transition: background-color 0.3s;
        }

        .contact-form button:hover {
            background-color: #ff4500;
        }

        footer {
            background-color: var(--footer-bg-color);
            color: white;
            text-align: center;
            padding: 10px 0;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

 
    </style>
</head>
<body>
    <header>
        <div class="logo">
            <h1>Foody</h1>
        </div>

        <%
        User user = (User) session.getAttribute("user");
        boolean isUserLoggedIn = user != null;

        if (isUserLoggedIn) {
            
        %>
        <nav>
            <ul>
                <li><a href="home.jsp">Home</a></li>
                <li><a href="cart.jsp">Cart</a></li>
                <li><a href="profile.jsp">Profile</a></li>
            	<li><a href="orderHistory">Order-History</a></li>
            </ul>
        </nav>
        <% } else { %>
        <nav>
            <ul>
                <li><a href="home.jsp">Home</a></li>
                <li><a href="login.jsp">Login</a></li>
                <li><a href="register.jsp">Register</a></li>
            </ul>
        </nav>
        <% } %>
    </header>

    <main>
        <h1>Help &amp; Support</h1>  

        <div class="contact-info">
            <h2>Contact Information</h2>
            <p><strong>Email:</strong> guruswamyguru8500@gmail.com</p>
            <p><strong>Phone:</strong> +91 8500966732</p>
            <p><strong>Address:</strong> 204, Foody Deliveries, 20th Main Road, BTM Layout, Bangalore, 560076</p>
        </div>

        <div class="contact-form">
            <h2>Contact Us</h2>
            <form action="helpSend" method="post">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
                <label for="email">Email:</label>
                <% if(isUserLoggedIn)
                	{%>
                <input type="email" id="email" name="email" value=<%=user.getEmail()%> readonly>
                <%} 
                else
                {%> 
                <input type="email" id="email" name="email"  required>
                <%} %>
                
                <label for="phoneNumber">Phone Number:</label>
                <input type="number" id="phoneNumber" name="phoneNumber" required>
                
                <label for="message">Message:</label>
                <textarea id="message" name="message" rows="5" required></textarea>
                
                
                
                
                <button type="submit">Send Message</button>
            </form>
        </div>
    </main>

    <footer>
        <p>&copy; 2024 Foody. All rights reserved.</p>
    </footer>
</body>
</html>
