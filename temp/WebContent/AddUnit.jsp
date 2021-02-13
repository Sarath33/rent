<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<title>sample page</title>

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
<a href="units.jsp">back</a>
<h1>PROPERTY FORM</h1>

<h2 class="heading">Unit Details</h2>
<form action="unit_process.jsp" method="post">
  <label for="uname">Unit Name:</label>
  <input type="text" id="unit_name" name="uname" required>
  <input id="id" name ="id" value="<%= request.getParameter("id") %>" hidden/>


<h2 class="heading">Tenant Details</h2>

  <label for="fname">First Name:</label>
  <input type="text" id="fname" name="tenant_name"  required>
  <br><br>
  
  <label for="tno">Mobile No:</label>
  <input type="tel" id="tno" name="tenant_contact"  required>
  
  
  <label for="tem">Email Id:</label>
  <input type="email" id="tem" name="tenant_email"  required><br>


<h2 class="heading">Rent Details</h2>

  <label for="rentamt">Amount:</label>
  <input type="text" id="rentamt" name="rent_amount"  required>
  <label for="renttype">Type:</label>
<select class="option" name="r_type" required>
                <option disabled="disabled" >--Choose option--</option>
               
                <option value="weekly">weekly</option>
                <option value="monthly">monthly</option>
                
            </select><br><br>
    
    
   <br><br>
   <div class="io">
   <input type="submit" value="Submit">
   </div>
   
         <%  session.setAttribute("u_id", request.getParameter("id") );
         	
         %>
</form>

</body>
</html>

