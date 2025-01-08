<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Employees</title>
<style>
    /* General Styling */
    body {
        font-family: 'Roboto', Arial, sans-serif;
        background-color: #f0f2f5;
        margin: 0;
        padding: 20px;
        color: #333;
    }

    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
        font-size: 2em;
    }

    h1 {
        text-align: center;
        color: #007BFF;
        font-size: 1.5em;
    }

    /* Button Styling */
    a button, td a button {
        background-color: #007BFF;
        color: white;
        border: none;
        padding: 10px 15px;
        margin: 5px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 14px;
        transition: all 0.3s ease-in-out;
    }

    a button:hover, td a button:hover {
        background-color: #0056b3;
        transform: scale(1.05);
    }

    td a button.delete {
        background-color: #FF5733;
    }

    td a button.delete:hover {
        background-color: #C70039;
    }

    td a button.view-more {
        background-color: #17a2b8;
    }

    td a button.view-more:hover {
        background-color: #117a8b;
    }

    /* Table Styling */
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px auto;
        background-color: #fff;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        overflow: hidden;
    }

    th, td {
        border: 1px solid #ddd;
        text-align: left;
        padding: 12px 15px;
    }

    th {
        background-color: #007BFF;
        color: #fff;
        text-transform: uppercase;
        font-size: 14px;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

    td {
        font-size: 14px;
    }

    /* Action Buttons */
    .actions {
        text-align: center;
        margin-bottom: 20px;
    }

    .actions a button {
        display: inline-block;
    }

    /* Add some responsiveness */
    @media (max-width: 768px) {
        body {
            padding: 10px;
        }

        table, th, td {
            font-size: 12px;
        }

        a button, td a button {
            padding: 8px 10px;
            font-size: 12px;
        }

        h2, h1 {
            font-size: 1.5em;
        }
    }
</style>
</head>
<body>
    <h2>Employee Details</h2>
    <h1>${msg }</h1>
    <div class="actions">
        <a href="addEmployee.jsp"><button>Add Employee</button></a>
        <a href="index.jsp"><button>Back</button></a>
        <a href="viewInactive"><button>view Inactive</button></a>
    </div>
    <table>
        <thead>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Department</th>
                <th>Date of Joining</th>
                <th>Salary</th>
                <th>Experience</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="e" items="${rl}">
                <tr>
                    <td>${e.getFirstName()}</td>
                    <td>${e.getLastName()}</td>
                    <td>${e.getEmail()}</td>
                    <td>${e.getPhone()}</td>
                    <td>${e.getDepartment()}</td>
                    <td>${e.getDateOfJoin()}</td>
                    <td>${e.getSalary()}</td>
                    <td>${e.getExperience()}</td>
                    <td>
                        <a href="updateEmp?id=${e.getId()}">
                            <button>Update</button>
                        </a>
                        <a href="deleteEmp?id=${e.getId()}">
                            <button class="delete">Delete</button>
                        </a>
                        <a href="viewMore?id=${e.getId()}">
                            <button class="view-more">View More</button>
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
