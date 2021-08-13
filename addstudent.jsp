<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
<head>
<title>display data from the table using jsp</title>
</head>
<body style="background-color: lightgrey">
    <center>
<h2 style="color: black;font-family: verdana;padding: 6px">Book Catalog</h2>
<%
try {
/* Create string of connection url within specified format with machine
name, port number and database name. Here machine name id localhost and
database name is student. */
String connectionURL = "jdbc:mysql://localhost:3307/book";
// declare a connection by using Connection interface
Connection connection = null;
/* declare object of Statement interface that is used for executing sql
statements. */
Statement statement = null;
// declare a resultset that uses as a table for output data from tha table.
ResultSet rs = null;
// Load JBBC driver "com.mysql.jdbc.Driver"
Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
/* Create a connection by using getConnection() method that takes parameters
of string type connection url, user name and password to connect to database.*/
connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/student?useSSL=false", "root", "sandhya@30");
/* createStatement() is used for create statement object that is used for
sending sql statements to the specified database. */
statement = connection.createStatement();
int id= Integer.parseInt(request.getParameter("stud_id"));
java.lang.String fn= request.getParameter("stud_fn");
java.lang.String ln= request.getParameter("stud_ln");
java.lang.String addr= request.getParameter("stud_addr");
java.lang.String phno= request.getParameter("stud_phno");
// sql query to retrieve values from the secified table.
int i = statement.executeUpdate("INSERT INTO studentdata(stu_ID,stu_firstname,stu_lastname,stu_address,stu_phno) VALUES ('"+id+"','"+fn+"','"+ln+"','"+addr+"','"+phno+"')");
%>
</font>
<font size="+3" color="green"></b>
<%
    out.println("Data is successfully inserted!");
} catch (Exception ex) {
%>
</font>
<font size="+3" color="red"></b>
<%
out.println(ex);
}
%>
<TABLE>
<TR>
    <TD><FORM ACTION="index.jsp" method="get" ><br><br>
<button type="submit" style="padding: 9px;padding-left: 12px;padding-right: 12px;background-color: black;color: white;"><--back</button></TD>
</TR>
</TABLE>
</font>
    </center>
</body>
</html>

