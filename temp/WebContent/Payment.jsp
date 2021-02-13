<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*,java.util.*,java.util.Date,java.sql.Timestamp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
        integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<style>
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
body{
    
    font-family: Arial, Helvetica, sans-serif;
}
.wrapper{
   
    width: 500px;
    padding: 25px;
    margin: 25px auto 0;
}
.wrapper h2{
    
    font-size: 24px;
    padding: 10px;
    margin-bottom: 20px;
    text-align: center;
    
}
h4{
    padding-bottom: 5px;
}
.input-group{
    margin-bottom: 8px;
    width: 100%;
    position: relative;
    display: flex;
    flex-direction: row;
    padding: 5px 0;
}
.input-box{
    width: 100%;
    margin-right: 12px;
    position: relative;
}
.input-box:last-child{
    margin-right: 0;
}
.name{
    padding: 14px 10px 14px 50px;
    width: 100%;
    outline: none;
    letter-spacing: 1px;
    transition: 0.3s;
    border-radius: 3px;
    color: #333;
}
.input-box .icon{
    width: 48px;
    display: flex;
    justify-content: center;
    align-items: center;
    position: absolute;
    top: 0px;
    left: 0px;
    bottom: 0px;
    color: #333;
    background-color: #f1f1f1;
    border-radius: 2px 0 0 2px;
    transition: 0.3s;
    font-size: 20px;
    pointer-events: none;
    border: 1px solid #00000033;
    border-right: none;
}
.name:focus + .icon{
    background-color: #42C0FB;
    border-right: 1px solid;
    border: none;
    transition: 1s;
}
.dob{
    width: 30%;
    padding: 14px;
    text-align: center;
    transition: 0.3s;
    outline: none;
    border: 1px solid;
    border-radius: 3px;
}
.radio{
    display: none;
}
.input-box label{
    width: 50%;
    padding: 13px;
    background-color: #fcfcfc;
    display: inline-block;
    float: left;
    text-align: center;
    border: 1px solid #c0bfbf;
}

.radio:checked + label{
    background-color: #42C0FB;
    color: #fff;
    transition: 0.5s;
}
.input-box select{
    display: inline-block;
    width: 50%;
    padding: 12px;
    background-color: #fcfcfc;
    float: left;
    text-align: center;
    font-size: 16px;
    outline: none;
    border: 1px solid #c0bfbf;
    cursor: pointer;
    transition: all 0.2s ease;
}

button{
    width: 100%;
    background: transparent;
    border: none;
    background: #42C0FB;
    padding: 15px;
    border-radius: 4px;
    font-size: 16px;
    transition: all 0.35s ease;
}
</style>
</head>
<body>
    <div class="wrapper">
        <h2>
Payment Form</h2>

            <h4>
Account</h4>
<div class="input-group">
                <div class="input-box">
                    <input type="text" placeholder="Name" class="name">
                    <i class="fa fa-user icon"></i>
                </div>

</div>
<div class="input-group">
                <div class="input-box">
                    <input type="email" placeholder="Email id"  class="name">
                    <i class="fa fa-envelope icon"></i>
                </div>
</div>

<div class="input-group">
                <div class="input-box">
                    <h4>
Payment Details</h4>
<input type="radio" name="pay" id="bc1" checked class="radio">
                    <label for="bc1"><span><i class="fa fa-cc-visa"></i> Credit Card</span></label>
                    <input type="radio" name="pay" id="bc2" class="radio">
                    <label for="bc2"><span><i class="fa fa-cc-paypal"></i> Paypal</span></label>
                </div>
</div>
<div class="input-group">
                <div class="input-box">
                    <input type="tel" placeholder="Card Number"  class="name">
                    <i class="fa fa-credit-card icon"></i>
                </div>
</div>
<div class="input-group">
                <div class="input-box">
                    <input type="tel" placeholder="Card CVC"  class="name">
                    <i class="fa fa-user icon"></i>
                </div>

</div>
<div class="input-group">
                <div class="input-box">
                <%
                String id = (String)session.getAttribute("unit_id");
                Connection con = null;
                ResultSet rs = null;
                 try{

                	 Class.forName("com.mysql.jdbc.Driver"); 
                	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");           
                        Statement  st=con.createStatement();
                        String query = "select * from unit where unit_id='"+id+"' ";
                        rs = st.executeQuery(query);
                 while(rs.next()){
                %>
                <input name="amount" value="<%= rs.getString("rent_amount") %>" hidden/>
                <input name="name" value="<%=rs.getString("tenant_name") %>" hidden/>
               
                    
                  <%
                  
                  }}
                  catch(Exception e)
                  {
                	  System.out.println(e);
                	  
                  }
                  %>
                  <form action="Receipterr.jsp" method="post">
               
               <input name="id" value="<%= session.getAttribute("unit_id")%>" hidden/>
                <button type="submit">PAY <%=request.getParameter("amount") %></button>
                    
                    
                 </form>
                </div>
</div>

</div>
</body>
</html>