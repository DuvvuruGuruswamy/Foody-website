<%@page import="com.tap.model.OrderHistory"%>
<%@page import="com.tap.model.OrderTable"%>
<%@page import="com.tap.model.Restaurant"%>
<%@page import="com.tap.model.User"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Order History</title>
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
            color: #f8f8f8;
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
            font-size: 30px;
        }


        
        main {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h1, h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }
        
        th {
            background-color: #4CAF50;
            color: white;
        }
        
        td img {
		    width: 130px;  
		    height: 80px; 
		    object-fit: cover; 
		    border-radius: 10px;
		}
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
        .no-orders, .no-user {
            text-align: center;
            font-size: 18px;
            color: #666;
            padding: 20px;
        }
        .back-button {
            text-align: center;
            margin: 20px;
        }
        .back-button a {
            text-decoration: none;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .back-button a:hover {
            background-color: #0056b3;
        }
        .view-order-link {
        text-decoration: none;
        padding: 8px 15px;
        background-color: #007bff;
        color: white;
        border-radius: 5px;
        transition: background-color 0.3s ease, transform 0.2s ease;
    }

    .view-order-link:hover {
        background-color: #0056b3;;
        transform: scale(1.05);
    }

    .view-order-link:active {
        background-color: #3e8e41;
        transform: scale(1);
    }

    </style>
</head>
<body>
<header>
        <div class="logo">
            <h1>Foody</h1>
        </div>

       
        <div class="welcome-message">
            <p>Order History</p>
        </div>
        <nav>
            <ul>
                <li><a href="home.jsp">Home</a></li>
                <li><a href="cart.jsp">Cart</a></li>
                <li><a href="profile.jsp">Profile</a></li>
                <li><a href="helpLine.jsp">Help</a></li>
            </ul>
        </nav>
    </header>

<main>
    <%
        User user = (User)session.getAttribute("user");
        if(user != null) {
        	@SuppressWarnings("unchecked")
            List<OrderHistory> orderHistoryList = (List<OrderHistory>) request.getAttribute("orderHistoryList");
        	@SuppressWarnings("unchecked")
            List<Restaurant> restaurantList = (List<Restaurant>) request.getAttribute("restaurantList");
            
            if(orderHistoryList != null && !orderHistoryList.isEmpty()) {
    %>
    <table>
        <thead>
            <tr>
            	<th>Image of restaurant</th>
                <th>Order Id</th>
                <th>Restaurant Name</th>
                <th>Order Date</th>
                <th>Total Amount</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (int i = 0; i < orderHistoryList.size(); i++) {
                    OrderHistory oh = orderHistoryList.get(i);
                    Restaurant restaurant = restaurantList.get(i);
            %>
            <tr>
            	<td><img src="${pageContext.request.contextPath}/restaurant_images/<%=restaurant.getImgpath()%>.jpeg" alt="no image found"></td>
                <td><%= oh.getOrderId() %></td>
                <td><%= restaurant.getRestaurantName() %></td>
                <td><%= oh.getOrderDate() %></td>
                <td><%= oh.getTotalAmount() %></td>
                <td><%= oh.getStatus() %></td>
                <td><a href="orderedMenu?orderId=<%=oh.getOrderId() %>" class="view-order-link">View Menu</a></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    <%
            } else {
    %>
    <div class="no-orders">
        <h2>You have no Orders Placed</h2>
    </div>
    <%
            }
        } else {
    %>
    <div class="no-user">
        <h2>User is not Logged in. Please log in to view order history.</h2>
    </div>
    <%
        }
    %>
    <div class="back-button">
        <a href="home.jsp">Back to Home</a>
    </div>
</main>
</body>
</html>
