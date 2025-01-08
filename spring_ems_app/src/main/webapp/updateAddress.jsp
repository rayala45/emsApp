<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Address</title>
<style>
    /* Body styling */
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f9f9f9;
        margin: 0;
        padding: 0;
    }

    /* Centered form container */
    .form-container {
        max-width: 500px;
        margin: 50px auto;
        background: #ffffff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    /* Form heading */
    h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #333;
    }

    /* Form labels */
    label {
        font-size: 14px;
        color: #555;
        margin-bottom: 5px;
        display: block;
    }

    /* Form inputs and dropdown */
    input, select {
        width: calc(100% - 16px);
        padding: 8px;
        margin-bottom: 15px;
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

    /* Submit button */
    button {
        width: 100%;
        padding: 10px;
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
    <h2>Update Address</h2>
    <form action="updateAddress" method="post">
        <label for="eid">EID:</label>
        <input type="text" id="eid" name="eid" value="${eid}" readonly="readonly" required>

        <label for="id">ID:</label>
        <input type="text" id="id" name="id" value="${ad.getId()}" readonly="readonly" required>

        <label for="doorno">Door Number:</label>
        <input type="text" id="doorNo" name="doorNo" value="${ad.getDoorNo()}" required>

        <label for="streetname">Street Name:</label>
        <input type="text" id="streetName" name="streetName" value="${ad.getStreetName()}" required>

        <label for="place">Place:</label>
        <input type="text" id="place" name="place" value="${ad.getPlace()}" required>

        <label for="city">City:</label>
        <input type="text" id="city" name="city" value="${ad.getCity()}" required>

        <label for="pincode">Pincode:</label>
        <input type="number" id="pincode" name="pincode" value="${ad.getPincode()}" required>

        <label for="state">State:</label>
        <input type="text" id="state" name="state" value="${ad.getState()}" required>

        <label for="country">Country:</label>
        <input type="text" id="country" name="country" value="${ad.getCountry()}" required>

        <label for="type">Type:</label>
        <select id="type" name="type" required>
            <option value="PERMANENT" ${ad.getType() == AddressType.PERMANENT ? 'selected' : ''}>Permanent</option>
            <option value="TEMPORARY" ${ad.getType() == AddressType.TEMPORARY ? 'selected' : ''}>Temporary</option>
        </select>

        <button type="submit">Update</button>
    </form>
</div>

</body>
</html>
