<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Management System</title>
<style>
    /* General Styles */
    body {
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f0f2f5;
        color: #333;
    }

    /* Header Styles */
    header {
        background-color: #007BFF;
        color: #fff;
        padding: 20px;
        text-align: center;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    header h1 {
        margin: 0;
        font-size: 2.5em;
    }

    /* Navigation Bar Styles */
    nav {
        display: flex;
        justify-content: center;
        background-color: #0056b3;
        padding: 10px 0;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    nav a {
        color: #fff;
        text-decoration: none;
        margin: 0 20px;
        font-size: 16px;
        font-weight: bold;
        transition: color 0.3s ease;
    }
    nav a:hover {
        color: #ffcc00;
        text-decoration: underline;
    }

    /* Container Styles */
    .container {
        padding: 50px 20px;
        text-align: center;
        background-color: #fff;
        margin: 20px auto;
        max-width: 800px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .container h1 {
        font-size: 2em;
        color: #007BFF;
        margin-bottom: 10px;
    }
    .container h2 {
        font-size: 1.5em;
        color: #555;
        margin-bottom: 20px;
    }
    .container p {
        font-size: 1.1em;
        line-height: 1.6;
        color: #666;
    }

    /* Footer Styles */
    footer {
        background-color: #0056b3;
        color: #fff;
        text-align: center;
        padding: 10px 0;
        margin-top: 20px;
        font-size: 14px;
        box-shadow: 0 -2px 4px rgba(0, 0, 0, 0.1);
    }
</style>
</head>
<body>
    <header>
        <h1>Employee Management System</h1>
    </header>
    <nav>
        <a href="addEmployee.jsp">Add Employee</a>
        <a href="updateEmployeeById.jsp">Update Employee</a>
        <a href="viewEmployees">View Employees</a>
        <a href="deleteEmployeeById.jsp">Delete Employee</a>
         <a href="login.jsp">logout </a>
    </nav>
    <div class="container">
        <h1>${msg }</h1>
        <h2>Welcome to the Employee Management System</h2>
        <p>Use the navigation links above to manage employee records effectively and efficiently.</p>
    </div>
    <footer>
        &copy; 2025 Employee Management System. All rights reserved.
    </footer>
</body>
</html>
