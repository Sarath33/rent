<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
<%


Connection con = null;
Class.forName("com.mysql.jdbc.Driver"); 
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");


try{
	 Statement st= con.createStatement();
	 
	 String name = (String)request.getParameter("name");
	 String time = (String)request.getParameter("time");
	 String amount = (String)request.getParameter("amount");
	 String unit_id = (String)request.getParameter("unit_id");
	 String property_id = (String)request.getParameter("property_id");
	 String query = "insert into expense(name,time,amount,unit_id,property_id) values('"+name+"','"+time+"','"+amount+"','"+unit_id+"','"+property_id+"')";
	 st.executeUpdate(query);
	 System.out.println("inserted ");
	con.close();
}catch(Exception e){
	
}

%>