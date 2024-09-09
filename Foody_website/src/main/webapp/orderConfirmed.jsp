<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .confirmation-container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 600px;
            margin: auto;
        }
        h1 {
            color: #28a745;
            margin-bottom: 20px;
        }
        .order-details {
            text-align: left;
            margin-top: 20px;
        }
        .order-details p {
            margin: 5px 0;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: #ffffff;
            text-decoration: none;
            border-radius: 5px;
        }
        a:hover {
            background-color: #0056b3;
        }

        
    </style>
</head>
<body>
    <div class="confirmation-container">
        <h1>Order Placed Successfully!</h1>
        <div class="order-details">
            <p><strong>Order ID:</strong> ${requestScope.orderId}</p>
            <p><strong>Total Amount:</strong> ${requestScope.totalAmount}</p>
            <p><strong>Payment Mode:</strong> ${requestScope.paymentMode}</p>
            <p><strong>Status:</strong> ${requestScope.status}</p>
        </div>
        <%session.removeAttribute("cart"); %>
        <a href="home.jsp">Go to Homepage</a>
    </div>
</body>
</html>
