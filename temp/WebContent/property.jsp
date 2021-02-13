<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Rent Management System</title>
<style>
.lpn{
    text-align: center;
    padding:30px 0px 0px 0px;
    font-family: "Helvetica";
    font-weight: bold;
}
.tpn{
    text-align: center;
    padding:5px 0px 0px 0px;
}
.lcn{
    text-align: center;
    padding:20px 0px 0px 0px;
    font-family: "Helvetica";
    font-weight: bold;
}
.tcn{
    text-align: center;
    padding:5px 0px 0px 0px;
}
.lnu{
    text-align: center;
    padding:20px 0px 0px 0px;
    font-family: "Helvetica";
    font-weight: bold;
}
.tnu{
    text-align: center;
    padding:5px 0px 0px 0px;
}
.lad{
    text-align: center;
    padding:20px 0px 0px 0px;
    font-family: "Helvetica";
    font-weight: bold;
}
.tad{
    text-align: center;
    padding:5px 0px 0px 0px;
}
.btn{
    text-align: center;
    padding:20px 0px 0px 0px;
}
input[type="text"],[type="tel"]{
        width:150px;
        padding:5px 0px 5px 70px;
        border-radius: 8px;
        border-color: black;
    }
textarea{
        border-color: black;
        border-radius: 8px;
        
    }   
input[type="submit"] {
        height: 30px;
        width: 90px;
        font-family: "Helvetica";
        font-weight: bold;
        background-color: #42C0FB;
        border-radius: 8px;
    }

</style>
</head>
<body>
<form action="properties.jsp" method="post">
	<input type="submit" value="back" />
</form>
<form action="property_process.jsp" method="post">
<input name="email" value="<%= session.getAttribute("email") %>" hidden/>
<input type="radio" id="female" name="p_type" value="House rental" hidden>
  
  
<div class="lpn">
<label for="pname">Property Name:</label>
</div>
<div class="tpn">
<input type="text" id="pname" name="p_name">
</div>
<div class="lcn">
<label for="cno">Contact.No:</label>
</div>
<% 
 Connection con = null;
    ResultSet rs = null;
     try{

    	 Class.forName("com.mysql.jdbc.Driver"); 
    	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");           
            Statement  st=con.createStatement();
            String email = (String)session.getAttribute("email");
            String query = "select * from admin where email='"+email+"' ";
            rs = st.executeQuery(query);
          while(rs.next()){
        	  String contact = rs.getString("Contact");
  %>
<div class="tcn">
<input type="tel" id="cno" name="contact" value="<%=contact%>" />
</div>

<%
     }}
     catch(Exception e)
     {
    	 System.out.println(e);
     }

%>
<div class="lnu">
<label for="unitno">No.Unit:</label>
</div>
<div class="tnu">
<input type="number" id="unitno" min=1 name="no_units">
</div>
<div class="lad">
<label for="address">address:</label>
</div>
<div class="tad">
<textarea id="address" name="address" rows="6" cols="50"></textarea>
</div>
<div class="btn">
<input type="submit" value="Submit">
</div>
</form>
</body>
</html>