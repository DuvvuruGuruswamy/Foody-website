<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.tap.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error Page</title>
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
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            background: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            text-align: center;
        }

        .container h1 {
            color: #dc143c;
            font-size: 36px;
            margin-bottom: 10px;
        }

        .container h2 {
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .container p {
            font-size: 18px;
            color: #555;
            margin-bottom: 20px;
        }

        .button {
            padding: 10px 20px;
            background-color: #dc143c;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .button:hover {
            background-color: #c8102e;
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
            <li><a href="orderHistory">Order History</a></li>
            <li><a href="helpLine.jsp">Help</a></li>
        </ul>
    </nav>
</header>

<div class="container">
    <%
        String problem = (String) request.getAttribute("problem");

        if (problem.equals("phoneNumber")) {
    %>
        <h1>Invalid Phone Number</h1>
        <h2>Please ensure it contains only digits and is within the valid range.</h2>
        <a href="register.jsp" class="button">Go Back</a>
    <%
        } else if (problem.equals("emailAlreadyPresent")) {
    %>
        <h1>Email Already Registered</h1>
        <h2>Please use a different email or log in.</h2>
        <a href="register.jsp" class="button">Go Back</a>
    <%
        } else if (problem.equals("emailIncorrect")) {
    %>
        <h1>Incorrect Email Address</h1>
        <h2>Please enter a valid email address.</h2>
        <a href="login.jsp" class="button">Go Back</a>
    <%
        } 
        else if(problem.equals("email&passwordNotMatch")) {
    %>
        	<h1>Data doesn't match</h1>
            <p>Email and Phone number do not match. Please try again.</p>
            <a href="forgetPassword.jsp" class="button">Go Back</a>
    <%
        }
        else if (problem.equals("pwdCpwdNotMatch")) {
    %>
        <h1>Password Mismatch</h1>
        <p>Password and Confirm Password do not match. Please try again.</p>
        <a href="register.jsp" class="button">Go Back</a>
    <%
        }
        else if(problem.equals("someProblem")){
    %>
            <h1>U getting some problem.</h1> 
            <h2>Try again</h2>
            <a href="home.jsp" class="button">Go to Home</a>
                   
    <%	
        }
        else if(problem.equals("helpSend"))
        {
     %>
     	    <h1>We received ur message,our team will contact soon</h1> 
            <h2>Thank u</h2>
            <a href="helpLine.jsp" class="button">Go to Home</a>
     
     <%
        }
        else if (problem.equals("passwordIncorrect")) {
            User user = (User) session.getAttribute("user");
            if (user != null) {
    %>
	        <h1>Incorrect Password</h1>
	        <h2>Please enter a valid password.</h2>
	        <a href="updatePassword.jsp" class="button">Go Back</a>
    <%
         	} 
         	else {
    %>
	        <h1>Incorrect Password</h1>
	        <a href="login.jsp" class="button">Go Back</a>
    <%
          	}
        }
    %>
</div>

</body>
</html>
