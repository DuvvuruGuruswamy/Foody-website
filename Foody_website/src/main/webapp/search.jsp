<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List, com.tap.model.Restaurant" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Restaurant List</title>
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

		header .welcome-message {
        	padding-left:160px;
            text-align: center;
            flex: 2;
        }

        header .welcome-message p {
            margin: 0;
            font-size: 30px;
            font-weight: 750;
        }
        
        .restaurant-cards {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
            padding: 20px;
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
            width: 100%;
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
      
    </style>
</head>
<body>
    <header>
        <div class="logo">
            <h1>Foody</h1>
        </div>
        <div class="welcome-message">
            <p>Searched Restaurants</p>
        </div>
        <nav>
            <ul>
                <li><a href="home.jsp">Home</a></li>
                <li><a href="cart.jsp">Cart</a></li>
                <li><a href="profile.jsp">Profile</a></li>
                <li><a href="orderHistory.jsp">Order-History</a></li>
                <li><a href="helpLine.jsp">Help</a></li>
            </ul>
        </nav>
    </header>

    <section class="restaurant-cards">
        <%
        @SuppressWarnings("unchecked")
        List<Restaurant> restaurantList = (List<Restaurant>) request.getAttribute("restaurantList"); 
        if (restaurantList != null && !restaurantList.isEmpty()) {
            for (Restaurant restaurant : restaurantList) {
        %>
            <div class="card">
                <img src="https://cdn.pixabay.com/photo/2024/01/19/12/16/chicken-8518910_1280.jpg" alt="<%= restaurant.getRestaurantName() %>">
                <h4><%= restaurant.getRestaurantName() %></h4>
                <p><%= restaurant.getCuisineType() %>, Delivery time: <%= restaurant.getDeliveryTime() %> mins</p>
                <div class="rating">Rating: <%= restaurant.getRating() %> / 5</div>
                <a href="menu?restaurantId=<%= restaurant.getRestaurantId() %>" class="view-menu-button">View Menu</a>
            </div>
        <%
            }
        } else {
        %>
            <p>No restaurants found</p>
        <%
        }
        %>
    </section>
</body>
</html>
