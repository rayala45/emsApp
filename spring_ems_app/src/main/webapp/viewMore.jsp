<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Information</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 20px;
    }

    .container {
        max-width: 700px;
        margin: 0 auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    .section {
        margin-bottom: 20px;
        padding: 15px;
        background-color: #f9f9f9;
        border-radius: 5px;
    }

    .section h3 {
        margin-top: 0;
        color: #444;
        text-align: center;
        margin-bottom: 10px;
    }

    .info-table {
        width: 100%;
        border-collapse: collapse;
    }

    .info-table th, .info-table td {
        padding: 10px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    .info-table th {
        background-color: #007BFF;
        color: white;
        font-weight: bold;
        text-align: center;
    }

    .info-table td {
        color: #555;
    }

    .info-table tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    .buttons a button {
        background-color: #007BFF;
        color: white;
        border: none;
        padding: 10px 15px;
        border-radius: 5px;
        cursor: pointer;
        margin-right: 10px;
        font-size: 14px;
    }

    .buttons a button:hover {
        background-color: #0056b3;
    }

    a button {
        display: inline-block;
        margin-top: 20px;
        background-color: #4CAF50;
        color: white;
        border: none;
        padding: 10px 15px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 14px;
    }

    a button:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>
    <div class="container">
        <h2>Employee Information</h2>
        <h1>${msg }</h1>
        <!-- General Information Section -->
        <div class="section">
            <h3>General Information</h3>
            <table class="info-table">
                <tr>
                    <th>Field</th>
                    <th>Details</th>
                </tr>
                <tr>
                    <td>ID</td>
                    <td>${e.getId()}</td>
                </tr>
                <tr>
                    <td>First Name</td>
                    <td>${e.getFirstName()}</td>
                </tr>
                <tr>
                    <td>Last Name</td>
                    <td>${e.getLastName()}</td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>${e.getEmail()}</td>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td>${e.getPhone()}</td>
                </tr>
                <tr>
                    <td>Department</td>
                    <td>${e.getDepartment()}</td>
                </tr>
                <tr>
                    <td>Date of Joining</td>
                    <td>${e.getDateOfJoin()}</td>
                </tr>
                <tr>
                    <td>Salary</td>
                    <td>${e.getSalary()}</td>
                </tr>
                <tr>
                    <td>Status</td>
                    <td>${e.getStatus()}</td>
                </tr>
                <tr>
                    <td>Experience</td>
                    <td>${e.getExperience()}</td>
                </tr>
            </table>
            <a href="updateEmp?id=${e.getId()}">
                <button>Update</button>
            </a>
             <a href="StatusEmp?id=${e.getId()}&Status=${e.getStatus()}">
                <button>change Status</button>
            </a>
        </div>

        
        <div class="section">
            <h3>Education</h3>
            <div class="buttons">
                <a href="viewEducation?id=${e.getId()}">
                    <button>View Education</button>
                </a>
                <a href="addEdu?id=${e.getId()}">
                    <button>Add Qualification</button>
                </a>
            </div>
        </div>

       
        <div class="section">
            <h3>Address</h3>
            <div class="buttons">
                <a href="viewAddress?id=${e.getId()}">
                    <button>View Address</button>
                </a>
                <a href="addAddr?id=${e.getId()}">
                    <button>Add Address</button>
                </a>
            </div>
        </div>

        <!-- Back to List Button -->
        <a href="viewEmployees">
            <button>Back</button>
        </a>
    </div>
</body>
</html>
