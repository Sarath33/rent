<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
<%


Connection con = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver"); 
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");

String amount = (String)request.getParameter("amount");
String property_id = (String)request.getParameter("property_id");
try{
	 Statement st= con.createStatement();
	 
	 String name = (String)request.getParameter("name");
	 String time = (String)request.getParameter("time");
	 
	 String unit_id = (String)request.getParameter("unit_id");
	
	String email = (String)session.getAttribute("email");
	 String query = "insert into expense(name,time,amount,unit_id,property_id,email) values('"+name+"','"+time+"','"+amount+"','"+unit_id+"','"+property_id+"','"+email+"')";
	 st.executeUpdate(query);
	 System.out.println("inserted ");
	
}catch(Exception e){
	System.out.println(e);
}

int amt = Integer.parseInt(amount);
String temp="";
try{
	Statement st = con.createStatement();
	System.out.println(property_id);
	String query = "select *  from property where property_id = '"+property_id+"' ";
	
	rs = st.executeQuery(query);
	
	
	
	while(rs.next())
	{
		temp = rs.getString("expense");
	}
	
	System.out.println(temp);
}
catch(Exception e)
{
	System.out.println(e);
}
int exp = Integer.parseInt(temp);
exp = exp + amt;


try{
	Statement st = con.createStatement();
	System.out.println(property_id);
	String query = "update  property set expense = '"+exp+"'where property_id = '"+property_id+"' ";
	
	 st.executeUpdate(query);
	
	
	
	

	
	System.out.println("inserted");
}
catch(Exception e)
{
	System.out.println(e);
}

%>