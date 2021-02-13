<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Rent Management System</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<style>
.lpn {
	text-align: center;
	padding: 100px 0px 0px 0px;
	font-family: "Helvetica";
	font-weight: bold;
}

.tpn {
	text-align: center;
	padding: 5px 0px 0px 0px;
	font-family: "Helvetica";
}

.lcn {
	text-align: center;
	padding: 20px 0px 0px 0px;
	font-family: "Helvetica";
	font-weight: bold;
}

.tcn {
	text-align: center;
	padding: 5px 0px 0px 0px;
	font-family: "Helvetica";
}

.lnu {
	text-align: center;
	padding: 100px 0px 0px 0px;
	font-family: "Helvetica";
	font-weight: bold;
}

.tnu {
	text-align: center;
	padding: 5px 0px 0px 0px;
	font-family: "Helvetica";
}

.lad {
	text-align: center;
	padding: 20px 0px 0px 0px;
	font-family: "Helvetica";
	font-weight: bold;
}

.tad {
	text-align: center;
	padding: 5px 0px 0px 0px;
	font-family: "Helvetica";
}

.bton {
	text-align: center;
	padding: 20px 0px 0px 0px;
}

input[type="text"]{
	width: 400px;
	padding: 12px 20px;
	border-radius: 8px;
	border-color: black;
}
input[type="submit"] {
	height: 40px;
	width: 120px;
	font-family: "Helvetica";
	font-weight: bold;
	background-color: #42C0FB;
	border-radius: 8px;
}
.zz {
	text-align: center;
	padding: 50px 0px 0px 0px;
	font-family: "Helvetica";
}
.yy {
	text-align: center;
	padding: 90px 0px 0px 0px;
}
</style>
</head>
<body>
<form action="properties.jsp" method="post">
	<input type="submit" value="back" />
</form>
<div class="zz">
		<h2><strong>Bank Details</strong></h2>
</div>
	
	
		<% 
		  
		    Connection con = null;
		    ResultSet rs = null;
		     try{

		    	 Class.forName("com.mysql.jdbc.Driver"); 
		    	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");           
		            Statement  st=con.createStatement();
		            
					String email = (String)session.getAttribute("email");
					
					
		            String query="select * from bank_details where email='"+email+"' ";

		            rs = st.executeQuery(query);

		            if(rs.next()){
		            	
		%>
		<div class="container">
		<div class="row">
		<div class="col">
		<form action="Bank_adder.jsp" method="post">
			<input value="<%=request.getParameter("email") %>" name="email" hidden/>
				<div class="lpn">
					<label for="bname">Bank Name:</label>
				</div>
				<div class="tpn">
					<input type="text" value="<%=rs.getString("Bank_Name") %>" id="bname" name="bank_name">
				</div>
				<div class="lcn">
					<label for="co">IFSC Code:</label>
				</div>
				<div class="tcn">
					<input type="text" value="<%=rs.getString("IFSC_code") %>" id="co" name="ifsc">
				</div>
			</div>
			<div class="col">

				<div class="lnu">
					<label for="ano">Account No:</label>
				</div>
				<div class="tnu">
					<input type="text" value="<%=rs.getString("Account_No") %>" id="ano" name="acc_no">
				</div>
				<div class="lad">
					<label for="ahn">Account Holder Name:</label>
				</div>
				<div class="tad">
					<input type="text" value="<%=rs.getString("Account_Name") %>" id="ahn" name="acc_name">
				</div>
				
			</div>
		</div>
	</div>
	<div class="text-center">
            <button type="button" class="btn btn-primary">Finish</button>
          </div>
	</div>
	</form></body>
</html>
<% } else{System.out.println("hii"); %>
<div class="container">
		<div class="row">
			<div class="col">
		<form action="Bank_adder.jsp" method="post">
	<input value="<%=request.getParameter("email") %>" name="email" hidden/>
				<div class="lpn">
					<label for="bname">Bank Name:</label>
				</div>
				<div class="tpn">
					<input type="text"  id="bname" name="bank_name">
				</div>
				<div class="lcn">
					<label for="co">IFSC Code:</label>
				</div>
				<div class="tcn">
					<input type="text"  id="co" name="ifsc">
				</div>
			</div>
			<div class="col">

				<div class="lnu">
					<label for="ano">Account No:</label>
				</div>
				<div class="tnu">
					<input type="text"  id="ano" name="acc_no">
				</div>
				<div class="lad">
					<label for="ahn">Account Holder Name:</label>
				</div>
				<div class="tad">
					<input type="text"  id="ahn" name="acc_name">
				</div>
				
			</div>
		</div>
	</div>
	<div class="bton">
		<input type="submit" value="Finish">
	</div>
	</form>
	<% } 
	}catch(Exception e){
	System.out.println(e);
	}%>
</body>
</html>