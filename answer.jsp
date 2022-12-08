<%@page import="java.sql.*"%>
<%
String name= request.getParameter("name");
String type = request.getParameter("type");
String question = request.getParameter("question");
String answer = request.getParameter("answer");

try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/question","root","root");
	Statement st = con.createStatement();
	st.executeUpdate("insert into tell (name,type,question,answer) values('"+name+"','"+type+"','"+question+"','"+answer+"')");
	response.sendRedirect("answer.html");
}
catch(Exception e) {
	out.println(e);	
}
%>