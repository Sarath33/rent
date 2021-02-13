<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <title>Analyse</title>
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
      color: black;
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
      margin: 0px 90px 60px 330px;
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

    .head1 {
      margin: 90px 90px 30px 330px;
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
      text-shadow: 2px 2px 8px blue;
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

  <div class="head1">
    <ul class="nav nav-pills nav-fill" id="pills-tab" role="tablist">
      <li class="nav-item">
        <a class="nav-link btn btn-outline-primary active" data-toggle="pill" href="#income" role="tab">Income</a>
      </li>
      <li class="nav-item">
        <a class="nav-link btn btn-outline-warning" id="pills-profile-tab" data-toggle="pill" href="#expense" role="tab">Expense</a>
      </li>

    </ul>
  </div>
<% 

Connection con = null;
ResultSet rs = null;
int sum =0;
String email = (String)session.getAttribute("email");
System.out.println(email);
 try{

	 Class.forName("com.mysql.jdbc.Driver"); 
	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");           
        
	 Statement  st=con.createStatement();
	
		
		String query = "select * from expense where email = '"+email+"' ";
		
		rs = st.executeQuery(query);
		
		while(rs.next())
		{
			int temp = Integer.parseInt(rs.getString("amount"));
			sum = sum + temp;
		}
		
		
 }
 catch(Exception e)
 {
	 System.out.println(e);
 }

int total =0;
int received=0;
 try{

	 Class.forName("com.mysql.jdbc.Driver"); 
	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");           
        
	 Statement  st=con.createStatement();
	
		
		String query = "select * from unit where email = '"+email+"' ";
		
		rs = st.executeQuery(query);
	
		 
		while(rs.next())
		{
			int temp = Integer.parseInt(rs.getString("rent_amount"));
			
			if(rs.getString("payment_status").equals("paid"))
				received = received + temp;
				
			
			total = total + temp;
		}
		System.out.println(received+" "+total);
		
 }
 catch(Exception e)
 {
	 System.out.println(e);
 }


%>

  <div class="main tab-content">

    <div class="tab-pane fade show active " role="tabpanel" id="income">
      <div class="row table1">
        <div class="col">
          <center>
            <h1 style="text-shadow: 2px 2px 8px #f0ad4e;">Your Income</h1>
          </center>
        </div>
      </div>
      <div class="row details">
        <div class="col">
          <center>
            <h2>Total Amount</h2>
            <h3>Rs. <%=total %>/-</h3>
          </center>
        </div>
        <div class="col">
          <center>
            <h2>Received Amount</h2>
            <h3>Rs. <%=received %>/-</h3>
          </center>
        </div>
      </div>
      <div class="row table1">

        <p class="h4" style="padding: 20px 0px ;">
          Tenants Not Yet Paid
        </p>

        <table class="table table-hover table-bordered">
          <thead class="thead-dark">

            <tr>
              <th scope="col">#</th>
              <th scope="col">Unit Name</th>
              <th scope="col">Tenant Name</th>
              
              <th scope="col">Rent Amount</th>
            </tr>

          </thead>
          <tbody>
 <% 
try{

	 Class.forName("com.mysql.jdbc.Driver"); 
	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");           
        
	 Statement  st=con.createStatement();
	
		
		String query = "select * from unit where email = '"+email+"' ";
		
		rs = st.executeQuery(query);
		 
		 int i=1;
		while(rs.next())
		{
			if(!rs.getString("payment_status").equals("paid")){
%>
            <tr class="table-warning">
              <th scope="row"><%=i++ %></th>
              <td><a href="#"><%= rs.getString("unit_name") %></a></td>
              <td><a href="#"><%= rs.getString("tenant_name") %></a></td>
              
              <td><%= rs.getString("rent_amount") %></td>
            </tr>
           
          <%
			}
		}
}
		catch(Exception e)
		{
			System.out.println(e);
		}
          
          %>  
          </tbody>
        </table>
      </div>
    </div>

    <div class=" tab-pane fade" id="expense" role="tabpanel">
      <div class="row table1">
        <div class="col">
          <center>
            <h1>Your Expenses</h1>
          </center>
        </div>
      </div>
      <div class="row details">
        <div class="col">
          <center>
            <h2>Total Amount Spent</h2>
            <h3>Rs.<%=sum %> /-</h3>
          </center>
        </div>
      </div>
      <div class="row table1">

        <p class="h4" style="padding: 20px 0px ;">
           expenses
        </p>

        <table class="table table-hover table-bordered">
          <thead class="thead-dark">
            <tr>
              <th scope="col">#</th>
              <th scope="col">Property Name</th>
              <th scope="col">Total units</th>
              <th scope="col">Amount Spent</th>
            </tr>
          </thead>
          <tbody>
<%
try{
	Class.forName("com.mysql.jdbc.Driver"); 
	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");           
       
	 Statement  st=con.createStatement();
	
String query = "select * from property where email = '"+email+"' ";

rs = st.executeQuery(query);
int i=1;
while(rs.next()){


%>
            <tr class="table-danger">
              <th scope="row"><%=i++ %></th>
              <td><%=rs.getString("property name") %></td>
              <td><%= rs.getString("No of units") %></td>
              <td><%=rs.getString("expense") %></td>
            </tr>
<%
}
}catch(Exception e)
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
    