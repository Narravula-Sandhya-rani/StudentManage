<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String id = request.getParameter("id");
String first_name=request.getParameter("first_name");
String last_name=request.getParameter("last_name");
String address=request.getParameter("address");
String phno=request.getParameter("phno");
if(id != null)
{
Connection connection = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try {
Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/student?useSSL=false", "root", "sandhya@30");
String QueryString = "update studentdata set stu_ID=?,stu_firstname=?,stu_lastname=?,stu_address=?,stu_phno=? where stu_ID="+id;
ps = connection.prepareStatement(QueryString);
ps.setString(1,id);
ps.setString(2, first_name);
ps.setString(3, last_name);
ps.setString(4, address);
ps.setString(5, phno);
int i = ps.executeUpdate();%>
<html>
    <head></head>
    <body style="background-color: whitesmoke;font-style: cursive;color: green;padding-top: 18%;font-size: 30px;">
</html>
<center>
<%
if(i > 0)
{
out.print("Record Updated Successfully");
}
else
{
out.print("There is a problem in updating Record.");
}%>
<FORM ACTION="studentsdisplay.jsp" method="get" ><br><br>
<button type="submit" style="padding: 10px;padding-left: 12px;padding-right: 12px;background-color: black;color: white;"><-- back</button>
</center></body>
<%
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>