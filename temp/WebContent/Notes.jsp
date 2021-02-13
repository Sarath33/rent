<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>

<head>
	<title>Google Keep</title>
	<!-- Material Design Lite -->
	<script src="https://code.getmdl.io/1.1.3/material.min.js"></script>
	<link rel="stylesheet" href="https://code.getmdl.io/1.1.3/material.amber-indigo.min.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<!-- Material Design icon font -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"> </script>
	<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
	<!-- custom CSS -->
	<link rel="stylesheet" href="notes/main.css">
	<script src="notes/main.js"></script>
	<style media="screen">
		.main-div {
			padding: 50px;
			box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
		}
	</style>
</head>

<body>
<form action = 'unit_dashboard.jsp' method="post">
<input name="id" value="<%=session.getAttribute("unit_id") %>" hidden />
<input value="back" type="submit" />

</form>
<div   style="margin-left: 1000px;">

<% //<input type="checkbox" checked data-toggle="toggle" /> %>

</div>
	<!-- body starts here -->
	<div class=" mdl-layout mdl-js-layout mdl-layout--fixed-header">
		<!-- Main page -->
		<!-- Your content goes here -->
		<div class="inside" id="inside1">
		<input name="date" value="<%= (new java.util.Date()).toLocaleString()%>" hidden/>
		<input name="u_id" value="<%= session.getAttribute("unit_id") %>" hidden/>
		<input name="p_id" value="<%= session.getAttribute("p_id") %>" hidden/>
			<!-- Adding quick note -->
			<div class="mdl-grid" id="front">
				<div class="mdl-cell mdl-cell--3-col"></div>
				<div class="mdl-cell mdl-cell--6-col">
					<div id="show">
						<div id="shade">
							<div class="header2">
								<form action="#">
									<button class="btn-dark mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" id="add" onclick="myFunctionAddnote()">Add Notes</button>
								</form>
							</div>
						</div>
					</div>
					<div id="hidden">
						<div id="shade">
						
							<div class="header2">
								<form action="#">
									<center style="padding: 20px;">
										<h1>Notes</h1>
									</center>
									<div class="form-group">
										<label>Title</label>
										<input type="text" id="formtitle" class="form-control" placeholder="Title..." required>
									</div>
									<div class="form-group">
										<label>Note</label>
										<textarea id="formbody" class="form-control" placeholder="Description" required></textarea>
									</div>
									
									<center style="padding: 20px;">
										<button id="addtodo" class="btn btn-lg btn-outline-dark btn-block">Add</button>
									</center>
									
								</form>

							</div>
						</div>
					</div>
				</div>
				<div class="mdl-cell mdl-cell--3-col"></div>
			</div>
			<!-- Grid view goes here -->
			<div id="holder" style="padding-left: 90px; ">
				<ul id="todo" style="margin-top: 130px;">
				<br><br><br>
				<% 
Connection con = null;
ResultSet rs = null;
try{

	Class.forName("com.mysql.jdbc.Driver"); 
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");
// where unit_id='"+request.getParameter("unit_id")+"' and property_id='"+session.getAttribute("p_id")+"'
		       Statement st= con.createStatement();
String query="select * from notes where unit_id='"+session.getAttribute("unit_id")+"' and property_id='"+session.getAttribute("p_id")+"'";


rs = st.executeQuery(query);
while(rs.next())
{
%>


<div class="box one">
<div id="shade">
<div class="header" id="header"> <%=rs.getString("title")%> </div><div class="container"><div class="two"> <%=rs.getString("note")%> </div><div><center>
<form action="note_deleter.jsp">
<input value="<%=rs.getString("note_id") %>" name="note_id" hidden/>
<button class="btn btn-outline-dark delete mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect">
 <i class="material-icons">delete</i> 
 </button>
  </form>
 </center></div> </div></div></div>


<%

}
rs.close();
con.close();
}
catch(Exception e)
{
	
}
%>
					
				</ul>

			</div>
		</div>
		<!-- INSIDE CLOSED -->
	</div>

 
</body>

<script>
 

function addItem() {
	

	var title = $("#formtitle").val();
	  var text = $("#formbody").val();
	  $date = $('input[name="date"');
	  $u_id = $('input[name="u_id"');
	  $p_id = $('input[name="p_id"');
	  
  if (title != "" && text != "") {
	  

   $("#todo").append('<div class="box one"><div id="shade"><div class="header" id="header">' + title + '</div><div class="container"><div class="two">' + text + '</div><div><center><button class="btn btn-outline-dark delete mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect"> <i class="material-icons">delete</i> </button> </center></div> </div></div></div>');
    $("#form").val(' ');
    
    console.log($date.val());
    console.log($u_id.val());
    console.log($p_id.val());
    
    $.ajax({
	  	  type: "POST",
	  	  url: "Notes_adder.jsp",
	  	  data: { title: title, note: text,time:$date.val() , unit_id : $u_id.val(),property_id: $p_id.val() }
	  	});
    
    document.getElementById("hidden").style.display = "none";
    document.getElementById("show").style.display = "block";
    
    document.getElementById("formtitle").value = "";
    document.getElementById("formbody").value = "";
   // window.location.reload();
    //return false;
    
  }
  
}
</script>

</html>
    