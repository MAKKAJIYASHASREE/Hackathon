<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "question";
String userid = "root";
String password = "root";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<body bgcolor="teal">
<center>
<h1 style="color:orange;bg-color:black">FEE RELATED QUESTIONS</h1>
<table border="1">
<tr>
<td>Name</td>
<td>Question</td>
<td>Answer</td>


</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql = "select * from tell where type='fee'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("question") %></td>
<td><%=resultSet.getString("answer") %></td>

</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}

%>
</table>
</center>
</body>
</html>