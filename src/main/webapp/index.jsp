<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>DevOps Academy Web App</title>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Source+Sans+Pro:wght@300;400;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
</head>
<body>
  <div class="top-bar">
    Email: <a href="mailto:devopsacademy@gmx.com">devopsacademy@gmx.com</a> |
    Tel: 07533020152
  </div>

  <nav class="navbar">
    <h1>The DevOps Academy</h1>
    <a href="<c:url value='/enquiry'/>" style="margin-right:1rem;">Enquiry</a>
    <button id="theme-toggle">Change Theme</button>
  </nav>
  <section class="hero">
    <div class="hero-content">
      <h2>Welcome to DevOps Academy</h2>
      <p>Explore our curriculum and become a DevOps professional.</p>
      <a class="cta-btn" href="hello">Enter Site</a>
    </div>
  </section>

  <div class="container">
    <button id="colorBtn" class="btn" type="button">Change Theme</button>
  </div>

  <footer class="footer">
    <p>Email: <a href="mailto:devopsacademy@gmx.com">devopsacademy@gmx.com</a>
      | Tel: 07533020152</p>
    <p>&copy; 2024 The DevOps Academy</p>
  </footer>

  <script src="<c:url value='/js/script.js'/>"></script>
</body>
</html>
