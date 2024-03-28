package com.example.blogging;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


import javax.servlet.http.HttpServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addPostProcess")
public class PostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        int userId = (int) request.getSession().getAttribute("userid");

        String jdbcUrl = "jdbc:mysql://localhost:3306/javanotes";

        try (Connection connection = DriverManager.getConnection(jdbcUrl)) {
            String sql = "INSERT INTO notespost (title, content, student_id) VALUES (?, ?, ?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, title);
                preparedStatement.setString(2, content);
                preparedStatement.setInt(3, userId);
                preparedStatement.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace(); 
            response.sendRedirect("error.jsp"); 
            return;
        }
//        System.out.print(request.getSession().getAttribute("userid"));
        System.out.print(title+" "+content);
//        RequestDispatcher rd=request.getRequestDispatcher("Welcome.jsp");
//        rd.forward(request, response);
        response.sendRedirect("Welcome.jsp"); 
    }
}
