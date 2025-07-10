<%-- 
    Document   : dashboard.html
    Created on : Jul 5, 2025, 10:40:53 AM
    Author     : ridhw
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="dao.InfoDAO"%>
<%@page import="model.bean.Info"%>
<%
    // Fetching Coupons and Promotions
    InfoDAO infoDAO = new InfoDAO();
    List<Info> coupons = infoDAO.getAllCoupons();
    List<Info> promotions = infoDAO.getAllPromotions();
%>

<!DOCTYPE html>
<html>
<head>
    <title>DashBoard</title>
    <link rel="Stylesheet" href="dashboard.css">
    <link rel="icon" type="image/jpeg" href="source/WMSlogo.png">
</head>
<body>

<header class="header">
    <div class="left-section">
        <img class="menu" src="source/menu.png">
    </div>
    <div class="middle-section">
        <input class="search-bar" type="text" placeholder="Search">
        <button class="search-button">
            <img class="search-icon" src="source/searchpic.png">
            <div class="tooltip">Search</div>
        </button>
    </div>
    <div class="right-section">
        <div class="Settings-icon-container">
            <img class="Settings-icon" src="source/gear.png">
            <div class="tooltip">Setting</div>
        </div>
        <div class="notifications-icon-container">
            <img class="notifications-icon" src="source/bell.png">
            <div class="notifications-count">!</div>
        </div>
        <img class="userpicture" src="source/userpic.png">
    </div>
</header>

<nav class="sidebar">
    <div class="sidebar-link">
        <a href="Homepage.jsp" class="sidebar-link">
            <img src="source/home.png">
            <div>Home</div>
        </a>
    </div>

    <div class="sidebar-link">
        <a href="dashboard.jsp" class="sidebar-link">
            <img src="source/dashboard.png">
            <div>Dashboard</div>
        </a>
    </div>

    <div class="sidebar-link">
        <a href="AddOption.jsp" class="sidebar-link">
            <img src="source/Addpic.png">
            <div>Add</div>
        </a>
    </div>

    <div class="sidebar-link">
        <a href="ManageOptions.jsp" class="sidebar-link">
            <img src="source/folder.png">
            <div>Manage</div>
        </a>
    </div>
</nav>

<main class="dashboard-main">
  <section class="dashboard-counters">
    <div class="counter-box">
      <h3>Coupons</h3>
      <p id="couponCount"><%= coupons.size() %></p> 
    </div>
    <div class="counter-box">
      <h3>Promotions</h3>
      <p id="promoCount"><%= promotions.size() %></p> 
    </div>
  </section>

  <section class="list-section">
    <h3>List of Coupons</h3>
    <table class="list-table">
      <thead>
        <tr>
          <th>Coupon Code</th>
          <th>Discount</th>
          <th>Expiry Date</th>
        </tr>
      </thead>
      <tbody>
        <% for (Info coupon : coupons) { %>
            <tr>
                <td><%= coupon.getCode() %></td>
                <td><%= coupon.getDiscount() %>%</td>
                <td><%= coupon.getValidUntil() %></td>
            </tr>
        <% } %>
      </tbody>
    </table>

    <h3 style="margin-top: 40px;">List of Promotions</h3>
    <table class="list-table">
      <thead>
        <tr>
          <th>Promotion Title</th>
          <th>Description</th>
          <th>Valid Until</th>
        </tr>
      </thead>
      <tbody>
        <% for (Info promotion : promotions) { %>
            <tr>
                <td><%= promotion.getTitle() %></td>
                <td><%= promotion.getDescription() %></td>
                <td><%= promotion.getEndDate() %></td>
            </tr>
        <% } %>
      </tbody>
    </table>
  </section>
</main>

</body>
</html>