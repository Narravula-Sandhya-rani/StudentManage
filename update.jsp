<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
 <%
try {
Connection connection = null;
Statement statement = null;
Statement statement1 = null;
ResultSet rs = null;
ResultSet rs1 = null;
Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/student?useSSL=false", "root", "sandhya@30");
statement = connection.createStatement();
statement1 = connection.createStatement();
String id= request.getParameter("id1");
String QueryString = "select * from studentdata where stu_ID="+id;
rs = statement.executeQuery(QueryString);
while (rs.next()) {
%>
<!DOCTYPE html>
<html>
    <body style="background-image: url(update.jpg);background-repeat: no-repeat;background-size: cover"><center>
<h1 style="color:orangered;font-family: cursive;">Update data</h1>
<form method="post" action="update-process.jsp" style="display: inline-block; background-color: lightgrey;border-radius: 0.8em;padding: 20px;margin-top: 0.2%;font-family: cursive;font-size: 18px;">
<input type="hidden" name="id" value="<%=rs.getInt("stu_ID") %>">
student ID:&nbsp;&nbsp; <input type="text" name="id" value="<%=rs.getInt("stu_ID") %>" style="padding: 5px; padding-left: 40px;text-align: left">
<br><br>
First name:&nbsp;&nbsp; 
<input type="text" name="first_name" value="<%=rs.getString("stu_firstname") %>" style="padding: 5px; padding-left: 40px;text-align: left">
<br><br>
Last name:&nbsp;&nbsp; 
<input type="text" name="last_name" value="<%=rs.getString("stu_lastname") %>" style="padding: 5px; padding-left: 40px;text-align: left">
<br><br>
Address:&nbsp;&nbsp; &nbsp; 
<input type="text" name="address" value="<%=rs.getString("stu_address") %>" style="padding: 5px; padding-left: 40px;text-align: left">
<br><br>
Phone no:&nbsp;&nbsp;&nbsp;  
<input type="text" name="phno" value="<%=rs.getString("stu_phno") %>" style="padding: 5px; padding-left: 40px;text-align: left">
<br><br>
<input type="submit" value="submit">
</form><br><br>
<a href="studentsdisplay.jsp" style="color: brown;font-size: 20px;padding: 8px; font-family: cursive; background-color:palevioletred;color:white;text-decoration: none"><--BACK<br></a><br><br>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</center>
</body>
</html>