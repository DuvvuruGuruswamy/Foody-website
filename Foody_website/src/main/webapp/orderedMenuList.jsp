<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List, com.tap.model.Menu" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Menu List</title>
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
        width: 100%;
        max-width: 1200px;
        margin: 20px auto;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    table {
        width: 100%;
        max-width: 1200px;
        border-collapse: collapse;
        margin-bottom: 20px;
        background-color: #fff;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }

    table th, table td {
        padding: 12px;
        text-align: center;
        border: 1px solid #ddd;
    }

    table th {
        background-color: #4CAF50;
        color: white;
    }

	td img {
		    width: 130px;  
		    height: 80px; 
		    object-fit: cover; 
		    border-radius: 10px;
		}
    table tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    table tr:hover {
        background-color: #ddd;
    }

    a.button {
        display: inline-block;
        margin-top: 20px;
        padding: 10px 20px;
        background-color: #007bff;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s;
    }

    a.button:hover {
        background-color: #0056b3;
    }



</style>
</head>
<body>
<header>
    <div class="logo">
        <h1>Foody</h1>
    </div>
    <div class="welcome-message">
        <p>Menu for this Order</p>
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
    <table>
        <tr>
        	<th>Item Image</th>
            <th>Item Name</th>
            <th>Price</th>
            <th>Description</th>
        </tr>
        <%
        	String restaurantName =(String) request.getAttribute("restaurantName");
        	@SuppressWarnings("unchecked")
            List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");
            for(Menu menu : menuList) {
        %>
        <tr>
        	<td><img src="${pageContext.request.contextPath}/items_images/<%=restaurantName %>/<%=menu.getImage_path()%>.jpg" alt="<%= menu.getMenu_item_name() %>"></td>
            <td><%= menu.getMenu_item_name() %></td>
            <td><%= menu.getPrice() %></td>
            <td><%= menu.getDescription() %></td>
        </tr>
        <%
            }
        %>
    </table>

    <a href="orderHistory" class="button">Go Back</a>
</main>
</body>
</html>
