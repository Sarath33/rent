<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%


 String userid=request.getParameter("userid");
session.setAttribute("email",userid);
Connection con = null;
ResultSet rs = null;
try{
String password=request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver"); 
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");
Statement st= con.createStatement();

	
	 	%> 
	 <jsp:forward page="/Tenant_home.jsp">
	<jsp:param name="get" value="<%=1%>" />
	   <jsp:param name="email" value="<%=userid %>" />
	   
	  </jsp:forward>
	<% 
	
	



rs.close();
con.close(); 
}
catch (Exception e) {
System.out.println(e);
}
	


%>

