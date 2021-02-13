

<%@page import="java.sql.*,java.util.*"%>
<%  
 String tt = (String)request.getParameter("p_name"); 
%>

<%! 
 String getAlphaNumericString(int n,String temp) 
{ 

    // chose a Character random from this String 
    String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                + "0123456789"
                                + "abcdefghijklmnopqrstuvxyz"; 

    // create StringBuffer size of AlphaNumericString
    
   
     
    String sb =  "IB"+temp.substring(0,2);
    for (int i = 0; i < n; i++) { 

        // generate a random number between 
        // 0 to AlphaNumericString variable length 
        int index 
            = (int)(AlphaNumericString.length() 
                    * Math.random()); 

        // add Character one by one in end of sb 
        sb = sb + AlphaNumericString 
                      .charAt(index); 
    } 

    return sb; 
}
%>
<%

Connection con = null;
PreparedStatement ps = null;
String id = null;
Class.forName("com.mysql.jdbc.Driver"); 
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");
String query = "";
String p_name =(String) request.getParameter("p_name");
String email = (String)request.getParameter("email");
System.out.println(email);
session.setAttribute("email",email);
try{
	
	 query = "insert into Property values(?,?,?,?,?,?,?,?)";
	ps = con.prepareStatement(query);
	 Statement st= con.createStatement();

	id = getAlphaNumericString(4,request.getParameter("p_name"));
	
	
	ps.setString(1,"sarath");
	
	ps.setString(2, (String)request.getParameter("p_name"));
	
	ps.setString(3, (String)request.getParameter("no_units"));
	
	ps.setString(4, (String)request.getParameter("address"));
	
	ps.setString(5, (String)request.getParameter("contact"));
	
	ps.setString(6, id);
	
	ps.setString(7,(String)session.getAttribute("email"));
	ps.setInt(8,0);
	
	 ps.executeUpdate();
	
	
	
	
	
	ps.close();







 int n=0;
 n = Integer.parseInt(request.getParameter("no_units"));
 System.out.println(n);
 String arr[] = new String[n];

 
 //String email = (String)request.getParameter("email");
 
 
 ResultSet rs = null;
 
  
 String temp = (String)request.getParameter("p_name");


 String password=request.getParameter("password");


 for(int i=0;i<n;i++)
 {
 String ii = getAlphaNumericString(4,temp);
	arr[i] = ii;
  query = "insert into Unit(unit_id,property_id) values('"+ii+"','"+id+"')";
 st.executeUpdate(query);
 }
 
 rs.close();

 con.close();
 
 }
 catch(Exception e)
 {
	 System.out.println(e);
 }

 

 %>


<jsp:forward page="properties.jsp">
<jsp:param name="em" value="jsj" />
	 
  
 </jsp:forward>