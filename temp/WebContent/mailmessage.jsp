<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Send an e-mail</title>
</head>
<body>
  <form action="EmailSendingServlet" method="post">  
To:<input type="text" name="to"/><br/>  
Subject:<input type="text" name="subject"><br/>  
Text:<textarea rows="10" cols="70" name="msg"></textarea><br/>  
<input type="submit" value="send"/>  
</form>  
<a href="Mail_messsage">link</a>
</body>
</html>