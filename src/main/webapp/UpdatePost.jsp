<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Notes</title>
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
    PrintWriter out1 = response.getWriter();
    int postId = Integer.parseInt(request.getParameter("postId"));
    String title = ""; // Initialize title variable
    String content = ""; // Initialize content variable

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javanotes");
        Statement stmt = conn.createStatement();
        String sql = "SELECT * FROM notespost WHERE notes_id='" + postId + "'";
        ResultSet rs = stmt.executeQuery(sql);
        if(rs.next()) {
            title = rs.getString(3);
            content = rs.getString(4);
        } else {
            out1.print("Failed to retrieve post data.");
            return; // Exit if post data retrieval fails
        }
    } catch (Exception e) {
        out1.print("Error: " + e.getMessage());
        return; // Exit if an error occurs
    }
%>

<div class="container">
    <h1>Edit Notes</h1>
    <form action="updatePostProcess" method="post">
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" value="<%= title %>">
        <label for="content">Content:</label>
        <textarea rows="6" id="content" name="content" required><%= content %></textarea>

        <input type="hidden" name="postId" value="<%= postId %>"> <!-- Include the postId as a hidden input field -->
        <button type="submit">Update Notes</button>
    </form>
</div>
</body>
</html>
