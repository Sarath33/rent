<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

     <%@page import="java.sql.*,java.util.*"%>
<%


Connection con = null;
Class.forName("com.mysql.jdbc.Driver"); 
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");


try{
	 Statement st= con.createStatement();
	 System.out.println("get there "+session.getAttribute("email"));
	 String email = (String)request.getParameter("email");
	 String b_name = (String)request.getParameter("bank_name");
	 String ifsc= (String)request.getParameter("ifsc");
	 String acc_no = (String)request.getParameter("acc_no");
	 String acc_name = (String)request.getParameter("acc_name");
	
	 String query = "insert into bank_details(Bank_Name,Account_No,IFSC_code,Account_Name,Pan_no,email) values('"+b_name+"','"+ifsc+"','"+acc_no+"','"+acc_name+"','yes','"+email+"')";
	 st.executeUpdate(query);
	 
	con.close();
}catch(Exception e){
	System.out.println(e);
}
%>

<jsp:forward page="properties.jsp">
<jsp:param name="em" value="jsj" />
	 
  
 </jsp:forward>