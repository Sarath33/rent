<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

     <%@page import="java.sql.*,java.util.*"%>
     <%!
String getAlphaNumericString(int n,String temp) 
{ 

    // chose a Character random from this String 
    String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                + "0123456789"
                                + "abcdefghijklmnopqrstuvxyz"; 

    // create StringBuffer size of AlphaNumericString
    
   
     
    String sb =  "NO"+temp.substring(0,2);
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
Class.forName("com.mysql.jdbc.Driver"); 
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");

String id = getAlphaNumericString(4,request.getParameter("title"));
try{
	 Statement st= con.createStatement();
	 //System.out.println("date" +request.getParameter("date"));
	 String title = (String)request.getParameter("title");
	 String note = (String)request.getParameter("note");
	 String date = (String)request.getParameter("time");
	 String unit_id = (String)request.getParameter("unit_id");
	 String property_id = (String)request.getParameter("property_id");
	 String query = "insert into notes(note_id,title,note,time,unit_id,property_id) values('"+id+"','"+title+"','"+note+"','"+date+"','"+unit_id+"','"+property_id+"')";
	 st.executeUpdate(query);
	 
	con.close();
}catch(Exception e){
	
}
%>