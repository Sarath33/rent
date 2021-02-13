<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*,java.util.*"%>
 <%! 
 String getAlphaNumericString(int n,String temp) 
{ 

    // chose a Character random from this String 
    String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                + "0123456789"
                                + "abcdefghijklmnopqrstuvxyz"; 

    // create StringBuffer size of AlphaNumericString
    
   
    
     
    String sb =  "UN"+temp.substring(0,2);
    for (int i = 0; i < n; i++) { 

        // generate a random number between 
        // 0 to AlphaNumericString variable length 
        int index 
            = (int)(AlphaNumericString.length() 
                    * Math.random()); 

        // add Character one by one in end of sb 
        sb = sb + AlphaNumericString 
                      .charAt(index); 
    } 

    return sb; 
}
%>
    
 <%
 
 
 int n=0;
 n = Integer.parseInt(request.getParameter("no_units"));
 System.out.println(n);
 String arr[] = new String[n];

 
 
 
 Connection con = null;
 ResultSet rs = null;
 
  
 String temp = (String)request.getParameter("property_name");

 try{
 String password=request.getParameter("password");
 Class.forName("com.mysql.jdbc.Driver"); 
 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");
 Statement st= con.createStatement();
 for(int i=0;i<n;i++)
 {
 String ii = getAlphaNumericString(4,temp);
	arr[i] = ii;
 String query = "insert into Unit(unit_id) values('"+ii+"')";
 st.executeUpdate(query);
 }
 
 }
 catch(Exception e)
 {
	 System.out.println(e);
 }

 con.close();
 
 

 %>
 
 
 
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>

<% for(int i=0;i<n;i++){ %>
<div>
<form id="form1" name="form1" method="post">
	<input name="id" id="id" value="<%= arr[i] %>">
	<input type="text" id="unit_name" placeholder="unit name" value="iekd">
	<input type="text" id="tenant_name" placeholder="tenant name" value="darshan">
	<input type="email" id="tenant_email" placeholder="tenant email" value="3kd@gmail.com">
	<input type="contact" id="tenant_contact" placeholder="tenant contact" value="321234">
	
	<input type="radio" id="r_type" name="r_type" value="Daily">
  <label for="female">Daily</label><br>
  <input type="radio" id="r_type" name="r_type" value="Weekly">
  <label for="other">Weekly</label>
  <input type="radio" id="r_type" name="r_type" value="Monthly" checked>
  <label for="monthly">Monthly</label>
  
	<input name = "rent_amount" id="rent_amount" placeholder="rent amount" required>
	<input id="search" type="submit" >
	
	</form>
</div>
<% } %>
</body>



<script>

   
    	 
    	 
    	 var id = document.getElementById("id").value;
    	
    
    	 $("#search").click(function() {
    		 console.log("thereee");
    	 
    		 var roll_no= $('#roll_no').val();
    		 var id = $("#id").val();
        	 var u_name = $("#unit_name").val();
        	 var tenant_name = $("#tenant_name").val();
        	 var tenant_email = $("#tenant_email").val();
        	 var tenant_contact =$("#tenant_contact").val();
        	 var r_type = $("#r_type").val();
        	 var rent_amount = $("#rent_amount").val();
        	
    		 console.log(r_type);
    		 $.ajax({
    		 url: "unit_process.jsp",
    		 type: 'POST',
    		 data: {id: id, unit_name: u_name, tenant_name: tenant_name , tenant_email:tenant_email, tenant_contact: tenant_contact, r_type: r_type,
    			 rent_amount:rent_amount},
    		 
    		 success: function(data) {
    		 
    		 alert("unit added");
    		 
    		 }
    			 
    		 });
    	 });
    	
    	
    	
   
  

    
</script>

</html>