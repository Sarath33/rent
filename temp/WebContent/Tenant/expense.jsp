<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <title>Expense editor</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link  href="../expense/expense.css" rel="stylesheet">

  <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
  <script type="text/javascript" src="../expense/expense.js"></script>
</head>

<body>
<form action = '../DashBoard.jsp' method="post">
<input name="id" value="<%=session.getAttribute("unit_id") %>" hidden />
<input value="notes" type="submit" />
</form>

  <div class="main">
    <h1>Expense Manager</h1>
    <h4>Add a new item:</h4>

    <div id="form-box">
      <form>
        <div>
          <span>Type:</span>
          <select name="type">
            <option value="card">Card</option>
            <option value="cash">Cash</option>
            <option value="cryptocoin">Cryptocoin</option>
            <option value="other">Other</option>
          </select>
        </div>

        <div>
          <span>Name:</span> <input type="text" name="item-name" value="ielw" placeholder="What did you spend on?">
        </div>

        <div>
          <span>Date:</span> <input type="date" name="date">
        </div>

        <div>
          <span>Amount:</span> <input type="number" name="amount" value="493" placeholder="How much?">
        </div>
			<input name="u_id" value="<%= request.getParameter("unit_id") %>" hidden/>
			<input name="p_id" value="<%= session.getAttribute("p_id") %>" hidden/>
			
      </form>
    </div>

    <div id="button"><span>Add a new expense</span></div>

    <table>
      <tr>
        <th id="type" class="center">Type</th>
        <th>Name</th>
        <th id="date" class="center">Date</th>
        <th id="amount">Amount</th>
      </tr>
     <tr id="if-empty">
      <td colspan="4"><span>Your added items will show up here!</span></td>
    </tr>
      <%
      
      Connection con = null;
      ResultSet rs = null;
      try{

    	  Class.forName("com.mysql.jdbc.Driver"); 
    	  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");
     // where unit_id='"+request.getParameter("unit_id")+"' and property_id='"+session.getAttribute("p_id")+"'
    		       Statement st= con.createStatement();
      String query="select * from expense where unit_id='"+request.getParameter("unit_id")+"' and property_id='"+session.getAttribute("p_id")+"'";

      System.out.println(request.getParameter("unit_id")+ " "+session.getAttribute("p_id"));
      rs = st.executeQuery(query);
      while(rs.next())
      {
    	  
      
      %>
     <tr><td> 
         kio
          </td><td> 
         <%= rs.getString("name") %>
          </td><td>
          
          <%= rs.getString("time") %>
          </td><td class="amount">Rs. 
          <%= rs.getString("amount") %>
          </td></tr>
      <%
      
      }
      rs.close();
      con.close();
      }
      catch(Exception e)
      {
    	  
      }
      
      %>
    </table>
  </div>

</body>

</html>
    