package temp;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/FileUpload")
@MultipartConfig
public class FileUploadPdf extends HttpServlet {
	String getAlphaNumericString(int n,String temp) 
	{ 

	    // chose a Character random from this String 
	    String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	                                + "0123456789"
	                                + "abcdefghijklmnopqrstuvxyz"; 

	    // create StringBuffer size of AlphaNumericString
	    
	   
	     
	    String sb =  "DO"+temp.substring(0,2);
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
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;



	protected void doPost(HttpServletRequest request,  HttpServletResponse response)       throws ServletException, IOException {
	    response.setContentType("text/html;charset=UTF-8");

	    final Part filePart = request.getPart("file");
	    String bookId = request.getParameter("bookId");
	    String unit_id = request.getParameter("unit_id");
	    String p_id = request.getParameter("p_id");
	    String id = getAlphaNumericString(4,request.getParameter("bookId"));
	    
	    InputStream pdfFileBytes = null;
	    

	    try {
	    	
	        
	      if (!filePart.getContentType().equals("application/pdf"))
     	    {
		    		 
		    		   return;
     	    }
		    
     	   else if (filePart.getSize()>1048576 ) { //2mb
     		   {
     			  
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
		    	  stmt.executeUpdate("CREATE TABLE Book (doc_id varchar(20), BookId varchar (10) not null , BookContent MEDIUMBLOB,unit_id,property_id)");

		      } catch (Exception e) {
		        		System.out.println("Tables already created, skipping table creation process");
		          }
		    
				int success=0;
		        PreparedStatement pstmt = con.prepareStatement("INSERT INTO Book VALUES(?,?,?,?,?)");
		        
		        pstmt.setString(1,id);
		        pstmt.setString(2, bookId);
		        pstmt.setBytes(3,bytes); 
		        pstmt.setString(4, unit_id);
		        pstmt.setString(5, p_id);
		        //Storing binary data in blob field. 
		        success = pstmt.executeUpdate();
		        if(success>=1)  System.out.println("Book Stored");
		        
		        pstmt.close();
		         con.close(); 
	        
		         
		         if (pdfFileBytes != null) {
			        	pdfFileBytes.close();
			        }
		         
		         
	    } catch (FileNotFoundException fnf) {
	      

	    } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
	    

	       
	    }
	                  
	    RequestDispatcher requestDispatcher = request.getRequestDispatcher("Documents.jsp");
 	    
        requestDispatcher.forward(request, response);
	    
	}
	
	
}