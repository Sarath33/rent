<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*,java.util.*"%>
     	<%!
	
	static void change(String temp)
	{
		System.out.println(temp);
	}
	
	
	
	%>
<!DOCTYPE html>
<html>
<head>
<title>Rent Management System</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
	
	  <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
<style>
.lpn {
	text-align: center;
	padding: 200px 0px 0px 0px;
	font-family: "Helvetica";
	font-weight: bold;
	font-size: 40px
}

.lcn {
	text-align: center;
	padding: 20px 0px 0px 0px;
	font-family: "Helvetica";
	font-weight: bold;
	font-size: 20px
}

.tcn {
	text-align: center;
	padding: 5px 0px 0px 0px;
	font-family: "Helvetica";
}

.lad {
	text-align: center;
	padding: 20px 0px 0px 0px;
	font-family: "Helvetica";
	font-weight: bold;
	font-size: 20px
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

input[type="text"] {
	width: 400px;
	padding: 12px 20px;
}

p {
	font-family: "Helvetica";
}

.button {
	border: none;
	color: white;
	padding: 10px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}

.button2 {
	background-color: #008CBA;
} /* Blue */
.button3 {
	background-color: #f44336;
} /* Red */
</style>
</head>
<body>
<a href="view_complaint.jsp">back</a>
	<div class="lpn">
		<label for="tt">Complaint Details</label>
	</div>


	<div class="lcn">
		<label for="tt">Title:</label>
	</div>
	<%
	  Connection con = null;
    ResultSet rs = null;
	 try{

	    	Class.forName("com.mysql.jdbc.Driver"); 
	    	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");
	    	Statement st= con.createStatement();
	    	
	    	String id = request.getQueryString();
	    	System.out.println(id);
	    	String query = "select * from complaints where complaint_id='"+id+"' ";
	    	rs = st.executeQuery(query);
	    	while(rs.next())
	    	{
	
	%>
	<div class="tcn">
		<p><%= rs.getString("title") %></p>
	</div>

	<div class="col">
		<div class="lad">
			<label for="cdd">Complaint Description:</label>
		</div>
		<div class="tad">
			<p><%= rs.getString("description") %></p>
		</div>
	</div>

	<div class="bton">
	
		<form action="status_adder.jsp" method="post" >
		<input name="status" value="in-progress" hidden/>
		<input name="id" value="<%=id %>"  hidden/>
		<% if(rs.getString("complaint_status").equals("in-progress")){ %>
		<button type="submit" class="button button2" hidden>In-Progress</button>
		<%}else{ %>
		<button type="submit" class="button button2"  >In-Progress</button>
		<% } %>
		</form>
		<form action="status_adder.jsp" method="post">
		<input name="status" value="completed" hidden/>
		<input name="id" value="<%=id %>"  hidden/>
		<button type="submit" class="button button3" >Completed</button>
		</form>
	</div>
	<%
	    	}
	 }
	 catch(Exception e)
	 {
		 System.out.println(e);
	 }
	
	
	
	%>
	

	
	<script>
	
	function addstatus(temp,id){
		console.log(temp);
		
	 $.ajax({
   	  type: "POST",
   	  url: "status_adder.jsp",
   	  data: { status: temp, id: id  }
   	});
	 
	}
	
	</script>
</body>
</html>