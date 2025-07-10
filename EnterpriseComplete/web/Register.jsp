<%-- 
    Document   : Register
    Created on : Jul 5, 2025, 10:42:01 AM
    Author     : ridhw
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RegisterPage</title>
    <link rel="icon" type="image/jpeg" href="source/WMSlogo.png">
    

    <style>
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap");

     * {
        margin: 0;
        padding: 0;
        color: #eae6e6;
        box-sizing: border-box;
        font-family: "Poppins", sans-serif;
    }

    body {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        background: url(source/background2.jpg) no-repeat;
        background-size: cover;
        background-position: center;
    }

    .header {
        color: aliceblue;
        margin-bottom: 36px;
        display: flex;
        width: 100%;
        padding: 20px;
        align-items: center;
        justify-content: center;
        text-align: center;
    }

    .wrap {
        width: 420px;
        background: transparent;
        border: 2px solid #dfcbcb33;
        backdrop-filter: blur(20px);
        box-shadow: 20px 20px 10px rgba(0,0,0,.2);
        color: #f9f7f7;
        border-radius: 10px;
        padding: 30px 40px;
    }

    .wrap h1 {
        font-size: 36px;
        text-align: center;
    }

    .wrap .Inputbox {
        position: relative;
        width: 100%;
        height: 50px;
        margin: 30px 0;
    }

    .Inputbox input {
        width: 100%;
        height: 100%;
        background: transparent;
        border: 2px solid rgba(32, 4, 4, 0.2);
        border-radius: 40px;
        font-size: 16px;
        color: #fff9f9;
        padding: 20px 45px 20px 20px;
    }

    .Inputbox input::placeholder {
        color: #fff;
    }

    .wrap .btn {
        width: 100%;
        height: 45px;
        background: #fff;
        border: none;
        outline: none;
        border-radius: 40px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        cursor: pointer;
        font-size: 16px;
        color: #262323;
        font-weight: 600;
    }

    .wrap .register-link {
        font-size: 14.5px;
        text-align: center;
        margin: 20px 0 15px;
    }

    .register-link p a {
        color:#fff;
        text-decoration: none;
        font-weight: 600;
    }

    .register-link p a:hover {
        text-decoration: underline;
    }

    </style>
</head>
<body>
    <div class="header">
        <h1>Register Account </h1>
    </div>

    <div class="wrap">
        <form action="RegisterServlet" method="POST">
            <h1>Register</h1>
            <div class="Inputbox">
                <input type="text" name="username" placeholder="Enter Username" required>
            </div>
            <div class="Inputbox">
                <input type="password" name="password" placeholder="Enter Password" required>
            </div>
            <br>
            <c:if test="${not empty successMessage}">
                <p style="color: green;">${successMessage}</p>
            </c:if>

            <c:if test="${not empty errorMessage}">
                <p style="color: red;">${errorMessage}</p>
            </c:if>
            <br>
<c:if test="${param.success == 'true'}">
    <script>
        alert("✅ Registration successful! Redirecting to login...");
        window.location.href = 'MainMenu.jsp';
    </script>
</c:if>

            <button type="submit" class="btn">Register</button>
            <div class="register-link">
                <p><a href="MainMenu.jsp">Already have an account? Login</a></p>
            </div>
        </form>
    </div>
</body>
</html>