<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>

  <meta charset="utf-8">
  <title>unit preview</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <style media="screen">
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
 
</head>

<body>
<div id="mySidenav" class="sidenav">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
    <a href="#">Dashboard</a>
    <a href="#">My Properties</a>
    <a href="#">Tenants</a>
    <a href="#">Any Thing</a>
  </div>
  <span class="navbtn" onclick="openNav()">&#9776;</span>
  
  <div class="main" id="mainid">
  <a href="properties.jsp" >back</a>
    <div class="row">
    <% 
    Connection con = null;
    ResultSet rs = null;
     try{

    	 Class.forName("com.mysql.jdbc.Driver"); 
    	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");          
            Statement  st=con.createStatement();
            String id = "";
            if(request.getParameter("p_id") != null){
			id = (String)request.getParameter("p_id");
			 System.out.println("req "+id);
			
			}
            else{
           	 id = (String)session.getAttribute("p_id");
           	 System.out.println("attr "+id);
           	
            }
           
            String query="select * from unit where property_id='"+id+"' ";

            rs = st.executeQuery(query);
              session.setAttribute("p_id", request.getParameter("p_id") );
            while(rs.next()){ String t_name = rs.getString("tenant_name");
            
	%>
      <div class="col-md-6 single_card">
        <div class="card">
          <div class="card-header"><%= rs.getString("unit_name") %></div>
          <div class="card-body">
          <% 
          	if(t_name == null){ 
        	  %>
        <form action="AddUnit.jsp" method="post">
         <input name="id" value="<%= rs.getString("unit_id") %>" hidden/>
          <h2> Add Details..
          </h2>
           
           <input type="submit" value="add details" />
          	
          </form>
          <%   }else{ %>
          
          <form action="unit_dashboard.jsp" method="post">
         <input name="id" value="<%= rs.getString("unit_id") %>" hidden/>
          <h4 class="card-title" >ID: <%= rs.getString("Unit_id") %></h4>
            <h3 class="card-title"><%= rs.getString("tenant_name") %></h3>
            <h3 class="card-title">Rent: <%=rs.getString("rent_amount") %></h3>
           
           <input type="submit" value="view unit" />
          	
          </form>
          <% } %>
          </div>
        </div>
      </div>
      <%
     
      } 
            rs.close();
            con.close();
      }
            catch(Exception e){
                System.out.println("---------->  "+e);
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
    