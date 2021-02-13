<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%!
String userid=null;%>
<%
String email = null;
 email=request.getParameter("email");
session.setAttribute("email",email); 
Connection con = null;
ResultSet rs = null;
try{
	String get = request.getParameter("get");
 email=request.getParameter("email");
String password=request.getParameter("password");
String username=request.getParameter("username");
String contact=request.getParameter("contact");
Class.forName("com.mysql.jdbc.Driver"); 
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");
Statement st= con.createStatement();
String query = "insert into Admin(Get,email,pass,Username,Contact) values('"+get+"','"+email+"','"+password+"','"+username+"','"+contact+"')";
 st.executeUpdate(query);


	
	%> 
<jsp:forward page="/login.jsp">

  <jsp:param name="userid" value="<%=email %>" />
  <jsp:param name="get" value="<%=get %>" />
  <jsp:param name="password" value="<%=password %>" />
  
 </jsp:forward>
<% 
rs.close();
con.close(); 
}
catch (Exception e) {
System.out.println(e);
}
	

%>

    