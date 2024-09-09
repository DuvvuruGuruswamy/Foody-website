<%@ page import="com.tap.model.Restaurant" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="com.tap.daoimplementation.UserImplements" %>
<%@ page import="com.tap.model.User" %>
<%@page import="com.tap.daoimplementation.RestaurantImplements" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Foody - Home</title>
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

        header .welcome-message {
        	padding-left:160px;
            text-align: center;
            flex: 2;
        }

        header .welcome-message p {
            margin: 0;
            font-size: 23px;
        }


        .hero {
            background: url('https://cdn.pixabay.com/photo/2020/05/07/10/12/food-5149203_1280.jpg') no-repeat center center/cover;
            height: 400px;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            text-align: center;
            padding: 20px;
        }

        .hero-content {
            background: rgba(0, 0, 0, 0.6);
            padding: 30px;
            border-radius: 10px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .hero-content h2 {
            margin-bottom: 20px;
            font-size: 32px;
        }

        .hero-content form {
            display: flex;
            justify-content: center;
        }

        .hero-content input[type="text"] {
            padding: 10px;
            width: 300px;
            border: none;
            border-radius: 5px 0 0 5px;
            font-size: 16px;
        }

        .hero-content button {
            padding: 10px;
            background-color: #ff6347;
            border: none;
            color: white;
            border-radius: 0 5px 5px 0;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .hero-content button:hover {
            background-color: #ff4500;
        }

        .featured {
            padding: 40px 20px;
            text-align: center;
        }

        .featured h3 {
            margin-bottom: 30px;
            font-size: 28px;
            color: #ff6347;
        }

        .restaurant-cards {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
        }

        .card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 250px;
            text-align: center;
            transition: transform 0.3s;
        }

        .card:hover {
            transform: scale(1.1);
        }

	    .card img {
		    width: 200px;  
		    height: 150px; 
		    object-fit: cover; 
		    border-radius: 10px;
		}

        .card h4 {
            margin-top: 15px;
            font-size: 20px;
            color: #333;
        }

        .card p {
            color: #777;
            margin: 10px 0;
        }

        .card .rating {
		    color: #4CAF50; 
		    font-size: 16px;
		    margin-top: 5px;
		}

		.card .view-menu-button {
		    display: inline-block;
		    margin-top: 10px;
		    padding: 10px 15px;
		    background-color: #4CAF50; 
		    color: white;
		    border: none;
		    border-radius: 5px;
		    cursor: pointer;
		    text-decoration: none;
		    font-size: 14px;
		    transition: background-color 0.3s;
		}

		.card .view-menu-button:hover {
		    background-color: #388E3C; 
		}

        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 15px 0;
            margin-top: 50px;
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
        <div class="welcome-message">
            <p>Welcome, <%= user.getUserName() %></p>
        </div>
        <nav>
            <ul>
                <li><a href="cart.jsp">Cart</a></li>
                <li><a href="profile.jsp">Profile</a></li>
                <li><a href="orderHistory">Order-History</a></li>
                <li><a href="helpLine.jsp">Help</a></li>
            </ul>
        </nav>
        <% } else { %>
        <nav>
            <ul>
                <li><a href="login.jsp">Login</a></li>
                <li><a href="register.jsp">Register</a></li>
                <li><a href="helpLine.jsp">Help</a></li>
            </ul>
        </nav>
        <% } %>
    </header>

    <section class="hero">
        <div class="hero-content">
            <h2>Order food online from your favorite restaurants</h2>
            <form action="search" method="post">
                <input type="text" name="query" placeholder="Search for restaurants" required>
                <button type="submit">Search</button>
            </form>
        </div>
    </section>

    <section class="featured">
        <h3>Featured Restaurants</h3>
        <div class="restaurant-cards">
            <%
            @SuppressWarnings("unchecked")
            List<Restaurant> displayData = (List<Restaurant>)session.getAttribute("restaurantDetails");

            if(!displayData.isEmpty())
            {
            for (Restaurant restaurant : displayData) {
            %>
            <div class="card">
				<img src="${pageContext.request.contextPath}/restaurant_images/<%=restaurant.getImgpath()%>.jpeg" alt="no image found">
                <h4><%= restaurant.getRestaurantName() %></h4>
                <p><%= restaurant.getCuisineType() %>, Delivery time: <%= restaurant.getDeliveryTime() %> mins</p>
                <div class="rating">Rating: <%= restaurant.getRating() %> / 5</div>
                <a href="menu?restaurantId=<%= restaurant.getRestaurantId() %>" class="view-menu-button">View Menu</a>
            </div>
            <%
            }
            }
            else {
            	%>
            	<p>Sorry, no restaurants are available at the moment. Please check back later</p>
            	<%
            }
            %>
        </div>
    </section>

    <footer>
        <p>&copy; 2024 Foody. All rights reserved.</p>
    </footer>
</body>
</html>
