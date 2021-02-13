package temp;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
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

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.html.simpleparser.HTMLWorker;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.qrcode.ByteArray;
import com.itextpdf.tool.xml.XMLWorkerHelper;

//import com.itextpdf.tool.xml.XMLWorkerHelper;
@WebServlet("/Receipt_generator")

public class Generate_pdf extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // TODO Auto-generated method stub
	    
		
		
		try{
		String file="E:\\sample14.pdf";
		
		Document document = new Document(PageSize.A3);
		
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		PdfWriter pd = PdfWriter.getInstance(document, baos);
		
		document.open();
		
		
		Paragraph para = new Paragraph("hi there");
		   HTMLWorker htmlWorker = new HTMLWorker(document);

	  
	     System.out.println("cameee");
	      htmlWorker.parse(new StringReader("<!DOCTYPE html>"+
	     " <html>"+
	      "<head>"+
	      	"<title></title>"+
	     " </head>"+
	      "<body>"+

	     " <table width='650' cellpadding='0' style='margin:0 auto;padding: 20px;' cellspacing='0'><tbody><tr style='page-break-inside:avoid;'><td style='padding:10px 0;'><table cellspacing='0' style='margin:0 auto;border: 1px solid #ccc;background-color: #fff;padding: 20px;' cellpadding='0' width='650'><tbody><tr><td align='left'><span style='font-size:25px;font-weight:bold'>RENT RECEIPT</span><br><span style='display:inline-block;padding-top:14px;'>Feb-2020</span></td><td align='righ' style='vertical-align: top;'><br><span style='display:inline-block;padding-top:18px;'>Date: 01-Feb-2020</span></td></tr><tr><td colspan='2' style='padding: 36px 0;text-align: left;line-height: 28px;font-size: 19px;'>Received sum of INR <b>Rs. 20,000</b> from <b>Sarath Gopal G</b> towards the rent of property located at <b>CO-OPERATIVE COLONY Coimbatore North</b>"+
	     "for the period from <b>01-Feb-2020</b> to <b>29-Feb-2020</b></td></tr><tr><td align='left' colspan='2'><b>Sarath Gopal G</b><span style='color: #ccc;padding: 0 12px;'>(Landlord)</span><br><span style='display:inline-block;padding:12px 0;'><span>PAN No:</span><span>ALWPG5809L</span></span></td></tr></tbody></table></td></tr></tbody></table>"+

	     " </body>"+
	      "</html>)"));
		
		
		
		document.close();
	
		/*final Part filePart = (Part) document;
		InputStream pdfFileBytes = null;
		 pdfFileBytes =  ((Part) document).getInputStream(); 
		
		String str = document.toString();
		final byte[] bytes = new byte[pdfFileBytes.available()];
        pdfFileBytes.read(bytes);  //Storing the binary data in bytes array.
        */
       byte[] pdf = baos.toByteArray();
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
	    	  stmt.executeUpdate("CREATE TABLE receipt ( receipt MEDIUMBLOB,unit_id,property_id)");

	      } catch (Exception e) {
	        		System.out.println("Tables already created, skipping table creation process");
	          }
	      
			int success=0;
	        PreparedStatement pstmt = con.prepareStatement("INSERT INTO receipt VALUES(?,?,?)");
	       
	        pstmt.setBytes(1,pdf);
	        pstmt.setString(2,"IB7472");
	        pstmt.setString(3, "IHI8744");
	      
	        //Storing binary data in blob field. 
	        success = pstmt.executeUpdate();
	        if(success>=1)  System.out.println("Book Stored");
	        
	        pstmt.close();
	         con.close(); 
       
	         
	        
	         
	         
   } catch (FileNotFoundException fnf) {
     

   } catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (DocumentException e1) {
	// TODO Auto-generated catch block
	e1.printStackTrace();
} finally {
   

      
   }
		
		  RequestDispatcher requestDispatcher = request.getRequestDispatcher("DashBoard.jsp");
		    
	      requestDispatcher.forward(request, response);
		
		
	  }


}
