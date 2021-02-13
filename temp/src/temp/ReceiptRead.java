package temp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
 
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
/**
 * Servlet implementation class GetDetails
 */
@WebServlet("/ReceiptRead")
public class ReceiptRead extends HttpServlet {
    private static final long serialVersionUID = 1L;
        
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReceiptRead() {
        super();
        // TODO Auto-generated constructor stub
    }
 
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         
    	 String bookId = request.getParameter("BookId");
    	    
    	    ServletOutputStream sos;
    	    Connection  con=null;
    	    PreparedStatement pstmt=null;
    	     
    	    response.setContentType("application/pdf");

    	    response.setHeader("Content-disposition","inline; filename="+bookId+".pdf" );

    	System.out.print("came up");
    	     sos = response.getOutputStream();
    	     String id = request.getParameter("BookId");

    	       try {
    	    	   Class.forName("com.mysql.jdbc.Driver"); 
    	      	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");  
    	      } catch (Exception e) {
    	                 System.out.println(e);
    	                 System.exit(0); 
    	                      }
    	        
    	      ResultSet rset=null;
    	        try {
    	            pstmt = con.prepareStatement("Select receipt from receipt where receipt_id=?");
    	            pstmt.setString(1, id);
    	            rset = pstmt.executeQuery();
    	            if (rset.next())
    	                sos.write(rset.getBytes("receipt"));
    	            else
    	                return;
    	             
    	        } catch (SQLException e) {
    	            // TODO Auto-generated catch block
    	            e.printStackTrace();
    	        }
    	 
    	    sos.flush();
    	    sos.close();
    	     
         
    }
 
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
   
 
}
