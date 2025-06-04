<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>The DevOps Academy</title>
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
    <div class="nav-links">
      <a href="#contact-info">Contact</a>
      <a href="#curriculum">Curriculum</a>
      <a href="#tools">Tools</a>
      <a href="#footer">Footer</a>
      <a href="<c:url value='/enquiry'/>">Enquiry</a>
    </div>
    <button id="theme-toggle">Change Theme</button>
  </nav>

  <section class="hero">
    <div class="hero-content">
      <h2>Unlock Your Full Potential with DevOps</h2>
      <p id="hero-message">${message}</p>
      <a class="cta-btn" href="#curriculum">View Curriculum</a>
    </div>
    <div class="timer-side-box">
      <div class="timer-item">
        <span id="days-side">00</span>
        <small>Days</small>
      </div>
      <div class="timer-item">
        <span id="hours-side">00</span>
        <small>Hours</small>
      </div>
      <div class="timer-item">
        <span id="minutes-side">00</span>
        <small>Minutes</small>
      </div>
      <div class="timer-item">
        <span id="seconds-side">00</span>
        <small>Seconds</small>
      </div>
    </div>
  </section>

  <div class="container" id="curriculum">
    <div class="contact" id="contact-info">
      <p><strong>Email:</strong> devopsacademy@gmx.com</p>
      <p><strong>Location:</strong> Birmingham, UK</p>
      <p><strong>Tel:</strong> 07533020152</p>
    </div>

    <div class="contact-form-container" id="contact-form">
      <h2>Contact Us</h2>
      <form action="https://formspree.io/f/mldgyzqk" method="POST">
        <label for="name">Your Name:</label>
        <input type="text" id="name" name="name" placeholder="Enter your name" required>

        <label for="email">Your Email:</label>
        <input type="email" id="email" name="email" placeholder="Enter your email" required>

        <label for="phone">Phone Number (optional):</label>
        <input type="tel" id="phone" name="phone" placeholder="Enter your phone number">

        <label for="subject">Subject:</label>
        <input type="text" id="subject" name="subject" placeholder="Subject">

        <label for="message">Your Message:</label>
        <textarea id="message" name="message" rows="5" placeholder="Type your message here..." required></textarea>

        <button type="submit">Send Message</button>
      </form>
    </div>

    <h2 class="section-title">1. DevOps Introduction (Understanding DevOps)</h2>
    <div class="accordion">
      <div class="accordion-item">
        <div class="accordion-header">
          <h3>Section Details</h3>
          <span class="symbol">+</span>
        </div>
        <div class="accordion-content">
          <p>In this section, you’ll explore the fundamentals of DevOps.</p>
          <ul>
            <li>Software Development Life Cycles</li>
            <li>Agile Methodology &amp; Scrum</li>
            <li>Why DevOps? Importance &amp; Automation</li>
          </ul>
        </div>
      </div>
    </div>

    <h2 class="section-title">2. Installing Pre-requisite Software</h2>
    <div class="accordion">
      <div class="accordion-item">
        <div class="accordion-header">
          <h3>Section Details</h3>
          <span class="symbol">+</span>
        </div>
        <div class="accordion-content">
          <p>Learn to set up the core environment for DevOps training.</p>
          <ul>
            <li>Create an AWS account</li>
            <li>Create EC2 Instance</li>
            <li>Understand Linux Command Line</li>
          </ul>
        </div>
      </div>
    </div>

    <h2 class="section-title">Additional Course Benefits</h2>
    <div class="additional-info">
      <ul>
        <li><strong>Course Duration:</strong> 6 Months</li>
        <li><strong>Interview Preparations Boot-Camp:</strong> 4 Weeks</li>
      </ul>
    </div>

    <section id="tools">
      <h2>Tools</h2>
      <div class="tools-category">
        <h3>CI/CD and Automation</h3>
        <p>
          <img src="https://img.shields.io/badge/-Jenkins-D24939?&style=for-the-badge&logo=Jenkins&logoColor=white" alt="Jenkins">
          <img src="https://img.shields.io/badge/-Terraform-623CE4?&style=for-the-badge&logo=Terraform&logoColor=white" alt="Terraform">
          <img src="https://img.shields.io/badge/-Ansible-EE0000?&style=for-the-badge&logo=Ansible&logoColor=white" alt="Ansible">
        </p>
      </div>
    </section>
  </div>

  <footer class="footer" id="footer">
    <p>Email: <a href="mailto:devopsacademy@gmx.com">devopsacademy@gmx.com</a>
      | Tel: 07533020152</p>
    <p>&copy; 2024 The DevOps Academy. All rights reserved.</p>
  </footer>

  <script src="<c:url value='/js/script.js'/>"></script>
</body>
</html>
