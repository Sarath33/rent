<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
    
    <%
    
	Connection con = null;
    ResultSet rs = null;
     try{

    	 Class.forName("com.mysql.jdbc.Driver"); 
    	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");           
            Statement  st=con.createStatement();
            
            String email = (String)session.getAttribute("email");
            String id = (String)request.getParameter("unit");
            
            String query="select * from unit where tenant_email='"+email+"' and unit_id='"+id+"' ";
            
            rs = st.executeQuery(query);
            
            if(rs.next())
            {
            	query = "update admin set claim='1' where email='"+email+"' ";
            	
            	 st.executeUpdate(query);
            }
           	
            %>
            <jsp:forward page="/Tenant_home.jsp">

  		<jsp:param name="em" value="em" />
  
 			</jsp:forward>
            <%
            rs.close();
            con.close();
            
     }
     catch(Exception e)
     {
    	 System.out.println(e);
     }
            
    %>
    
    <jsp:forward page="/Tenant_home.jsp">

  <jsp:param name="em" value="em" />
  
 </jsp:forward>