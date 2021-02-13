<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<title>sample page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
    label{
        width: 100px;
        display: inline-block;
        font-size: 17px;
        font-family: "Helvetica";
        font-weight: bold;
    }
    input[type="checkbox"] {
        height: 16px;
        width: 16px;
    }
    input[type="text"],[type="email"],[type="tel"]{
        width:150px;
        padding:5px 0px 5px 70px;
        border-radius: 8px;
        border-color: black;
    }
    input[type="submit"] {
        height: 30px;
        width: 90px;
        font-family: "Helvetica";
        font-weight: bold;
        background-color: #42C0FB;
        border-radius: 8px;
    }
    .rem {
        text-align: left;
    }
    select{
        height: 30px;
        width: 225px;
        border-radius: 8px;
        border-color: black;
        
    }
    .heading{
        text-align: center;
    }
    h1{
        font-family: "Helvetica";
    }
    h2{
        font-family: "Helvetica";
        border-style: solid;
        background-color: #737CA1;
        color:white;
        border-color: #737CA1;
        border-radius: 8px;
        width:670px;
        
        

    }
    body{
        margin: 60px 30px 30px 300px ;
    }

    
</style>
</head>
<body>
<a href="unit_dashboard.jsp">back</a>
<h1>PROPERTY FORM</h1>


<h2 class="heading">Unit Details</h2>


<%
Connection con = null;
ResultSet rs = null;
 try{

	 Class.forName("com.mysql.jdbc.Driver"); 
	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");           
        Statement  st=con.createStatement();
        
		String email = (String)session.getAttribute("email");
		String unit_id = (String)request.getParameter("id");
		System.out.println("unit id "+unit_id);
        String query="select * from unit where unit_id='"+unit_id+"' ";

        rs = st.executeQuery(query);

        while(rs.next()){
       
%>
  <label for="uname">Unit Name:</label>
  <input type="text" id="unit_name" name="uname" required>
  <input id="id" name ="id" value="<%= rs.getString("unit_name") %>" />


<h2 class="heading">Tenant Details</h2>

  <label for="fname">First Name:</label>
  <input type="text" id="fname" name="tenant_name"  value="<%= rs.getString("tenant_name") %>" required>
  <br><br>
  
  <label for="tno">Mobile No:</label>
  <input type="tel" id="tno" name="tenant_contact" value="<%= rs.getString("tenant_contact") %>"  required>
  
  
  <label for="tem">Email Id:</label>
  <input type="email" id="tem" name="tenant_email" value="<%= rs.getString("tenant_email") %>"  required><br>


<h2 class="heading">Rent Details</h2>

  <label for="rentamt">Amount:</label>
  <input type="text" id="rentamt" name="rent_amount" value="<%= rs.getString("rent_amount") %>"  required>
  <label for="renttype">Type:</label>
<select class="option" name="r_type" required>
                <option disabled="disabled" >--Choose option--</option>
                <option value="daily" selected="selected">yearly</option>
                <option value="weekly">weekly</option>
                <option value="monthly">monthly</option>
                
            </select><br><br>
    
    
   <br><br>
   <div class="io">
   <input type="submit" value="Submit">
   </div>
   
      <%}
        
 }
 catch(Exception e)
 {System.out.println(e);
 }%>  


</body>
</html>

