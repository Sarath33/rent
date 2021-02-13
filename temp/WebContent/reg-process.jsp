<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,temp.Register_process"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@page import="java.sql.*,java.util.*"%>

<%

String email=request.getParameter("email");

String password=request.getParameter("password");
Class.forName("org.sqlite.JDBC");
Connection con = null;
try
{
	
	Class.forName("com.mysql.jdbc.Driver"); 
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");
Statement st=con.createStatement();
String query = "insert into Admin(uname,pass)values('"+email+"','"+password+"')";
st.executeUpdate(query);
out.println("Thank you for register ! Please <a href='index.html'>Login</a> to continue.");
con.close();
}
catch(Exception e)
{
System.out.print(e);

}

%>