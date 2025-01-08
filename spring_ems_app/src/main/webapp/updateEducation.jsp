<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Education Details</title>
<style>
    /* General body styling */
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        margin: 0;
        padding: 0;
    }

    /* Form container styling */
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

    /* Label and input styling */
    label {
        font-size: 14px;
        color: #555;
        display: block;
        margin-top: 10px;
    }

    input, select {
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

    /* Submit button styling */
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
    <h2>Update Education Details</h2>
    <form action="updateEducation" method="post">
    <label for="eid">EID:</label>
        <input type="text" id="eid" name="eid" value="${eid}" readonly="readonly" required>

        <label for="id">ID:</label>
        <input type="text" id="id" name="id" value="${ed.getId()}" readonly="readonly" required>
        <label for="qualification">Qualification:</label>
        <input type="text" id="qualification" name="qualification" value="${ed.getQualification()}" required>

        <label for="university">University:</label>
        <input type="text" id="university" name="university" value="${ed.getUniversity()}" required>

        <label for="yearOfStart">Year of Start:</label>
        <input type="number" id="yearOfStart" name="yearOfStart" value="${ed.getYearOfStart()}" required>

        <label for="yearOfPassout">Year of Passout:</label>
        <input type="number" id="yearOfPassout" name="yearOfPassout" value="${ed.getYearOfPassout()}" required>

        <label for="percentage">Percentage:</label>
        <input type="number" id="percentage" name="percentage" value="${ed.getPercentage()}" step="0.01" required>

        <label for="highestQualify">Highest Qualification:</label>
        <select id="highestQualify" name="highestQualify" required>
            <option value="YES" ${ed.getHighestQualify() == EducationHigh.YES ? 'selected' : ''}>Yes</option>
            <option value="NO" ${ed.getHighestQualify() == EducationHigh.NO ? 'selected' : ''}>No</option>
        </select>

        <button type="submit">Update</button>
    </form>
</div>

</body>
</html>
