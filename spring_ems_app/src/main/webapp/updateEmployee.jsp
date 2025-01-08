<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Employee Details</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        margin: 0;
        padding: 20px;
    }

    .form-container {
        max-width: 500px;
        margin: 50px auto;
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
        margin-top: 10px;
    }

    input, select, button {
        width: calc(100% - 16px);
        padding: 8px;
        margin-top: 5px;
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 14px;
        background-color: #fafafa;
        box-sizing: border-box;
    }

    input:focus, select:focus {
        border-color: #4CAF50;
        outline: none;
    }

    button {
        width: 100%;
        padding: 10px;
        margin-top: 20px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 4px;
        font-size: 16px;
        cursor: pointer;
    }

    button:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>
<div class="form-container">
    <h2>Update Employee Details</h2>
    <form action="updateEmployee" method="post">
        <label for="id">Employee ID:</label>
        <input type="text" id="id" name="id" value="${e.getId()}" readonly>

        <label for="firstName">First Name:</label>
        <input type="text" id="firstName" name="firstName" value="${e.getFirstName()}" required>

        <label for="lastName">Last Name:</label>
        <input type="text" id="lastName" name="lastName" value="${e.getLastName()}" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="${e.getEmail()}" required>

        <label for="phone">Phone:</label>
        <input type="text" id="phone" name="phone" value="${e.getPhone()}" required>

        <label for="department">Department:</label>
        <input type="text" id="department" name="department" value="${e.getDepartment()}" required>

        <label for="salary">Salary:</label>
        <input type="number" id="salary" name="salary" value="${e.getSalary()}" required>

        <label for="status">Status:</label>
        <select id="status" name="status" required>
            <option value="ACTIVE" ${e.getStatus() == EmployeeStatus.ACTIVE ? 'selected' : ''}>Active</option>
            <option value="INACTIVE" ${e.getStatus() == EmployeeStatus.INACTIVE ? 'selected' : ''}>Inactive</option>
        </select>

        <label for="experience">Experience:</label>
        <select id="experience" name="experience" required>
            <option value="YES" ${e.getExperience() == EmployeeExperience.YES ? 'selected' : ''}>Yes</option>
            <option value="NO" ${e.getExperience() == EmployeeExperience.NO ? 'selected' : ''}>No</option>
        </select>
        <label for="password">password:</label>
        <input type="text" id="password" name="password" value="${e.getPassword()}" required>
        

        <button type="submit">Update</button>
    </form>
</div>
</body>
</html>
