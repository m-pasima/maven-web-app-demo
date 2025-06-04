<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Enquiries</title>
    <link rel="stylesheet" href="/css/style.css"/>
</head>
<body>
<nav class="navbar">
    <h1>Enquiry Page</h1>
    <a href="/">Home</a>
</nav>
<div class="container">
    <h2>Send us an Enquiry</h2>
    <form action="/enquiry" method="post">
        <label>Name:</label>
        <input type="text" name="name" required/>
        <label>Email:</label>
        <input type="email" name="email" required/>
        <label>Message:</label>
        <textarea name="message" rows="4" required></textarea>
        <button type="submit">Submit</button>
    </form>

    <h2>Previous enquiries</h2>
    <ul>
        <c:forEach items="${enquiries}" var="e">
            <li><strong>${e.name}</strong> (${e.email}): ${e.message}</li>
        </c:forEach>
    </ul>
</div>
</body>
</html>
