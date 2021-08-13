
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String id=request.getParameter("stu_id");
try
{
    String connectionURL = "jdbc:mysql://localhost:3307/book";
    Connection connection = null;
    Statement statement = null;
ResultSet rs = null;
Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/student?useSSL=false", "root", "sandhya@30");
statement = connection.createStatement();
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}%>
<!DOCTYPE html>
<html>
<head>
<title>Student Management</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
    body{
        background-image: url('studentmanagement.jpg');
        background-size: cover;
        background-repeat: no-repeat no-repeat;
        background-position: center;
        background-attachment: fixed;
    }
</style>
</head>
<body style="font-family:cursive">
<center>
    <h2 style="font-family: cursive;border-color: white;">Student Management </h2><br><br><br>
    <a href="studentsdisplay.jsp" style="color: brown;font-size: 20px; font-family: cursive;background-color: brown;color: white;text-decoration: none"> View All Students<br>
</a><BR>
<!--<TABLE>
<TR>
    <TD><form ACTION="studentsearch.jsp" method="get" style="font-family:cursive;">
            <span style="color:blue;font-size: 20px;">search </span>student by student ID :
      <input type="text" name ="stuid" value="" style="padding: 7px;padding-left: 100px;">
      <button type="submit" style="padding-left: 20px;padding: 7px;text-align: center;">Search</button><br><br></TD>  
</TR>
</TABLE>-->
<!--<TABLE>
<TR>
    <TD><form ACTION="deletedata.jsp"  method="get">
      <span style="color:red;font-size: 20px;">Delete </span> student by student ID :
      <input type="text" name ="stu_id" value="" style="padding: 7px;padding-left: 100px;">
      <button type="submit" style="padding-left: 20px;padding: 7px;text-align: center;color: white;background-color: red;">DELETE</button><br><br><br></TD>  
</TR>
</TABLE>-->
<a href="getstudentdata.html" style="color: brown;font-size: 20px;padding: 8px; font-family: cursive; background-color: greenyellow;color: black;text-decoration: none"> ADD Student<br></a><br><br>

</center>
</body>
</html>

