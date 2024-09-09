<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.tap.model.Cart" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.tap.model.CartItem" %>
<%@ page import="com.tap.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart</title>
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
            max-width: 1000px;
            margin: 20px auto;
            padding: 20px;
            background: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .container h1 {
            margin-bottom: 20px;
            color: #333;
            text-align: center;
            font-size: 2em;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

		td img {
		    width: 130px;  
		    height: 80px; 
		    object-fit: cover; 
		    border-radius: 10px;
		}
		
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .quantity {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .quantity button {
            padding: 5px 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            color: white;
            cursor: pointer;
            font-size: 1em;
            transition: background-color 0.3s;
            height: 40px;
            width: 40px;
        }

        .quantity button.decrease {
            background-color: #ff6347;
        }

        .quantity button.decrease:hover {
            background-color: #e55347;
        }

        .quantity button.increase {
            background-color: #4caf50;
        }

        .quantity button.increase:hover {
            background-color: #45a049;
        }

        .quantity input[type="number"] {
            width: 50px;
            padding: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
            text-align: center;
            font-size: 1em;
        }

        .total-amount {
            margin-top: 20px;
            padding: 15px;
            background-color: #4CAF50;
            color: white;
            border-radius: 5px;
            text-align: center;
            font-size: 1.5em;
        }

        .empty-cart {
            text-align: center;
            font-size: 1.5em;
            color: #777;
        }

        .pay-option {
            margin-top: 20px;
            text-align: center;
        }

        .pay-option button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: white;
            font-size: 1.2em;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .pay-option button:hover {
             background-color: #0056b3;
        }

        .remove {
            background-color: #e53e3e;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .remove:hover {
            background-color: #d43f3a;
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
            <li><a href="profile.jsp">Profile</a></li>
            <li><a href="orderHistory">Order-History</a></li>
            <li><a href="helpLine.jsp">Help</a></li>
        </ul>
    </nav>
</header>

<div class="container">
    <%
    	User user = (User)session.getAttribute("user");
    	if(user!=null)
    	{
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart != null && cart.getItems() != null && !cart.getItems().isEmpty()) {
            Map<Integer, CartItem> cartItems = cart.getItems();
            float totalAmount = 0;
    %>
    <h1><%= cart.getItems().values().iterator().next().getRestaurantName() %> Restaurant</h1>
    <table>
        <thead>
            <tr>
            	<th>Item Image</th>
                <th>Item</th>
                <th>Availability</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Subtotal</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (CartItem item : cartItems.values()) {
                    float subTotal = item.getPrice() * item.getQuantity();
                    totalAmount += subTotal;
            %>
            <tr>
            	<td><img src="${pageContext.request.contextPath}/items_images/<%=cart.getItems().values().iterator().next().getRestaurantName() %>/<%=item.getImage()%>.jpg" alt="<%= item.getItemName()%>"></td>
                <td><%= item.getItemName() %></td>
                <td><%= item.getIsAvailable() %></td>
                <td><%= item.getPrice() %></td>
                <td>
                    <form method="post" action="cart">
                        <div class="quantity">
                            <button type="submit" name="action" value="decrease" class="decrease">-</button>
                            <input type="number" name="quantity" value="<%= item.getQuantity() %>" readonly>
                            <button type="submit" name="action" value="increase" class="increase">+</button>
                        </div>
                        <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                    </form>
                </td>
                <td><%= subTotal %></td>
                <td>
                    <form method="post" action="cart">
                        <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                        <button type="submit" name="action" value="remove" class="remove">Remove</button>
                    </form>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <div class="total-amount">
        Total Amount: <%= totalAmount %>
    </div>
    <div class="pay-option">
        <form method="post" action="billing.jsp">
            <input type="hidden" name="pay" value="<%= totalAmount %>">
            <button type="submit">Proceed to Pay</button>
        </form>
    </div>
    <%
        }
        else
        { %>
        	<p class="empty-cart"> Your cart is empty, Please add items</p>
        	<%
        }
    	}else {
    %>
    <p class="empty-cart">You already logged out, please go to Home page and login</p>
    <%
        }
    %>
</div>
</body>
</html>
