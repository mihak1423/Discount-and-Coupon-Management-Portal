<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="info" class="model.bean.Info" scope="request" />
<jsp:useBean id="type" class="java.lang.String" scope="request" />

<!DOCTYPE html>
<html>
<head>
    <title>Edit ${type}</title>
    <link rel="icon" type="image/jpeg" href="source/WMSlogo.png">

    <style>
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap");

        * {
            margin: 0;
            padding: 0;
            color: #fff;
            box-sizing: border-box;
            font-family: "Poppins", sans-serif;
        }

        body {
            background: url(source/background.jpg) no-repeat;
            background-size: cover;
            background-position: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 80px;
            padding-bottom: 40px;
            min-height: 100vh;
        }

        h2 {
            color: #0ba10b;
            margin-bottom: 20px;
        }

        form {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 12px;
            width: 400px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
        }

        label {
            color: #333;
            font-weight: 600;
            display: block;
            margin-top: 15px;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"],
        textarea,
        select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #aaa;
            border-radius: 5px;
            color: black;
        }

        textarea {
            resize: vertical;
        }

        button {
            margin-top: 20px;
            padding: 10px;
            background-color: #0ba10b;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            color: white;
            cursor: pointer;
        }

        button:hover {
            background-color: #088c08;
        }

        a {
            margin-top: 20px;
            display: inline-block;
            color: #eee;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>

<h2>Edit ${type == 'coupon' ? 'Coupon' : 'Promotion'}</h2>

<form action="edit-info" method="post">
    <input type="hidden" name="id" value="${info.id}">
    <input type="hidden" name="type" value="${type}">

    <c:choose>
        <c:when test="${type == 'coupon'}">
            <label for="code">Coupon Code:</label>
            <input type="text" id="code" name="code" value="${info.code}" required>

            <label for="discount">Discount (%):</label>
            <input type="number" id="discount" name="discount" value="${info.discount}" min="1" max="100" required>

            <label for="validFrom">Valid From:</label>
            <input type="date" id="validFrom" name="validFrom"
                   value="<fmt:formatDate value='${info.validFrom}' pattern='yyyy-MM-dd'/>" required>

            <label for="validUntil">Valid Until:</label>
            <input type="date" id="validUntil" name="validUntil"
                   value="<fmt:formatDate value='${info.validUntil}' pattern='yyyy-MM-dd'/>" required>

            <label for="usageLimit">Usage Limit:</label>
            <input type="number" id="usageLimit" name="usageLimit" value="${info.usageLimit}" min="1" required>
        </c:when>

        <c:otherwise>
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" value="${info.title}" required>

            <label for="description">Description:</label>
            <textarea id="description" name="description" rows="4" required>${info.description}</textarea>

            <label for="startDate">Start Date:</label>
            <input type="date" id="startDate" name="startDate"
                   value="<fmt:formatDate value='${info.startDate}' pattern='yyyy-MM-dd'/>" required>

            <label for="endDate">End Date:</label>
            <input type="date" id="endDate" name="endDate"
                   value="<fmt:formatDate value='${info.endDate}' pattern='yyyy-MM-dd'/>" required>

            <label for="audience">Audience:</label>
            <select name="audience">
                <option value="all" ${info.audience == 'all' ? 'selected' : ''}>All Users</option>
                <option value="new" ${info.audience == 'new' ? 'selected' : ''}>New Users</option>
                <option value="existing" ${info.audience == 'existing' ? 'selected' : ''}>Existing Users</option>
            </select>
        </c:otherwise>
    </c:choose>

    <button type="submit">Update</button>
</form>

<a href="manage-options" style ="color: black">← Back to Manage Page</a>

</body>
</html>