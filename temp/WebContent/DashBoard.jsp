<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*,java.util.Date,java.sql.Timestamp,java.text.SimpleDateFormat,java.text.DateFormat"%>
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
    .alert {
  padding: 20px;
  background-color: #f44336;
  color: white;
}

.closebtn {
  margin-left: 15px;
  color: white;
  font-weight: bold;
  float: right;
  font-size: 22px;
  line-height: 20px;
  cursor: pointer;
  transition: 0.3s;
}

.closebtn:hover {
  color: black;
}
  </style>
</head>

<body>
<form action = 'Tenant_home.jsp' method="post">
<input name="get" value="1" hidden />
<input value="back" type="submit" />
</form>
<%
Connection con = null;
ResultSet rs = null;
 try{

	 Class.forName("com.mysql.jdbc.Driver"); 
	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");           
        Statement  st=con.createStatement();
        String unit_id = (String)session.getAttribute("unit_id");
        
        String query="select * from unit where unit_id='"+unit_id+"' ";
        rs = st.executeQuery(query);
        while(rs.next()){
		if(!rs.getString("payment_status").equals("paid")){
%>
<div class="alert">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  <strong>Danger!</strong> Indicates a dangerous or potentially negative action.
</div>
<%
		}}
 }
 catch(Exception e)
 {
	 System.out.println(e);
 }
%>
  <div class="main">
    <center>
      <h2>Unit Name</h2>
    </center>
    <div class="row">
    

 <a class="col btn btn-primary" href="Tenant_notes.jsp">Notes</a>
	
     
<a href="Tenant_expense.jsp" class="col btn btn-warning" >Expenses</a>
	
	
	
<a href="Tenant_documents.jsp" class="col btn btn-info">Documents</a>
<% 

   
     try{

    	 Class.forName("com.mysql.jdbc.Driver"); 
    	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");           
            Statement  st=con.createStatement();
            Date date = new Date();  
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
            String strDate= formatter.format(date);
            char k = strDate.charAt(1);
        	String email = (String)session.getAttribute("email");
			String unit_id = (String)session.getAttribute("unit_id");
			
			 String query="select * from unit where unit_id='"+unit_id+"' ";
			 rs = st.executeQuery(query);
			 while(rs.next()){
	           
            if(k == '9'  && rs.getString("flag").equals("1"))
            {
            	 query = "update unit set payment_status = 'not yet paid' where unit_id='"+unit_id+"' ";
            	 
            	 st.executeUpdate(query);
            }
		
          

           
            
	%>
     
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
          <%
          	String temp = rs.getString("payment_status");
      
          
          %>
            <label class="col-sm-4 col-form-label"><b>Payment Status</b></label>
            <label class="col-sm-6 col-form-label"><%=rs.getString("payment_status") %></label>
            
          
          
          
          </div>
          <%
          	if(rs.getString("payment_status").equals("paid"))
          	{
          %>
          <div class="mb-3 row">
          <button class="col-sm-6 col-form-label" disabled>Pay rent</button>
          </div>
          <% }else{ %>
          
          <div class="mb-3 row">
           	<form action="Payment.jsp">
           	<input name="amount" value="<%= rs.getString("rent_amount") %>" hidden/>
            <button class="col-sm-6 col-form-label">Pay rent</button>
            </form>
          </div>
          <% } %>
        </div>
      </div>
    </div>
  </div>
  <% }
    }
    catch(Exception e){
    System.out.println(e);
    }
     Date today = new Date();
     Calendar calendar = Calendar.getInstance();  
     calendar.setTime(today);  

     calendar.add(Calendar.MONTH, 1);  
     calendar.set(Calendar.DAY_OF_MONTH, 1);  
     calendar.add(Calendar.DATE, -1); 
     Date lastDayOfMonth = calendar.getTime();
     String date = lastDayOfMonth.toString();
     String temp = date.substring(4, 7);
     String temp1 = date.substring(24);
     temp1 = temp +" "+ temp1;
     System.out.println(temp1);
    
    %>
</body>

</html>