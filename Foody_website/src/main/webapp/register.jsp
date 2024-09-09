<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registration Page</title>
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
            margin-top: 60px; /* Adjusted to avoid overlap with fixed header */
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

	.container {
		display: flex;
		justify-content: center;
		align-items: center;
		height: 100%;
		margin: 10px;
		padding-top: 70px; /* Adjust for header height */
	}
	
	.form-container {
		background-color: rgba(255, 255, 255, 0.9);
		padding: 40px ;
		border-radius: 15px;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		text-align: left;
		max-width: 500px;
		width: 100%;
	}
	
	.form-container h1 {
		font-size: 2em;
		color: #333;
		margin-bottom: 20px;
	}
	
	.form-container label {
		font-size: 1.2em;
		color: #333;
		margin-bottom: 5px;
	}
	
	.form-container input[type="text"], .form-container input[type="email"],
		.form-container input[type="tel"], .form-container input[type="password"]
		{
		width: 100%;
		padding: 5px;
		margin-bottom: 10px;
		border: 1px solid #ccc;
		border-radius: 5px;
		font-size: 1em;
	}
	
	.form-container input[type="submit"] {
		width:60%;
	    padding: 10px;
	    background-color: #007BFF;
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
            <li><a href="login.jsp">Login</a></li>
            <li><a href="helpLine.jsp">Help</a></li>
        </ul>
    </nav>
</header>

<a href="javascript:history.back()" class="go-back"> <i class="fas fa-arrow-left"></i> </a>

<div class="container">
	<form action="register" class="form-container">
		<h1>Register</h1>
		<table>
			<tr>
				<td><label for="name">Name</label></td>
				<td><input type="text" id="name" name="name" placeholder="Enter your name" required></td>
			</tr>
			<tr>
				<td><label for="email">Mail Id</label></td>
				<td><input type="email" id="email" name="email" placeholder="Enter your email" required></td>
			</tr>
			<tr>
				<td><label for="phonenumber">Phone Number</label></td>
				<td><input type="tel" id="phonenumber" name="phonenumber" placeholder="Enter your phone number"></td>
			</tr>
			<tr>
				<td><label for="password">Password</label></td>
				<td><input type="password" id="password" name="password" placeholder="Enter your password" required></td>
			</tr>
			<tr>
				<td><label for="cpassword">Confirm Password</label></td>
				<td><input type="password" id="cpassword" name="cpassword" placeholder="Confirm your password" required></td>
			</tr>
			<tr>
				<td><label for="address">Address</label></td>
				<td><input type="text" id="address" name="address" placeholder="Enter your address"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Register"></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>
