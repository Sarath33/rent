<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*,java.util.*"%>
<%


String status = request.getParameter("status");
String id = request.getParameter("id");
Connection con = null;
  ResultSet rs = null;
  try{

  	Class.forName("com.mysql.jdbc.Driver"); 
  	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");
  	Statement st= con.createStatement();
  	
	String query = " update  complaints set complaint_status='"+status+"' where complaint_id='"+id+"' ";
	
	st.executeUpdate(query);
	
	System.out.println("updated");
  }
  catch(Exception e)
  {
	  System.out.println(e);
  }

	String unit_id = (String)session.getAttribute("unit_id");
%>

<jsp:forward page="/view_complaint.jsp">

  <jsp:param name="dd" value="sks" />
  
 </jsp:forward>