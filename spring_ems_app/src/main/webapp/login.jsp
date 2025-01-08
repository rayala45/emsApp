<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f9;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .login-container {
        background-color: #ffffff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        width: 300px;
    }
    .login-container h1 {
        text-align: center;
        margin-bottom: 20px;
        color: #333333;
    }
    .login-container label {
        display: block;
        margin-bottom: 8px;
        color: #555555;
        font-weight: bold;
    }
    .login-container input[type="email"],
    .login-container input[type="password"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #cccccc;
        border-radius: 4px;
        box-sizing: border-box;
    }
    .login-container button {
        width: 100%;
        padding: 10px;
        background-color: #007bff;
        color: #ffffff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
    }
    .login-container button:hover {
        background-color: #0056b3;
    }
    .login-container .links {
        text-align: center;
        margin-top: 15px;
    }
    .login-container .links a {
        color: #007bff;
        text-decoration: none;
        margin: 0 10px;
    }
    .login-container .links a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
    <div class="login-container">
        <h1>Login</h1>
        <h1>${msg }</h1>
        <form action="login" method="post">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <button type="submit">Login</button>
        </form>
        <div class="links">
            <a href="forgotpassword">Forgot Password?</a>
            <a href="addEmployee.jsp">Register</a>
        </div>
    </div>
</body>
</html>
