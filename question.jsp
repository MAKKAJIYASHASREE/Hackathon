<%@page import="java.sql.*"%>
<%
String name= request.getParameter("name");
String type = request.getParameter("type");
String question = request.getParameter("question");

try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/question","root","root");
	Statement st = con.createStatement();
	st.executeUpdate("insert into post (name,type,question) values('"+name+"','"+type+"','"+question+"')");
	response.sendRedirect("question.html");
}
catch(Exception e) {
	out.println(e);	
}
%>