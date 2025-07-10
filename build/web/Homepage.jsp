<%-- 
    Document   : Homepage
    Created on : Jul 5, 2025, 10:41:08 AM
    Author     : ridhw
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title>DashBoard</title>
    <link rel="Stylesheet" href="homepages.css">
    <link rel="icon" type="image/jpeg" href="source/WMSlogo.png">

    
</head>
<body>

<div class="intro-container">
  <h2 class="outlined-text">Welcome to Discount & Coupon Management Portal</h2>
 <section class="intro-section" >
    <p>
      The Discount & Coupon Management Portal is a user-friendly platform designed to simplify the process of handling promotional offers. Whether you're managing discounts, active coupons, or limited-time promotions, this portal gives you full control with clear insights and easy-to-use features. Navigate through our dashboard, add new offers, or manage existing ones – all in one place.
    </p>
  </section>
<form action="LogoutServlet" method="post" style="text-align: center;">
    <button type="submit" class="submit-btn">Log Out</button>
</form>


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


</body>

</html>