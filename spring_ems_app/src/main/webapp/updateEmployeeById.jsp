<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UpdateById</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        margin: 0;
        padding: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .form-container {
        max-width: 300px;
        background: #ffffff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    label {
        font-size: 14px;
        color: #555;
        display: block;
        margin-bottom: 8px;
    }

    input, button {
        width: calc(100% - 16px);
        padding: 8px;
        margin-bottom: 20px;
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 14px;
    }

    input:focus {
        border-color: #4CAF50;
        outline: none;
    }

    button {
        background-color: #4CAF50;
        color: white;
        border: none;
        cursor: pointer;
    }

    button:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>
<div class="form-container">
    <h2>Enter Employee ID</h2>
    <form action="updateEmployeeById" method="post">
        <label for="employeeId">Employee ID:</label>
        <input type="text" id="employeeId" name="employeeId" placeholder="Enter ID" required>
        <button type="submit">Submit</button>
    </form>
</div>
</body>
</html>
