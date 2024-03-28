package com.example.blogging;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/getPosts")
public class GetPostServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Post> posts = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String jdbcUrl = "jdbc:mysql://localhost:3306/blogg";

        try (Connection connection = DriverManager.getConnection(jdbcUrl)) {
            String sql = "SELECT * FROM blogpost";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                ResultSet resultSet = preparedStatement.executeQuery();
//                System.out.println(resultSet.getInt(1));
                while (resultSet.next()) {
                    int postId = resultSet.getInt(1);
                    String title = resultSet.getString(3);
                    String content = resultSet.getString(4);

                    // Create a Post object and add it to the list
                    Post post = new Post(postId, title, content);
                    posts.add(post);
                    System.out.println("post"+post);
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Handle exceptions properly in your application
            response.sendRedirect("error.jsp"); // Redirect to an error page on database errors
            return;
        }

        // Set the list of posts as a request attribute
        request.setAttribute("posts", posts);
//        System.out.println("post is a "+posts);

        // Forward the request to the JSP page for rendering
        request.getRequestDispatcher("Welcome.jsp").forward(request, response);
    }
}
