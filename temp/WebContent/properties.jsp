<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
<head>
  <meta charset="utf-8">
  <title>unit preview</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <style media="screen">
    .main {
      text-align: center;
      padding: 50px;
      margin: 40px 120px;;
      box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    }
    .single_card{
      margin-bottom: 40px;
      padding: 20px 30px;
      height: 350px;
    }
    .single_card:hover{
      box-shadow: 0 0px 2px 0 rgba(0, 0, 0, 0.2), 0 0px 2px 0 rgba(0, 0, 0, 0.2);

    }
    .single_card:hover .card-header{
      border:2px solid #ea2c62;
      background-color: #ea2c62;
    }
    .single_card:hover .card-body{
      border:2px solid #ea2c62;
    }

  </style>
</head>
 <style media="screen">
    /* navbar */

    .sidenav {
      height: 100%;
      width: 30px;
      position: fixed;
      z-index: 1;
      top: 0;
      left: 0;
      background-color: white;
      overflow-x: hidden;
      transition: 0.3s;
      padding-top: 130px;
      font-weight: 400;
      font-size: 15px;
      border: 1px solid black;
      border-radius: 5px;
    }

    .sidenav a {
      padding: 15px 15px 15px 36px;
      text-decoration: none;
      font-size: 25px;
      font-weight: 400;
      color: black;
      display: block;
}

    .sidenav a:hover {
      color: #ea2c62;
      font-weight: 600;
      border: 1px solid #ea2c62;
      font-size: 28px;
    }

    .sidenav .closebtn {
      position: absolute;
      top: 0;
      right: 25px;
      font-size: 40px;
      margin-left: 50px;
      border: none;
    }
.sidenav .closebtn:hover{
  border:none;
  font-size:45px;
}
    .navbtn {
      position: fixed;
      font-size: 40px;
      margin: 0px 30px 30px 30px;
      padding: 0px 10px 10px 10px;
      cursor: pointer
    }

    .navbtn:hover {
      color: #ea2c62;
      font-size:45px;
    }

    @media screen and (max-height: 450px) {
      .sidenav {
        padding-top: 15px;
      }

      .sidenav a {
        font-size: 18px;
      }
    }
    
    .main {
      text-align: center;
      padding: 50px;
      margin: 40px 120px 40px 120px;
      box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
      transition: margin-left .5s;
    }

    .single_card {
      margin-bottom: 40px;
      padding: 20px 30px;
    }

    .single_card:hover {
      box-shadow: 0 0px 2px 0 rgba(0, 0, 0, 0.2), 0 0px 2px 0 rgba(0, 0, 0, 0.2);

    }

    .single_card:hover .card-header {
      border: 2px solid #ea2c62;
      background-color: #ea2c62;
    }

    .single_card:hover .card-body {
      border: 2px solid #ea2c62;
    }
</style>
<body>

<div id="mySidenav" class="sidenav">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
    <a href="#">Dashboard</a>
    
   	<a href="bank_details.jsp">Bank details</a>
    <a href="watchout.jsp">Income and Expense</a>
    <a href="view_complaint.jsp">complaints</a>
    <a href="index.jsp">Log out</a>
  </div>
  <span class="navbtn" onclick="openNav()">&#9776;</span>
  
  
  <div class="main" id="mainid">
  <form action="property.jsp" >
<input value="new property" type="submit">
</form>
    <div class="row">
   
    <% 
    Connection con = null;
    ResultSet rs = null;
     try{

    	 Class.forName("com.mysql.jdbc.Driver"); 
    	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");           
            Statement  st=con.createStatement();
            
			String email = (String)session.getAttribute("email");
			
			
            String query="select * from property where email='"+email+"' ";

            rs = st.executeQuery(query);

            while(rs.next()){
	%>
	
      <div class="col-md-6 single_card">
        <div class="card">
          <div class="card-header"><h2><%= rs.getString("property name") %></h2></div>
          <div class="card-body">
          <form action="units.jsp" method="post">
         
          <h4  class="card-title">ID : <%= rs.getString("property_id") %></h4>
           <input name="p_id" value="<%= rs.getString("property_id") %>" hidden/> 
           
            <h3 class="card-title">No of Units: <%=rs.getString("No of units") %></h3>
            <h4 class="card-text"> <%=rs.getString("address") %></h4>
            <input type="submit" id="see" value="view units"/>
  
 	
			</form>
          </div>
        </div>
      </div>
      
      
     
      <%
     
      } 
            
      }
            catch(Exception e){
                System.out.println("---------->  "+e);
            }finally {
                if(rs != null){
                    try{
                         rs.close();
                    } catch(Exception e){
                        e.printStackTrace();
                    }
               }
               if(con != null){
                   try{
                       con.close();
                   } catch(Exception e){
                       e.printStackTrace();
                   }
               }
           }
  
     
      %>
      
  </div>
</div>
</body>
<script>
    function openNav() {
      document.getElementById("mySidenav").style.width = "250px";
      document.getElementById("mainid").style.marginLeft = "280px";
    }

    function closeNav() {
      document.getElementById("mySidenav").style.width = "30px";
      document.getElementById("mainid").style.marginLeft = "120px";
    }
  </script>

</html>
    