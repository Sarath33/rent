<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
    
    <%
    String query = request.getQueryString();
    System.out.println(query);
    
    Connection con = null;
    ResultSet rs = null;
    int sum =0;
    String email = (String)session.getAttribute("email");

     try{

    	 Class.forName("com.mysql.jdbc.Driver"); 
    	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");           
            
    	 Statement  st=con.createStatement();
    	
    		
    		String query = "select * from expense where email = '"+email+"' ";
    		
    		rs = st.executeQuery(query);
    
    %>
    
