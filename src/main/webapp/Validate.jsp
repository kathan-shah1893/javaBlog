<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: Adity
  Date: 30-10-2023
  Time: 10:55 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
		PrintWriter out1 = response.getWriter();
    try {
    	try{
    		Class.forName("com.mysql.jdbc.Driver");
    	}catch(Exception e)
    	{
    		out1.print(e);
    	}
        
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javanotes");
        Statement stmt = conn.createStatement();
        String user  = request.getParameter("username");
        System.out.println(user);
        String pass = request.getParameter("password");
        System.out.println(pass);
        String sql = "Select * from student where student_name='"+user+"'and student_password='"+pass+"'";
        ResultSet rs = stmt.executeQuery(sql); 
        if(rs.next()) {
            HttpSession s1  = request.getSession();
            s1.setAttribute("username",user);
            s1.setAttribute("userid",rs.getInt(1));
            response.sendRedirect("home");
//            response.sendRedirect("")
//            RequestDispatcher rd=request.getRequestDispatcher("Welcome.jsp");
//            rd.forward(request,response);
            out1.print("Success"); 
        } else {
            out1.print("Failed"); 
        }
        rs.close(); 
        stmt.close(); 
        conn.close(); 
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
</html>