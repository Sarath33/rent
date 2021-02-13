<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*,java.util.*"%>



<%

String name = request.getParameter("doc_name");


System.out.println(name);


Connection con = null;
ResultSet rs = null;
try{

	Class.forName("com.mysql.jdbc.Driver"); 
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");
	
	 Statement  st=con.createStatement();
	 
	 String query = "delete from book where doc_id = '"+name+"' ";
	 
	 st.executeUpdate(query);
	 
	
}
catch(Exception e)
{
	System.out.println(e);
}

%>
<jsp:forward page="/Documents.jsp">

  <jsp:param name="e" value="ss" />
  
 </jsp:forward>
