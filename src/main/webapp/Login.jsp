<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notes Website - Login</title>
    <style>
    body {
        margin: 0;
        padding: 0;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: #f2f2f2;
        font-family: Arial, sans-serif;
    }

    .container {
        background: #ffffff;
        padding: 40px;
        border-radius: 10px;
        text-align: center;
        box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.1);
    }

    h2 {
        margin-bottom: 30px;
        font-size: 28px;
        color: #333;
    }

    label {
        font-weight: bold;
        color: #333;
    }

    input[type="text"],
    input[type="password"] {
        width: calc(100% - 20px);
        margin: 10px 0;
        padding: 12px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }

    button {
        background-color: #4CAF50;
        color: white;
        padding: 12px 24px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }

    button:hover {
        background-color: #45a049;
    }

    p {
        margin-top: 20px;
        font-size: 16px;
        color: #555;
    }

    a {
        text-decoration: none;
        color: #4CAF50;
        font-weight: bold;
    }

    a:hover {
        color: #45a049;
    }
</style>

</head>

<body>
<div class="container">
    <h2>Login to Your Account</h2>
    <form action="Validate.jsp" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>

        <button type="submit">Login</button>
    </form>
    <p>Don't have an account? <a href="Register.jsp">Register here</a>.</p>
</div>
</body>

</html>
