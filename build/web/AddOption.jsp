<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <title>Add Coupon & Promotion</title>
    <link rel="stylesheet" href="addOption.css">
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

<main class="main-content">
  <h2 class="page-title">Welcome to The Add Page</h2>
  <div class="form-sections">

    <!-- Coupon Form -->
    <div class="form-box">
      <h3>Add New Coupon</h3>
      <form class="form" action="add-info" method="post">
        <label for="code">Coupon Code:</label>
        <input type="text" id="code" name="code" required>

        <label for="discount">Discount (%):</label>
        <input type="number" id="discount" name="discount" min="1" max="100" required>

        <label for="valid-from">Valid From:</label>
        <input type="date" id="valid-from" name="valid-from" required>

        <label for="valid-until">Valid Until:</label>
        <input type="date" id="valid-until" name="valid-until" required>

        <label for="usage-limit">Usage Limit:</label>
        <input type="number" id="usage-limit" name="usage-limit" min="1" required>

        <button type="submit" class="submit-btn">Add Coupon</button>
      </form>
    </div>

    <!-- Promotion Form -->
    <div class="form-box">
      <h3>Add New Promotion</h3>
      <form class="form" action="add-info" method="post">
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" required>

        <label for="description">Description:</label>
        <textarea id="description" name="description" rows="4" required></textarea>

        <label for="start-date">Start Date:</label>
        <input type="date" id="start-date" name="start-date" required>

        <label for="end-date">End Date:</label>
        <input type="date" id="end-date" name="end-date" required>

        <label for="audience">Target Audience:</label>
        <select id="audience" name="audience" style="color: #000">
          <option value="all" style="color: #000">All Users</option>
          <option value="new" style="color: #000">New Users</option>
          <option value="existing" style="color: #000">Existing Users</option>
        </select>

        <button type="submit" class="submit-btn">Add Promotion</button>
      </form>
    </div>
    


  </div>
  <div>
      <br><br>
        <c:if test="${not empty message}">
            <p style="color: green;">${message}</p>
        </c:if>
        <c:if test="${not empty errorMessage}">
      <p style="color: red;">${errorMessage}</p>
        </c:if>
      
    </div>
</main>
</body>
</html>