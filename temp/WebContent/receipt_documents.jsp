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
    .btn{
      margin:20px 30px;
    }
    
    #todo{
      margin-left: 60px;
    }
    .one {
      height: auto;
      margin: auto;

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
      margin: 150px 150px 40px 150px;
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
  

    <nav class="fixed-top navbar-light bg-light">
    <center>
    <form action = 'DashBoard.jsp' method="post">
<input name="id" value="<%=session.getAttribute("unit_id") %>" hidden />
<input  class="btn btn-warning" value="back" type="submit" />
</form>
     
      

    </center>
  </nav>
  <div class="main">
    <center>
      <h2>Documents</h2>
    </center>
  
    
    <div class="row">
 <%
        Connection  con=null;
        PreparedStatement pstmt=null;
      
        //sos = response.getOutputStream();
        
        try {
        	 Class.forName("com.mysql.jdbc.Driver"); 
        	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");
       } catch (Exception e) {
                  System.out.println(e);
                  System.exit(0); 
                       }
         
       ResultSet rset=null;
       String unit_id = (String)session.getAttribute("unit_id");
         try {
        	  Statement st= con.createStatement();
             String query = "Select * from receipt where unit_id='"+unit_id+"' ";
            // pstmt.setString(1, bookId.trim());
             rset = st.executeQuery(query);
             while (rset.next()){
               //  sos.write(rset.getBytes("bookcontent"));
 %>
                 <div class="box one"><div id="shade">
                 <div class="container">
                 <center>
                 <h5><%=rset.getString("receipt_name") %></h5>
                 <form action="ReceiptRead" method="post">
                 <button type="sumbit">
                 <input name="BookId" value="<%=rset.getString("receipt_id") %>" hidden>
                 <img src="notes/download.png" alt="Girl in a jacket" width="50%" height="120">
                   <center> </center>
                 </button>
                 </form>
                  </center>
                  </div></div> </div>

<%
             }
             rset.close();
             st.close();
             con.close();
              
         } catch (SQLException e) {
             // TODO Auto-generated catch block
             e.printStackTrace();
         }
        %>
        
          <br>
          <br><br>
        </ul>
        </div>
	</div>
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