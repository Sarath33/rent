<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*,java.util.*"%>
    
    <%
    Connection con = null;
    ResultSet rs = null;
    try{
    	 String password=request.getParameter("password");
    	 Class.forName("com.mysql.jdbc.Driver"); 
    	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");
    	 Statement st= con.createStatement();
    	 String id = (String)session.getAttribute("u_id");
    	 System.out.println("unit id "+id);
    	 String unit_name = (String)request.getParameter("uname");
    	 String tenant_name = (String)request.getParameter("tenant_name");
    	 String tenant_email = (String)request.getParameter("tenant_email");
    	 String tenant_contact = (String)request.getParameter("tenant_contact");
    	 String r_type = (String)request.getParameter("r_type");
    	 String rent_amount = (String)request.getParameter("rent_amount");
    	 String email = (String)session.getAttribute("email");
   
    	 String query = "update Unit set unit_name='"+unit_name+"' ,tenant_name ='"+tenant_name+"' ,tenant_email='"+tenant_email+"',tenant_contact='"+tenant_contact+"',rent_amount='"+rent_amount+"',rent_type = '"+r_type+"',email='"+email+"' where unit_id = '"+id+"' ";
    	 st.executeUpdate(query);
    	    con.close();
    	 
    	 }
    	 catch(Exception e)
    	 {
    		 System.out.println(e);
    	 }


    %>
   
   <jsp:forward page="units.jsp">

  <jsp:param name="ems" value="ms>" />
  
 </jsp:forward>

   

   
