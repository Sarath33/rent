<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%!
String userid=null;%>
<%
String get =request.getParameter("get");
System.out.println(get);
 userid=request.getParameter("userid");
session.setAttribute("email",userid);
Connection con = null;
ResultSet rs = null;
try{
String password=request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver"); 
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");
Statement st= con.createStatement();
if(get.equals("LandLord"))
{System.out.println("landlord");
 rs=st.executeQuery("select * from Admin where email='"+userid+"' and pass='"+password+"'");

while(rs.next()){
if(rs.getString("pass").equals(password)&&rs.getString("email").equals(userid))
{
	out.println("<h1> welcomee </h1>" +userid);
	%> <html><body>
<jsp:forward page="properties.jsp">

  <jsp:param name="email" value="<%=userid %>" />
  
 </jsp:forward>
</body></html><% 
}

}
%><jsp:forward page="/index.jsp">

  <jsp:param name="email" value="<%=userid %>" />
  
 </jsp:forward><%
}
else
{
	 rs=st.executeQuery("select * from admin where email='"+userid+"' and pass='"+password+"'");
	 System.out.println("tenantt");
	 while(rs.next()){
	 if(rs.getString("pass").equals(password)&&rs.getString("email").equals(userid))
	 {	String claim = rs.getString("claim");
	 	out.println("<h1> welcomee </h1>" +userid);
	 	%> <html><body>
	 <jsp:forward page="/Tenant_home.jsp">
	<jsp:param name="get" value="<%=claim %>" />
	   <jsp:param name="email" value="<%=userid %>" />
	   
	  </jsp:forward>
	 </body></html><% 
	 }

	 }
	 %><jsp:forward page="/Tenant_login.jsp">

	   <jsp:param name="email" value="<%=userid %>" />
	   
	  </jsp:forward><%
}

rs.close();
con.close(); 
}
catch (Exception e) {
System.out.println(e);
}
	

%>
<jsp:forward page="/index.jsp">

  <jsp:param name="email" value="<%=userid %>" />
  
 </jsp:forward>

