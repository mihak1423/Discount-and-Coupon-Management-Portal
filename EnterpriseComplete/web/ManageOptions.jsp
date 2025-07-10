<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    if (request.getAttribute("coupons") == null || request.getAttribute("promotions") == null) {
        response.sendRedirect("manage-options");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Coupons & Promotions</title>
    <link rel="stylesheet" href="manageOption.css">
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

<main class="manage-container">
  <h2 class="page-title">Welcome To the Manage Page</h2>

  
  


  <!-- Promotions Section -->
  <section class="manage-section">
    <h2 class="section-title">Manage Promotions</h2>
    <table class="manage-table">
      <thead>
        <tr>
          <th>Title</th>
          <th>Description</th>
          <th>Start Date</th>
          <th>End Date</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="promo" items="${promotions}">
          <tr>
            <td>${promo.title}</td>
            <td>${promo.description}</td>
            <td>${promo.startDate}</td>
            <td>${promo.endDate}</td>
            <td>
              <a href="edit-info?id=${promo.id}&type=promotion" class="action-link">Edit</a> |
              <a href="delete-info?id=${promo.id}&type=promotion"
                 class="action-link delete"
                 onclick="return confirm('Are you sure you want to delete this promotion?')">Delete</a>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </section>

  <!-- Coupons Section -->
  <section class="manage-section">
    <h2 class="section-title">Manage Coupons</h2>
    <table class="manage-table">
      <thead>
        <tr>
          <th>Code</th>
          <th>Discount</th>
          <th>Valid From</th>
          <th>Valid Until</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="coupon" items="${coupons}">
          <tr>
            <td>${coupon.code}</td>
            <td>${coupon.discount}%</td>
            <td>${coupon.validFrom}</td>
            <td>${coupon.validUntil}</td>
            <td>
              <a href="edit-info?id=${coupon.id}&type=coupon" class="action-link">Edit</a> |
              <a href="delete-info?id=${coupon.id}&type=coupon"
                 class="action-link delete"
                 onclick="return confirm('Are you sure you want to delete this coupon?')">Delete</a>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </section>
  <!-- Feedback Messages -->
  <div style="text-align: center">
      <br>
      <c:if test="${not empty message}">
        <p style="color: green; font-weight: bold;">${message}</p>
      </c:if>
<c:if test="${not empty errorMessage}">
  <p style="color: red; font-weight: bold;">${errorMessage}</p>
</c:if>
  </div>
</main>

</body>
</html>