<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Address</title>
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
        <h2>Add Address</h2>
        <form action="addAddress" method="get">
        	<label for="id">Employee Id:</label>
            <input type="text" id="id" name="id" value="${id }" readonly="readonly" required>
        	
            <label for="doorno">Door No:</label>
            <input type="text" id="doorNo" name="doorNo" required>

            <label for="streetname">Street Name:</label>
            <input type="text" id="streetName" name="streetName" required>

            <label for="place">Place:</label>
            <input type="text" id="place" name="place" required>

            <label for="city">City:</label>
            <input type="text" id="city" name="city" required>

            <label for="pincode">Pincode:</label>
            <input type="number" id="pincode" name="pincode" required>

            <label for="state">State:</label>
            <input type="text" id="state" name="state" required>

            <label for="country">Country:</label>
            <input type="text" id="country" name="country" required>

            <label for="type">Type:</label>
            <select id="type" name="type">
                <option value="permanent" selected>Permanent</option>
                <option value="temporary">Temporary</option>
            </select>

            <button type="submit">Add Address</button>
        </form>
    </div>
</body>
</html>
