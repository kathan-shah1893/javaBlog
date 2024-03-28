<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- ... your existing head content ... -->
    <title>Add Notes Page</title>
    <link rel="stylesheet" href="style/style.css">
</head>
<body>
	<style>
		body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.container {

    background-color: white;
    border-radius: 10px;
    box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
    padding: 20px;
    width: 80%;
    max-width: 400px;
    text-align: center;
}
form textarea{
    resize: vertical;
}

form {

    margin-top: 20px;
}

label,
input,
textarea {
    display: block;
    margin-bottom: 10px;
    width: 100%;
    box-sizing: border-box;
}

button {
    background-color: #4CAF50;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

button:hover {
    background-color: #45a049;
}
			
	</style>
<%
//    int userId = (int) session.getAttribute("userid");
//    PrintWriter out1 = response.getWriter();
//    out1.println(userId);
%>
<div class="container">
    <h1>Add New Notes</h1>
    <form action="addPostProcess" method="post">
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" required>
        <label for="content">Content:</label>
        <textarea rows="6" id="content" name="content" required></textarea>

        <button type="submit">Add Notes</button>
    </form>
</div>

<%--<script src="script.js"></script>--%>
</body>

</html>
