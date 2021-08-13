<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String id=request.getParameter("id");
try
{
    String connectionURL = "jdbc:mysql://localhost:3307/book";
    Connection connection = null;
    Statement statement = null;
ResultSet rs = null;
Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/student?useSSL=false", "root", "sandhya@30");
statement = connection.createStatement();
int i=statement.executeUpdate("DELETE FROM studentdata WHERE stu_ID="+id);
out.println("Data Deleted Successfully!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>