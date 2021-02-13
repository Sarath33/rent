<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <title>Unit page</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
  <style media="screen">
    .main {

      padding: 50px;
      margin: 40px 110px;
      box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
      transition: margin-left .5s;
    }

    .col {
      margin: 50px 10px;
      padding: 30px 0px;
    }

    .details {
      box-shadow: 0 0px 2px 0 rgba(0, 0, 0, 0.2), 0 0px 2px 0 rgba(0, 0, 0, 0.2);
      margin: 40px 30px;
      padding: 50px 30px;
    }


    .content {
      padding-left: 80px;
      padding-top: 20px;
    }
  </style>
</head>

<body>
<form action = 'units.jsp' method="post">
<input name="p_id" value="<%=session.getAttribute("p_id") %>" hidden />
<input value="back" type="submit" />
</form>
<% 
session.setAttribute("unit_id", request.getParameter("id"));
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
            System.out.println("sks");
	%>

  <div class="main">
    <center>
      <h2><%=rs.getString("unit_name")%></h2>
    </center>
    <div class="row">
    

 <a class="col btn btn-primary" href="Notes.jsp">Notes</a>
	
     
<a href="expense.jsp" class="col btn btn-warning" >Expenses</a>
	
	
	
<a href="Documents.jsp" class="col btn btn-info">Documents</a>

     
    </div>
    <div class="row">
      <div class="details col">
        <h5>Tenant Details</h5>
        <div class="content">
          <div class="mb-3 row">
            <label class="col-sm-4 col-form-label"><b>Name</b></label>
            <label class="col-sm-6 col-form-label"><%=rs.getString("tenant_name") %></label>
          </div>
          <div class="mb-3 row">
            <label class="col-sm-4 col-form-label"><b>Email</b></label>
            <label class="col-sm-6 col-form-label"><%=rs.getString("tenant_email") %></label>
          </div>
          <div class="mb-3 row">
            <label class="col-sm-4 col-form-label"><b>Contact</b></label>
            <label class="col-sm-6 col-form-label"><%= rs.getString("tenant_contact") %></label>
          </div>
        </div>


      </div>
      <div class="details col">
        <h5>Rental Details</h5>
        <div class="content">
          <div class="mb-3 row">
            <label class="col-sm-4 col-form-label"><b>Rent Type</b></label>
            <label class="col-sm-6 col-form-label"><%= rs.getString("rent_type") %></label>
          </div>
          <div class="mb-3 row">
            <label class="col-sm-4 col-form-label"><b>Rent Amount</b></label>
            <label class="col-sm-6 col-form-label"><%= rs.getString("rent_amount") %></label>
          </div>
           <div class="mb-3 row">
          <label class="col-sm-4 col-form-label"><b>Payment Status</b></label>
            <label class="col-sm-6 col-form-label"><%=rs.getString("payment_status") %></label>
            </div>
        </div>
      </div>
    </div>

  </div>
  <% }
    }
    catch(Exception e){
    System.out.println(e);
    }%>
</body>

</html>