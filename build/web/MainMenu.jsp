<%-- 
    Document   : MainMenu
    Created on : Jul 5, 2025, 10:41:25 AM
    Author     : ridhw
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sql:setDataSource var="myDatasource"
driver="org.apache.derby.jdbc.ClientDataSource"
url="jdbc:derby://localhost:1527/GroupAssignDB" user="app"
password="app"/>
<!DOCTYPE html>
<html lang="en">

<head>

    <title>Discount&Coupon Management Portal</title>
    <link rel="Stylesheet" href="Log&Reg.css">
    <link rel="icon" type="image/jpeg" href="source/WMSlogo.png">

</head>
<body>
    
   
    <div class="header">
        <h1>Welcome to Discount & Coupon <br>Management Portal for E-Commerce Promotions</h1>
    </div>
    

    <div class="wrap">
        
        <form action="LoginServlet" method="POST">
            <h1>Login</h1>
            <div class="Inputbox">
           
                <input type="text" name="username"placeholder="Enter Username" required>
                
            </div>
        <div class="Inputbox">
            
            <input type="password" name="password"placeholder="Enter Password" required>
        
        </div>
        <c:if test="${not empty errorMessage}">
            <p style="color: red;">${errorMessage}</p>
        </c:if>
        <br>
         <div class="register-link">
        <button type="submit" class="btn">Login</button>
        </div>

        </form>
        
        <div class="register-link">
            <p><a href="Register.jsp">Don't have an account? Register</a></p>
        </div>
        </form>
    </div>
        
    </div>
    
    
    
</body>
</html>