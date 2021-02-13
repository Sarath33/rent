<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>login</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">


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
  <link href="signin.css" rel="stylesheet">
</head>

<body class="text-center">

  <main class="form-signin">
    <form action="login_process.jsp" method="post">   

      <h1 class="h2 mb-4 fw-normal">Tenant sign in</h1>
      
      <input value="Tenant" name='get' hidden>
      <label for="inputEmail" class="visually-hidden">Email address</label>
      <input type="email" id="inputEmail" class="form-control" placeholder="Email address" name="userid" required autofocus>
      <label for="inputPassword" class="visually-hidden">Password</label>
      <input type="password" id="inputPassword" class="form-control" placeholder="Password"  name="password" required>
      <div class="checkbox mb-3">
        
      </div>
      <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>

    </form>
  </main>



</body>

</html>



<%
String email = request.getParameter("email");
    		  
    		if(email != null)
    		{%>
    		<script>
    			alert("incorrect creditials");
    		</script>
    		 <%
    		}

%>