<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Form</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    .container {
        width: 400px;
        margin: 50px auto;
        background: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    h2 {
        text-align: center;
        color: #333;
    }
    form {
        display: flex;
        flex-direction: column;
    }
    label {
        margin-top: 10px;
        font-size: 14px;
        color: #555;
    }
    input, select {
        padding: 8px;
        margin-top: 5px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 14px;
    }
    button {
        margin-top: 20px;
        padding: 10px;
        background-color: #28a745;
        color: #fff;
        border: none;
        border-radius: 4px;
        font-size: 16px;
        cursor: pointer;
    }
    button:hover {
        background-color: #218838;
    }
</style>
</head>
<body>
    <div class="container">
        <h2>Sign Up</h2>
        <form action="createEmp" method="post">
            <label for="firstname">First Name:</label>
            <input type="text" id="firstname" name="firstname" required>

            <label for="lastname">Last Name:</label>
            <input type="text" id="lastname" name="lastname" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="phone">Phone:</label>
            <input type="tel" id="phone" name="phone" required>

            <label for="department">Department:</label>
            <input type="text" id="department" name="department" required>

            <label for="salary">Salary:</label>
            <input type="number" id="salary" name="salary" required>

            <label for="status">Status:</label>
            <select id="status" name="status">
                <option value="active" selected>Active</option>
                <option value="inactive">Inactive</option>
            </select>

            <label for="experience">Experience:</label>
            <select id="experience" name="experience">
                <option value="yes" selected>Yes</option>
                <option value="no">No</option>
            </select>
             <label for="password">password:</label>
            <input type="text" id="password" name="password" required>

            <button type="submit">Sign Up</button>
        </form>
    </div>
</body>
</html>
