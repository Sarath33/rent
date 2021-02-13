<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*,java.util.*,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat"%>
 
 <%! 
 String getAlphaNumericString(int n,String temp) 
{ 

    // chose a Character random from this String 
    String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                + "0123456789"
                                + "abcdefghijklmnopqrstuvxyz"; 

    // create StringBuffer size of AlphaNumericString
    
   
     
    String sb =  "CO"+temp.substring(0,2);
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
     String unit_id = request.getParameter("unit_id");
	    String p_id = request.getParameter("property_id");
	    String title = request.getParameter("complaint-name");
	    String description = request.getParameter("complaint-des");
	    String landlord = "";
	   String c_id =  getAlphaNumericString(4,title);
	    Date date = new Date();  
	     SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
	     String strDate= formatter.format(date);
	    
	    Connection con = null;
	    ResultSet rs = null;
	    try{

	    	Class.forName("com.mysql.jdbc.Driver"); 
	    	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");
	    	Statement st = con.createStatement();
	    	
	    	String query = "select * from property where property_id='"+p_id+"' ";
	    	
	    	rs = st.executeQuery(query);
	    	while(rs.next())
	    	{
	    		landlord = rs.getString("email");
	    		p_id = rs.getString("property name");
	    	}
	    }
	    catch(Exception e)
	    {
	    	System.out.println(e);
	    }
	    try{

	    	Class.forName("com.mysql.jdbc.Driver"); 
	    	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");
	    	
	    	PreparedStatement pstmt = con.prepareStatement("INSERT INTO complaints VALUES(?,?,?,?,?,?,?,?)");
	    	
	    		pstmt.setString(1,c_id);
		        pstmt.setString(2, title);
		        pstmt.setString(3,description); 
		        pstmt.setString(4, unit_id);
		        pstmt.setString(5, p_id);
		        pstmt.setString(6,"not seen");
		        pstmt.setString(7,landlord);
		        pstmt.setString(8,strDate);
		        
		        
		        pstmt.executeUpdate();
		        System.out.println("inserted");
	    }
	    catch(Exception e)
	    {
	    	System.out.println(e);
	    }
	    
	    
	 %>
	 
	 <jsp:forward page="/complaint_post.jsp">

  <jsp:param name="ema" value="ksk" />
  
 </jsp:forward>
    