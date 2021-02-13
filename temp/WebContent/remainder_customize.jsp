<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<script src="https://code.getmdl.io/1.1.3/material.min.js"></script>
	<link rel="stylesheet" href="https://code.getmdl.io/1.1.3/material.amber-indigo.min.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<!-- Material Design icon font -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"> </script>
	
<title>Rent Management System</title>

<style>
.lpn{
    text-align: center;
    padding:50px 0px 0px 0px;
    font-family: "Helvetica";
    font-weight: bold;
}
.lcn{
    text-align: center;
    padding:20px 0px 0px 0px;
    font-family: "Helvetica";
    font-weight: bold;
}
.tcn{
    text-align: center;
    padding:5px 0px 0px 0px;
    font-family: "Helvetica";
}
.lnu{
    text-align: center;
    padding:20px 0px 0px 0px;
    font-family: "Helvetica";
    font-weight: bold;
}
.tnu{
    text-align: center;
    padding:5px 0px 0px 0px;
    font-family: "Helvetica";
}
.lad{
    text-align: center;
    padding:20px 0px 0px 0px;
    font-family: "Helvetica";
    font-weight: bold;
}
.tad{
    text-align: center;
    padding:5px 0px 0px 0px;
    font-family: "Helvetica";
}
.bton{
    text-align: center;
    padding:20px 0px 0px 0px;
}
input[type="text"],[type="tel"]{
        width:150px;
        padding:5px 0px 5px 70px;
    }
textarea{
        font-family: "Helvetica";
        
    }   
input[type="submit"] {
        height: 30px;
        width: 90px;
        font-family: "Helvetica";
        font-weight: bold;
        background-color: #42C0FB;
        border-radius: 8px;
    }

</style>
</head>
<body>
<form action="unit_dashboard.jsp">
<input name="id" value="<%=session.getAttribute("unit_id") %>" hidden />
<input value="back" type="submit" />
</form>
<div class="lpn">
<h2>Remainder Details</h2>
</div>
<div class="lcn">
<label for="ti">Time Interval:</label>
</div>
<form action="#">
<div class="tcn">
<select name="days" id="cars" >
  <option value="1">daily</option>
  <option value="2">2 days once</option>
  <option value="3" selected>3 days once</option>
  <option value="4">4 days once</option>
  <option value="5">5 days once</option>
  <option value="6">6 days once</option>
  <option value="7">7 days once</option>
  <option value="8">8 days once</option>
  <option value="9">9 days once</option>
  <option value="10">10 days once</option>
</select>
</div>
<div class="lnu">
<label for="nor">Number Of Remainders:(min: 3)</label>
</div>
<div class="tnu">
<input type="number" value="3" id="nor" name="remainders">
</div>
<div class="lad">
<label for="address">Additional Message:</label>
</div>
<div class="tad">
<textarea  id="address" name="message" rows="6" cols="50"></textarea>
</div>
<div class="bton">
<input type="submit" value="Apply" onclick="adder()">

</div>
</form>
</body>


<script>

function adder(){

var days = document.getElementById("cars").value;
	  $remainders = $('input[name="remainders"');
	  $msg = $("textarea#address")
	 

	  console.log(days);
	  
	  $.ajax({
	  	  type: "POST",
	  	  url: "Alerter.jsp",
	  	  data: {	days: days, remainders: $remainders.val() ,message:$msg.val() , unit_id : "IBKDDs"}
	  	});
	  
}
	



</script>
</html>