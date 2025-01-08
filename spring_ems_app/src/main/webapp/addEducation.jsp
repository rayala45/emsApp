<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Education Form</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 20px;
        padding: 20px;
    }
    form {
        max-width: 400px;
        margin: auto;
    }
    label {
        display: block;
        margin-top: 10px;
    }
    input, select, button {
        width: 100%;
        padding: 8px;
        margin-top: 5px;
        box-sizing: border-box;
    }
    button {
        margin-top: 20px;
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

<h2>Add Education details</h2>
<form action="addEducation" method="get">
	<label for="id">Employee Id:</label>
            <input type="text" id="id" name="id" value="${id }" readonly="readonly" required>
            
    <label for="qualification">Qualification:</label>
    <input type="text" id="qualification" name="qualification" required>

    <label for="university">University:</label>
    <input type="text" id="university" name="university" required>

    <label for="yearOfStart">Year of Start:</label>
    <input type="number" id="yearOfStart" name="yearOfStart" min="1900" max="2100" required>

    <label for="yearOfPassout">Year of Passout:</label>
    <input type="number" id="yearOfPassout" name="yearOfPassout" min="1900" max="2100" required>

    <label for="percentage">Percentage:</label>
    <input type="number" id="percentage" name="percentage" step="0.01" min="0" max="100" required>

    <label for="highestQualify">Highest Qualification:</label>
    <select id="highestQualify" name="highestQualify">
        <option value="yes" selected>Yes</option>
        <option value="no">No</option>
    </select>

    <button type="submit">Submit</button>
</form>

</body>
</html>
