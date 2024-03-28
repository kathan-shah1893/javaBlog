package com.example.blogging;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import jakarta.servlet.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

@WebServlet("/updatePostProcess")
public class UpdatePostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        PrintWriter out = response.getWriter();
        int postId = Integer.parseInt(request.getParameter("postId"));
        String newTitle = request.getParameter("title");
        String newContent = request.getParameter("content");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javanotes");
            Statement stmt = conn.createStatement();

            // Construct the SQL query to update the blogpost table
            String sql = "UPDATE notespost SET title='" + newTitle + "', content='" + newContent + "' WHERE notes_id=" + postId;

            int rowsAffected = stmt.executeUpdate(sql);

            if (rowsAffected > 0) {
                out.print("Post updated successfully!");
            } else {
                out.print("Failed to update the post.");
            }

            conn.close();
        } catch (Exception e) {
            out.print("Error: " + e.getMessage());
        }
//        System.out.print(request.getSession().getAttribute("userid"));
        System.out.print(newTitle+" "+newContent);
//        RequestDispatcher rd=request.getRequestDispatcher("Welcome.jsp");
//        rd.forward(request, response);
        response.sendRedirect("Welcome.jsp?myposts"); // Redirect to a success page after adding the post
    }

}
