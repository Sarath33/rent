<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
  <meta name="generator" content="Hugo 0.79.0">
  <title>Signin Template · Bootstrap v5.0</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"> </script>

  <style>
  html,
body {
  height: 100%;
}

body {
  display: flex;
  align-items: center;
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #f5f5f5;
}

.form-signin {
  width: 100%;
  max-width: 330px;
  padding: 15px;
  margin: auto;
}
.form-signin .checkbox {
  font-weight: 400;
}
.form-signin .form-control {
  margin-bottom: 5px;
  position: relative;
  box-sizing: border-box;
  height: auto;
  padding: 10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}


.form-signin #inputRePassword {
  margin-bottom:30px;
}

#checkbox{
  margin-bottom:30px;
}
  
    .bd-placeholder-img {
      font-size: 1.125rem;
      text-anchor: middle;
      -webkit-user-select: none;
      -moz-user-select: none;
      user-select: none;
    }

    @media (min-width: 768px) {
      .bd-placeholder-img-lg {
        font-size: 3.5rem;
      }
    }
  </style>


  <!-- Custom styles for this template -->

</head>

<body class="text-center">

  <main class="form-signin">
    <form action="signup_adder.jsp" method="post">

      <h1 class="h2 mb-4 fw-normal">Create new account</h1><td>
      <input type="radio" id="female" name="get" value="LandLord" checked>
  		<label for="female">Land Lord</label><br>
  		<input type="radio" id="other" name="get" value="Tenant">
 		 <label for="other">Tenant</label>
      <label for="inputEmail"  class="visually-hidden">Name</label><span id="message1"></span></td>
      <input type="text" name="username" id="username" class="form-control" placeholder="Your Name"  required autofocus>
      <label for="inputEmail" class="visually-hidden">Email address</label>
      <input type="email" name="email" id="email" class="form-control" placeholder="Email address" required>
      <label for="inputPassword" class="visually-hidden">Contact No</label>
      <input type="text" name="contact" id="contact" class="form-control" placeholder="Contact No"  required>
      <label for="inputPassword" class="visually-hidden">Password</label>
      <input type="password" name="password" id="password" class="form-control" placeholder="Password"  required>
      <label for="inputPassword" class="visually-hidden">Re-Type Password</label>
      <input type="password" id="confirm_password" class="form-control" placeholder="Re-Type Your Password"  required><span id="message"></span>
      <button class="w-100 btn btn-lg btn-primary" type="submit">Login</button>

    </form>
  </main>


<%

Connection con = null;

ResultSet rs = null;

try{

Class.forName("com.mysql.jdbc.Driver"); 
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");
 Statement st=con.createStatement();
String query = "select count(*) from admin";
rs = st.executeQuery(query);
rs.next();
String arr[] = new String[rs.getInt(1)];
 query = " select * from admin";
 rs = st.executeQuery(query);
 int k=0;
 while(rs.next())
 {
	 arr[k] = rs.getString("username");
 }
	



rs.close();
con.close();

}
catch(Exception e)
{
	
}

%>
</body>
<script>
$('#password, #confirm_password').on('keyup', function () {
	  if ($('#password').val() == $('#confirm_password').val()) {
	    $('#message').html('Matching').css('color', 'green');
	  } else 
	    $('#message').html('Not Matching').css('color', 'red');
	});

</script>
</html>