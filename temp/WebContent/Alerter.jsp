<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*,java.util.Date,java.text.SimpleDateFormat"%>
    
    
    <%
    
    String day = request.getParameter("days");
    String remainders = request.getParameter("remainders");
    String message = request.getParameter("message");
   // String id = session.getAttribute("unit_id");
    
    int remain = Integer.parseInt(remainders);
    int d = Integer.parseInt(day);
    
    
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.sss");
	//Getting current date
	Calendar cal = Calendar.getInstance();
	//Displaying current date in the desired format
	//System.out.println("Current Date: "+sdf.format(cal.getTime()));
	   
	//Number of Days to add
        //cal.add(Calendar.DAY_OF_MONTH, 7);  
	//Date after adding the days to the current date
	String newDate = sdf.format(cal.getTime());  
	//Displaying the new Date after addition of Days to current date
	//System.out.println("Date after Addition: "+newDate);
    
   

    
    Date date = new Date();
    Timestamp timestamp2 = new Timestamp(date.getTime());
    
   int count =0;
    
   
   Connection con = null;
    ResultSet rs = null;
    try{

    	Class.forName("com.mysql.jdbc.Driver"); 
    	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");
   
    		       Statement st= con.createStatement();
    while(remain != 0){
    String query="create event if not exists event01 on schedule at current_timestamp + interval "+count+" minute   do insert into remainder_details values('"+day+"','"+remainders+"','"+message+"','iikds')";
	

     st.executeUpdate(query);
     count = count + d;
     remain--;
     
     System.out.println(count);
  
    }    
    }
    catch(Exception e)
    {
    	System.out.println(e);
    }
    
    %>
