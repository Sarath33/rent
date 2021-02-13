<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <title>Documents</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <style media="screen">
    .box {
      width: 250px;
      padding: 15px;
      float: left;
      display: inline-block;
    }
    #todo{
      margin-left: 60px;
    }
    .one {
      height: auto;

    }

    .two {
      padding: 10px;
    }

    #shade {
      box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 2px 0 rgba(0, 0, 0, 0.19);

    }

    div.header {
      background-color: gainsboro;
      color: black;
      padding: 10px;
      font-size: 20px;
    }

    .main {
      text-align: center;
      padding: 40px;
      margin: 40px 150px 40px 150px;
      box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
      background-color: #F8F8F8;
    }

    .upload {
      color: black;
      margin: 20px 240px;
      padding: 40px 120px;
      border-radius: 5px;
      box-shadow: 0 0px 4px 0, 0 2px 5px 0 rgba(0, 0, 0, 0.10);
    }

    .viewer {
      color: black;
      margin: 60px 70px;
      padding: 40px;
      border-radius: 5px;
      box-shadow: 0 0px 4px 0, 0 2px 5px 0 rgba(0, 0, 0, 0.10);
    }

    .elements {
      margin: 15px;
    }
  </style>
</head>

<body>
  
    
    <div class="upload">
     <form method="POST" action="FileUpload" enctype="multipart/form-data" >
        <input class="elements form-control form-control-lg" type="text" id="title" name="bookId"  placeholder="Title for the document"  >
        <input class="form-control elements" type="file" id="body" name="file">
        <input name ="p_id" value="<%= session.getAttribute("p_id") %>" hidden>
        <input name="unit_id"  value="<%= session.getAttribute("unit_id") %>" hidden>
       <input type="submit" value="Upload" name="upload" id="upload"/> <h5>(Should not exceed 2MB)</h5>
      </form>
      <a href="Documents.jsp" class="btn btn-warning">back</a>
    </div>
     

 
  <script type="text/javascript">

    $(function() {
      $("#upload").on('click', addItem);
      $(document).on('click', '.delete', deleteItem);
    });
    

    function addItem() {
     
    
    	
      $("#form").val('');
      
    }
    function deleteItem() {
      $(this).closest(".box").fadeOut(300);
    }

    function deleteIteml() {
      $(this).parent().remove();
    }

  </script>

</body>

</html>
    