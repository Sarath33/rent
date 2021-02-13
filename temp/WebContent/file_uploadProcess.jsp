<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
    <%@page import="java.io.*" %>
    <%@page import="java.util.*"%>

<% 


	     Part filePart = request.getPart("file");
	    String bookId = request.getParameter("bookId");
	    
	    InputStream pdfFileBytes = null;
	    final PrintWriter writer = response.getWriter();

	    try {
	    	
	        
	      if (!filePart.getContentType().equals("application/pdf"))
     	    {
		    		   writer.println("<br/> Invalid File");
		    		   return;
     	    }
		    
     	   else if (filePart.getSize()>1048576 ) { //2mb
     		   {
     		  writer.println("<br/> File size too big");
     		  return;
     		   }
     	   }

	        pdfFileBytes = filePart.getInputStream();  // to get the body of the request as binary data

	        final byte[] bytes = new byte[pdfFileBytes.available()];
	         pdfFileBytes.read(bytes);  //Storing the binary data in bytes array.
	        
	        Connection  con=null;
	         Statement stmt=null;

		       try {
		    	   Class.forName("com.mysql.jdbc.Driver"); 
		    	   con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");
		          } catch (Exception e) {
		    	  		System.out.println(e);
		                System.exit(0); 
		                      }
		       
		      try {     
		    	  stmt = con.createStatement();
		    	  //to create table with blob field (One time only)
		    	  stmt.executeUpdate("CREATE TABLE Book (BookId varchar (10) not null , BookContent MEDIUMBLOB)");

		      } catch (Exception e) {
		        		System.out.println("Tables already created, skipping table creation process");
		          }
		      
				int success=0;
		        PreparedStatement pstmt = con.prepareStatement("INSERT INTO Book VALUES(?,?)");
		        pstmt.setString(1, bookId);
		        pstmt.setBytes(2,bytes);    //Storing binary data in blob field. 
		        success = pstmt.executeUpdate();
		        if(success>=1)  System.out.println("Book Stored");
		         con.close(); 
	        
	        
		         writer.println("<br/> Book Successfully Stored");

	    
	    } catch (FileNotFoundException fnf) {
	        writer.println("You  did not specify a file to upload");
	        writer.println("<br/> ERROR: " + fnf.getMessage());

	    } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
	    
	        if (pdfFileBytes != null) {
	        	pdfFileBytes.close();
	        }
	        if (writer != null) {
	            writer.close();
	        }
	    }

	%>