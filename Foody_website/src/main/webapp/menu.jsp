<%@ page import="com.tap.daoimplementation.RestaurantImplements"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.tap.model.Menu" %>
<%@ page import="com.tap.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.tap.model.Restaurant" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu Item Details</title>
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

        header .restaurant-name {
            text-align: center;
            flex: 2;
            padding-left: 170px;
        }

        header .restaurant-name h2 {
            margin: 0;
            font-size: 25px;
        }

        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .container h1 {
            margin-bottom: 20px;
            color: #4CAF50;
            text-align: center;
            font-size: 2em;
        }

        .menu-items {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .menu-item {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 15px;
            width: calc(33.333% - 20px);
            text-align: center;
            transition: transform 0.3s;
        }

        .menu-item:hover {
            transform: scale(1.05);
        }

        .menu-item img {
		    width: 300px;  
		    height: 250px; 
		    object-fit: cover; 
		    border-radius: 10px;
        }

        .menu-item h2 {
            margin-top: 10px;
            color: #4CAF50;
            font-size: 1.5em;
        }

        .menu-item p {
            margin: 5px 0;
            color: #777;
        }

        .price {
            font-size: 1.2em;
            color: #333;
        }

        .availability {
            font-size: 0.9em;
            color: green;
        }

        .description {
            margin-top: 10px;
            font-size: 0.9em;
            color: #555;
        }

        .quantity {
            margin-top: 10px;
            font-size: 1em;
            color: #555;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .quantity label {
            margin-right: 10px;
        }

        .quantity input[type="number"] {
            width: 50px;
            padding: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
            text-align: center;
            font-size: 1em;
        }

        .add-to-cart {
            margin-top: 15px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            transition: background-color 0.3s;
        }

        .add-to-cart:hover {
            background-color: #45a049;
        }


    </style>
</head>
<body>
    <header>
        <div class="logo">
            <h1>Foody</h1>
        </div>
        <% 
        List<Menu> displayItems = (List<Menu>) session.getAttribute("itemsList");
        if (!displayItems.isEmpty()) {
            
        Restaurant restaurant=(Restaurant)session.getAttribute("restaurant");
        %>
        <div class="restaurant-name">
            <h2><%= restaurant.getRestaurantName() %> Restaurant Items</h2>
        </div>
        <nav>
            <ul>
                <li><a href="home.jsp">Home</a></li>
                <% 
                User user = (User) session.getAttribute("user");
                if (user != null) {
                %>
                <li><a href="cart.jsp">Cart</a></li>
            	<li><a href="orderHistory">Order-History</a></li>
                <% } else { %>
                <li><a href="login.jsp">Login</a></li>
                <li><a href="register.jsp">Register</a></li>
                <% } %>
                <li><a href="helpLine.jsp">Help</a></li>
            </ul>
        </nav>
    </header>

    <div class="container">
        <div class="menu-items">
            <% 
            for (Menu item : displayItems) {
            %>
            <form action="cart" class="menu-item">
                <img src="${pageContext.request.contextPath}/items_images/<%=restaurant.getRestaurantName() %>/<%=item.getImage_path()%>.jpg" alt="<%= item.getMenu_item_name() %>">
                <h2><%= item.getMenu_item_name() %></h2>
                <p class="price">Price: <%= item.getPrice() %></p>
                <p class="description"><%= item.getDescription() %></p>
                <p class="availability"><%= item.getIs_available().equalsIgnoreCase("yes") ? "Available" : "Not Available" %></p>
                
                <div class="quantity">
                    <label for="quantity">Quantity:</label>
                    <input type="number" id="quantity" name="quantity" min="1" value="1">
                </div>
                
                <!-- Hidden fields to pass price and item name -->
                <input type="hidden" name="menuId" value="<%= item.getMenu_id() %>"> 
                <input type="submit" value="Add to cart" name="action" class="add-to-cart">
            </form>
            <% 
            }
        } else {
        %>
        <p>No menu items available for this restaurant.</p>
        <% 
        }
        %>
        </div>
    </div>
</body>
</html>
