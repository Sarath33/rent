<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <title>complaint post page</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <link href="complaint/complaint_post.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"> </script>
  <script type="text/javascript" src="complaint/complaint_post.js"></script>
</head>

<body>
<form action="Tenant_home.jsp" >
<input name="get" value="1" hidden/>
<button class="btn btn-primary">back</button>
</form>
  <div class="main">
    <h1>Complaint Box</h1>
    <h4>Add a query to landlord:</h4>

    <div id="form-box">
      <form action="complaint_process.jsp" method="post">
        <div class="">
        <input name="property_id" value="<%=session.getAttribute("p_id") %>" hidden/>
        <input name="unit_id" value="<%=session.getAttribute("unit_id") %>" hidden/>
          <label>Give a Title</label>
          <input type="text" id="formtitle" class="form-control" name="complaint-name" placeholder="Title..." required>
        </div>
        <div class="">
          <label>Describe it</label>
          <textarea id="formbody" class="form-control" name="complaint-des" placeholder="Description" required></textarea>
        </div>

    
    </div>

    <button id="button"  class="btn btn-lg btn-outline-dark btn-block">Add Complaint</button>
  </form>
   
  </div>

</body>

</html>
    