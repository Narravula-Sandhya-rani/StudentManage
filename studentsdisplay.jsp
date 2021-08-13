<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
<head>
<title>students display</title>
</head>
<body style="background-image: url(display.jpg);background-repeat: no-repeat;background-size: cover">
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
String QueryString = "SELECT * from studentdata";
rs = statement.executeQuery(QueryString);
String ss= request.getParameter("stuid");
String Query = "SELECT * from studentdata where stu_ID like '"+ss+"'";
rs1 = statement1.executeQuery(Query);
%>
    <center>
        <form ACTION="studentsdisplay.jsp" method="get" style="font-family:cursive;">
            <span style="color:blue;font-size: 20px;">search </span>student by student ID :
      <input type="text" name ="stuid" value="" style="padding: 7px;padding-left: 100px;">
      <button type="submit" name="submit" style="padding-left: 20px;padding: 7px;text-align: center;">Search</button><br><br>
        </form>
 <TABLE cellpadding="15" border="1" style="background-color: palevioletred; font-family: cursive;">
            <TR>
                
    <%if(request.getParameter("submit")!=null){%>
    <%
        while (rs1.next()) {
        %>
<TD style="background-color:  #ff47a3;color: white"><%=rs1.getInt(1)%></TD>
<TD style="background-color: #ff7abd"><%=rs1.getString(2)%></TD>
<TD style="background-color: #ff99cc"><%=rs1.getString(3)%></TD>
<TD style="background-color:  #ffb8db"><%=rs1.getString(4)%></TD>
<TD style="background-color: #ffcce6 "><%=rs1.getString(5)%></TD>
<td><a href="update.jsp?id1=<%=rs1.getString("stu_ID")%>">update</a></td>
<TD style="background-color: #ffebf5"> <a href="delete.jsp?id=<%=rs1.getString("stu_ID") %>" style="color: brown;font-size: 20px; font-family: cursive;background-color:#ff3d8f;color: white;text-decoration: none;padding: 4px;"> DELETE<br></TD>
        </TR></TABLE><br><br>
<% }%>
<% }%>
<table>
    <tr><td> <h2 style="color: black;font-family: verdana;padding: 6px;">Students List</h2></td>
        <td><a href="index.jsp" style="color: brown;font-size: 18px;font-family: cursive; background-color: #ccff00;color: black;padding: 2px;text-decoration: none"> <--BACK<br></a><br><br></td></tr></table>
<TABLE cellpadding="15" border="1" style="background-color: mintcream; font-family: cursive;overflow-y:scroll;">
    <th style="background-color: #008a99"><p style="color: white">S.No</p>
    <td  style="background-color: #008a99;color: white">ID</td> 
    <td  style="background-color: #008a99;color: white">First Name</td>
    <td  style="background-color: #008a99;color: white">Last Name</td> 
    <td  style="background-color:#008a99;color: white">Address</td> 
    <td  style="background-color: #008a99;color: white">Contact No</td>
    </th>
<%
    int k=1;
while (rs.next()) {
%>
<TR>
    <TD style="background-color: #33cccc "><%=k++%></TD>
<TD style="background-color: #70dbdb "><%=rs.getInt(1)%></TD>
<TD style="background-color:#a3e8e8 "><%=rs.getString(2)%></TD>
<TD style="background-color: #c2f0f0 "><%=rs.getString(3)%></TD>
<TD  style="background-color:#d6f5f5"><%=rs.getString(4)%></TD>
<TD style="background-color:  #e0f7f7"><%=rs.getString(5)%></TD>
</TR>
<% } %>
<%
// close all the connections.
rs.close();
statement.close();
connection.close();
} catch (Exception ex) {
%>
</font>
<font size="+3" color="red"></b>
<%
out.println("Unable to connect to database.");
}
%>
</TABLE>
</font>
    </center>
</body>
</html>
