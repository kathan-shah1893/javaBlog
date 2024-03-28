<%@ page import="java.util.List" %>
<%@ page import="com.example.blogging.Post" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/style/style.css">
    <title>Notes Home Page</title>
</head>

<body>
<style>
	body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f1f1f1;
}

header {
    background-color: #333;
    color: white;
    padding: 10px 0;
    text-align: center;
}

nav ul {
    list-style-type: none;
}

nav ul li {
    display: inline;
    margin-right: 20px;
}

nav ul li a {
    color: white;
    text-decoration: none;
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}

.posts {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
}

.post {
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 5px;
    padding: 20px;
    margin: 10px;
    width: 300px;
    box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
}

footer {
        background-color: #333;
        color: white;
        text-align: center;
        padding: 10px 0;
        /* Remove the 'position: fixed;' property */
        width: 100%;
    }	
</style>
<%

    if(session.isNew()){
        response.sendRedirect("Login.jsp");
    }
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        throw new RuntimeException(e);
    }

    List<Post> posts = new ArrayList<>();
    String jdbcUrl = "jdbc:mysql://localhost:3306/javanotes";

    try (Connection connection = DriverManager.getConnection(jdbcUrl)) {
        String sql = "SELECT * FROM notespost";
        if(request.getParameter("myposts") != null){
            sql = "SELECT * FROM notespost WHERE student_id="+session.getAttribute("userid");
        }
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int postId = resultSet.getInt(1);
                String title = resultSet.getString(3);
                String content = resultSet.getString(4);

                Post post = new Post(postId, title, content);
                posts.add(post);
            }
        }
    } catch (Exception e) {
        e.printStackTrace(); 
        response.sendRedirect("error.jsp");
        return;
    }
%>

<header>
    <nav>
        <div class="user-info">
            <p>Hello, <%= session.getAttribute("username") %></p>
        </div>
        <ul>
            <li><a href="getPosts">Home</a></li>
            <li><a href="Add">Add Notes</a></li>
            <li><a href="?myposts">Your Notes</a></li>
<%--            <li><a href="Login.jsp" onclick="<% session.invalidate(); %>">Log Out</a></li>--%>
        </ul>
    </nav>
</header>

<div class="container">
    <div class="posts">
        <%
            System.out.println("welcome" + posts);
            if (posts != null) {
                for (Post post : posts) {
        %>
        <div class="post">
            <h2><%= post.getTitle() %></h2>
            <p><%= post.getContent() %></p>
            <form action="/likePost" method="post">
                <input type="hidden" name="postId" value="<%= post.getId() %>">
                <input type="hidden" name="userId" value="<%= session.getAttribute("userid") %>">
                <input type="submit" value="Like">
            </form>
            <% if(request.getParameter("myposts") != null){%>
            <form action="UpdatePost.jsp?/post" method="post">
                <input type="hidden" name="postId" value="<%= post.getId() %>">
                <input type="submit" value="Update">
            </form>
            <form action="/deletePost" method="post">
                <input type="hidden" name="postId" value="<%= post.getId() %>">
                <br>
                <input type="submit" value="Delete">
            </form>
            <%}%>
        </div>
        <%
            }
        } else {
        %>
        <div class="post">
            <p>No posts available.</p>
        </div>
        <%
            }
        %>
    </div>
</div>


<footer>
    <div class="container">
        <p>&copy; 2023 Your Notes. All rights reserved.</p>
    </div>
</footer>

</body>
</html>
