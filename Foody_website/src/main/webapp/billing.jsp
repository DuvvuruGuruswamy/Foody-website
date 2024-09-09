<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.tap.model.Cart" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.tap.model.CartItem" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
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
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .container h1 {
            margin-bottom: 20px;
            color: #ff6347;
            text-align: center;
            font-size: 2em;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .quantity {
            text-align: center;
        }

        .quantity input[type="number"] {
            width: 50px;
            padding: 5px;
            text-align: center;
            border: 1px solid #ddd;
            border-radius: 5px;
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
            font-size: 1.2em;
            color: #777;
        }

	    

        .address-section {
            margin-top: 30px;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 10px;
        }

        .address-section input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1em;
        }

        .address-section input[type="text"]:focus {
            border-color: #ff6347;
            outline: none;
        }

        .pay-option input {
		    padding: 10px 20px;
		    border: none;
		    border-radius: 10px;
		    background-color: #007bff; 
		    color: white;
		    font-size: 1.5em;
		    cursor: pointer;
		    transition: background-color 0.3s;
		}
	
		.pay-option input:hover {
		    background-color: #0056b3;
		}
        .payment-mode {
            margin-top: 20px;
            padding: 15px;
            background-color: #f9f9f9;
            border-radius: 10px;
        }
        
        .pay-option {
            text-align: center;
            margin-top: 20px;
        }

        .payment-mode h2 {
            color: #ff6347;
            margin-bottom: 15px;
        }

        .payment-mode label {
            display: block;
            margin-bottom: 10px;
        }

        .payment-mode input[type="radio"] {
            margin-right: 10px;
        }

        
    </style>
</head>
<body>
<header>
    <div class="logo">
        <h1>Foody</h1>
    </div>
    <nav>
        <%
        String isLoggedIn = (String) session.getAttribute("email");
        %>
        <ul>
            <li><a href="home.jsp">Home</a></li>
            <li><a href="cart.jsp">Cart</a></li>
            <li><a href="orderHistory">Order-History</a></li>
            <li><a href="helpLine.jsp">Help</a></li>
        </ul>
    </nav>
</header>

<div class="container">
    <h1>Billing Details</h1>
    <%
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart != null && cart.getItems() != null && !cart.getItems().isEmpty()) {
            Map<Integer, CartItem> cartItems = cart.getItems();
            float totalAmount = 0;
    %>
    <table>
        <tr>
            <th>Restaurant</th>
            <th>Item</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Subtotal</th>
        </tr>
        <%
            for (CartItem item : cartItems.values()) {
                float subTotal = item.getPrice() * item.getQuantity();
                totalAmount += subTotal;
        %>
        <tr>
            <td><%= item.getRestaurantName() %></td>
            <td><%= item.getItemName() %></td>
            <td><%= item.getPrice() %></td>
            <td>
                
                    <div class="quantity">
                        <input type="number" name="quantity" value="<%= item.getQuantity() %>" readonly>
                    </div>
                    <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
              
            </td>
            <td><%= subTotal %></td>
        </tr>
        <% 
            }
        %>
    </table>
    <div class="total-amount">
        Total Amount: <%= totalAmount %>
    </div>

    <!-- Address Section Start -->
    <div class="address-section">
        <form method="post" action="order">
            <!-- Payment Mode Section Start -->
            <div class="payment-mode">
                <h2>Payment Mode</h2>
                <label><input type="radio" name="paymentMode" value="Credit Card" required> Credit Card</label>
                <label><input type="radio" name="paymentMode" value="Debit Card" required> Debit Card</label>
                <label><input type="radio" name="paymentMode" value="UPI"> UPI</label>
                <label><input type="radio" name="paymentMode" value="Cash on Delivery"> Cash on Delivery</label>
            </div>
            <!-- Payment Mode Section End -->

            <h2>Delivery Address</h2>
            <input type="text" name="addressLine" placeholder="Address Line 1" required>
            <input type="text" name="city" placeholder="City" required>
            <input type="text" name="state" placeholder="State" required>
            <input type="text" name="zipCode" placeholder="ZIP Code" required>

            <input type="hidden" name="pay" value="<%= totalAmount %>">

            <div class="pay-option">
                <input type="submit" name="submit" value="Confirm Order" >
            </div>
           	<input type="hidden" name="totalAmount" value="<%= totalAmount %>" >
        </form>
    </div>
    <!-- Address Section End -->

    <%
        } else {
    %>
    <p class="empty-cart">Your cart is empty.</p>
    <%
        }
    %>
</div>
</body>
</html>
