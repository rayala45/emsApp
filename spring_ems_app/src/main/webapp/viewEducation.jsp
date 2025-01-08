<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Qualifications</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 20px;
    }
    h1, h2 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }
    h1 {
        font-size: 1.5em;
    }
    h2 {
        font-size: 2em;
    }
    .action-buttons {
        display: flex;
        justify-content: center;
        gap: 10px;
        margin-bottom: 20px;
    }
    .action-buttons button {
        background-color: #4CAF50;
        color: white;
        border: none;
        padding: 10px 15px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 14px;
    }
    .action-buttons button:hover {
        background-color: #45a049;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin: auto;
        background-color: #ffffff;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        overflow: hidden;
    }
    th, td {
        text-align: left;
        padding: 12px;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #333;
        color: white;
    }
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    tr:hover {
        background-color: #f1f1f1;
    }
    td {
        font-size: 14px;
        color: #555;
    }
    .table-buttons button {
        background-color: #007BFF;
        color: white;
        border: none;
        padding: 5px 10px;
        border-radius: 4px;
        cursor: pointer;
        font-size: 12px;
    }
    .table-buttons button:hover {
        background-color: #0056b3;
    }
    .table-buttons button.delete {
        background-color: #FF4B4B;
    }
    .table-buttons button.delete:hover {
        background-color: #c70000;
    }
</style>
</head>
<body>
    <h2>Qualification Details</h2>
    <h1>${msg }</h1>
    <div class="action-buttons">
        <a href="addEdu?id=${eid }"><button>Add Qualification</button></a>
        <a href="viewMore?id=${eid }"><button>Back</button></a>
    </div>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Qualification</th>
                <th>University</th>
                <th>Year of Start</th>
                <th>Year of Passout</th>
                <th>Percentage</th>
                <th>Highest Qualification</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="e" items="${el }">
                <tr>
                    <td>${e.getId() }</td>
                    <td>${e.getQualification() }</td>
                    <td>${e.getUniversity() }</td>
                    <td>${e.getYearOfStart() }</td>
                    <td>${e.getYearOfPassout() }</td>
                    <td>${e.getPercentage() }</td>
                    <td>${e.getHighestQualify() }</td>
                    <td class="table-buttons">
                        <a href="deleteEdu?id=${e.getId() }&eid=${eid }">
                            <button class="delete">Delete</button>
                        </a>
                        <a href="editEdu?id=${e.getId() }&eid=${eid }">
                            <button>Edit</button>
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
