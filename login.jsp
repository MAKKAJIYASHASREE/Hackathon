<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String userid=request.getParameter("userid"); 
session.putValue("userid",userid);
String password=request.getParameter("password"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/question","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from login where userid='"+userid+"' and password='"+password+"'"); 
try{
	while(rs.next())
	{
	        if(rs.getString("userid").equals(userid)&&rs.getString("password").equals(password)) 
			 
	        	response.sendRedirect("Question Domain.html");
			
	        else
	        {
	        	response.sendRedirect("login.html");
	        }
	}
}
catch (Exception e) {
e.printStackTrace();
}
%>