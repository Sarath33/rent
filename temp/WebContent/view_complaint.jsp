<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <title>complaint_view</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

  <style media="screen">
    input[type="file"] {
      display: none;
    }

    .sidenav {
      height: 100%;
      width: 250px;
      position: fixed;
      z-index: 1;
      top: 0;
      left: 0;
      background-color: black;
      overflow-x: hidden;
      transition: 0.3s;
      padding-top: 50px;
      font-weight: 400;
      font-size: 15px;
      border: 1px solid black;


    }

    .sidenav a {
      padding: 15px 15px 15px 36px;
      text-decoration: none;
      font-size: 25px;
      font-weight: 400;
      color: white;
      display: block;
      transition: 0.3s;
    }

    .sidenav a:hover {
      color: #ea2c62;
      font-weight: 600;
      border: 1px solid #ea2c62;
      font-size: 28px;
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
      font-size: 45px;
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
      padding: 50px;
      margin: 90px 90px 30px 330px;
      box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
      transition: margin-left .5s;
    }

    .details {
      box-shadow: 0 0px 2px 0 rgba(0, 0, 0, 0.2), 0 0px 2px 0 rgba(0, 0, 0, 0.2);
      margin: 50px 30px;
      padding: 20px 70px;
    }

    .table1 {
      margin: 30px 30px;
    }

    .content {
      padding-left: 80px;
      padding-top: 20px;
    }


    .nav li a {
      padding: 20px;

    }

    .col h1 {
      font-family: "Trirong", serif;
      text-shadow: 2px 2px 8px #d9534f;
      letter-spacing: 3px;
    }

    .col h2 {
      font-family: "Trirong", serif;
      text-shadow: 2px 2px 8px #f0ad4e;
      letter-spacing: 3px;
    }

    .col h3 {
      margin: 20px 0px;


    }
  </style>
</head>

<body>
  <div id="mySidenav" class="sidenav">

    <a href="properties.jsp">Dashboard</a>
    <a href="#">My Properties</a>
    <a href="#">Tenants</a>
    <a href="#">Any Thing</a>
  </div>

  <div class="main tab-content">

    <div class="tab-pane fade show active " role="tabpanel" id="income">
      <div class="row table1">
        <div class="col">
          <center>
            <h1 style="text-shadow: 2px 2px 8px #5bc0de;">Tenants complaints</h1>
          </center>
        </div>
      </div>
     
      <div class="row table1">


        <table class="table table-hover table-bordered">
          <thead class="thead-dark">

            <tr>
              <th scope="col">#</th>
              <th scope="col">Property Nmae</th>
              <th scope="col">Unit Name</th>
              <th scope="col">Tenant Name</th>
              <th scope="col">Complaints</th>
            </tr>

          </thead>
          <tbody>
          <%
          String email = (String)session.getAttribute("email");
          Connection con = null;
    	    ResultSet rs = null;
    	    ResultSet rs1 = null;
    	    String tenant_name="";
    	    String unit_name = "";
    	    
    	    try{

    	    	Class.forName("com.mysql.jdbc.Driver"); 
    	    	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");
    	    	Statement st= con.createStatement();
    	    	Statement st1 = con.createStatement();
    	    	String unit_id = (String)session.getAttribute("unit_id");
    	    	String query = " select * from complaints where email='"+email+"' ";
    	    	int i=1;
    	    	rs = st.executeQuery(query);
    	    	
    	    		
    	    		
    	    		/*String query1 = "select * from unit where unit_id='"+id+"' ";
    	    		rs1 = st1.executeQuery(query1);
    	    		if(rs1.next())
    	    		{
    	    			tenant_name = rs.getString("tenant_name");
    	    			unit_name = rs.getString("unit_name");
    	    		}*/
    	    		while(rs.next())
        	    	{
    	    			String id = rs.getString("unit_id");
        	    		System.out.println(id);
        	    		String query1 = "select * from unit where unit_id='"+id+"' ";
        	    		rs1 = st1.executeQuery(query1);
        	    		if(rs1.next())
        	    		{
        	    			tenant_name = rs1.getString("tenant_name");
        	    			unit_name = rs1.getString("unit_name");
        	    			
        	    		}
          if(!rs.getString("complaint_status").equals("completed"))
          {
          %>
            <tr class="table-info">
            <form action="complaint_description.jsp" method="post">
            
            
              <th scope="row"><%=i++%></th>
              <td><%=rs.getString("property id") %></td>
              <td><%=unit_name %></td>
              <td><%= tenant_name %></td>
              <td><a href="complaint_description.jsp?<%=rs.getString("complaint_id") %>" >view</a></td>
              
              
			</form>
            </tr>
            <%
          }}}
            catch(Exception e)
            {
            	System.out.println(e);
            }
            
            %>
          </tbody>
        </table>
      </div>
    </div>

  </div>
</body>

</html>
    