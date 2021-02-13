<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<%@page import=" java.util.*,java.sql.*,java.text.SimpleDateFormat,java.util.Date,javax.servlet.*,java.io.*,com.itextpdf.text.*,com.itextpdf.text.pdf.*,com.itextpdf.tool.xml.*,java.text.DateFormat,com.itextpdf.text.html.simpleparser.HTMLWorker"%>
  
  <%!
  
  String getAlphaNumericString(int n,String temp) 
 	{ 

 	    // chose a Character random from this String 
 	    String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
 	                                + "0123456789"
 	                                + "abcdefghijklmnopqrstuvxyz"; 

 	    // create StringBuffer size of AlphaNumericString
 	    
 	   
 	     
 	    String sb =  "RE"+temp.substring(0,2);
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
 
 

 
 
  final long serialVersionUID = 1L;
  	try{
		//String file="E:\\sample14.pdf";
		
		 Date today = new Date();  

     Calendar calendar = Calendar.getInstance();  
     calendar.setTime(today);  

     calendar.add(Calendar.MONTH, 1);  
     calendar.set(Calendar.DAY_OF_MONTH, 1);  
     calendar.add(Calendar.DATE, -1);  

     Date lastDayOfMonth = calendar.getTime();  
     String dat = lastDayOfMonth.toString();
     String temp = dat.substring(4, 7);
     String temp1 = dat.substring(24);
     temp1 = temp +" "+ temp1;
     
     
     DateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
     System.out.println(lastDayOfMonth);
     Date date = new Date();  
     SimpleDateFormat formatter = new SimpleDateFormat("/MM/yyyy");  
     String strDate= formatter.format(date);
     strDate = "01" + strDate ;
		Connection  con=null;
        Statement stmt=null;
		
		ResultSet rs = null;
		Document document = new Document(PageSize.A3);
		
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		PdfWriter pd = PdfWriter.getInstance(document, baos);
		
		document.open();
		
		
		Paragraph para = new Paragraph("hi there");
		   HTMLWorker htmlWorker = new HTMLWorker(document);

		   String rent="";
		   String tenant="";
		   String add = "";
		   String landlord="";
		   String p_id="";
		   
		   try{
	        	 Class.forName("com.mysql.jdbc.Driver"); 
		      	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root",""); 
		      	 
		      	 stmt = con.createStatement();
		      	 String id = request.getParameter("id");
		      	 String query = "select * from unit where unit_id = '"+id+"' ";
		      	 rs = stmt.executeQuery(query);
		      	 
		      	 while(rs.next())
		      	 {
		      		 rent = rs.getString("rent_amount");
		      		 tenant = rs.getString("tenant_name");
		      		 p_id = rs.getString("property_id");
		      		 
		      	 }
		      	 
		      	 query = "select * from property where property_id = '"+p_id+"' ";
		      	 rs = stmt.executeQuery(query);
		      	 
		      	 while(rs.next())
		      	 {
		      		 add = rs.getString("address");
		      		 landlord = rs.getString("landlord_name");
		      	 }
		      	 
		   }catch(Exception e)
		   {
			   System.out.println(e);
		   }
	  
	     
	      htmlWorker.parse(new StringReader("<!DOCTYPE html>"+
	     " <html>"+
	      "<head>"+
	      	"<title></title>"+
	     " </head>"+
	      "<body>"+

	     " <table width='650' cellpadding='0' style='margin:0 auto;padding: 20px;' cellspacing='0'><tbody><tr style='page-break-inside:avoid;'><td style='padding:10px 0;'><table cellspacing='0' style='margin:0 auto;border: 1px solid #ccc;background-color: #fff;padding: 20px;' cellpadding='0' width='650'><tbody><tr><td align='left'><span style='font-size:25px;font-weight:bold'>RENT RECEIPT</span><br><span style='display:inline-block;padding-top:14px;'></span></td><td align='righ' style='vertical-align: top;'><br><span style='display:inline-block;padding-top:18px;'>Date: "+strDate+"</span></td></tr><tr><td colspan='2' style='padding: 36px 0;text-align: left;line-height: 28px;font-size: 19px;'>Received sum of INR <b>Rs. "+rent+"</b> from <b>"+tenant+"</b> towards the rent of property located at <b>"+add +" </b>"+
	     "for the period from <b>"+strDate+"</b> to <b>"+sdf.format(lastDayOfMonth)+"</b></td></tr><tr><td align='left' colspan='2'><b>"+landlord+"</b><span style='color: #ccc;padding: 0 12px;'>(Landlord)</span><br><span style='display:inline-block;padding:12px 0;'></td></tr></tbody></table></td></tr></tbody></table>"+

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
        
    	String id = request.getParameter("id");
      	System.out.println("isikskd "+id);
       byte[] pdf = baos.toByteArray();
       
         date = new Date();  
        formatter = new SimpleDateFormat("dd/MM/yyyy");  
        String strD= formatter.format(date);
        char k = strD.charAt(1);
        System.out.println(k);
        String receipt_id = getAlphaNumericString(4,"ki");
        
        try{
        	 Class.forName("com.mysql.jdbc.Driver"); 
	      	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root",""); 
	      	 
	      	 stmt = con.createStatement();
	      	String query="";
	      	if(k == '9'){
	      	 query = "update unit set payment_status='paid' ,flag=2 where unit_id='"+id+"' ";
	      	 System.out.println("got it here");
	      	}
	      	else{
	      	 query = "update unit set payment_status='paid' ,flag=1 where unit_id='"+id+"' ";
	      	 System.out.println("here");
	      	}
	      	 stmt.executeUpdate(query);
        }
        catch(Exception e)
        {
        	System.out.println(e);
        }

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
	        		//System.out.println("Tables already created, skipping table creation process");
	          }
	      
			int success=0;
			String unit_id = request.getParameter("id");
	        PreparedStatement pstmt = con.prepareStatement("INSERT INTO receipt VALUES(?,?,?,?,?)");
	       
	        pstmt.setString(1,receipt_id);
	        pstmt.setString(2,temp1);
	        pstmt.setBytes(3,pdf);
	        pstmt.setString(4,unit_id);
	        pstmt.setString(5, "IHI8744");
	      
	        //Storing binary data in blob field. 
	        success = pstmt.executeUpdate();
	        if(success>=1) // System.out.println("Book Stored");
	        
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
   %>
   <jsp:forward page="/DashBoard.jsp">

  <jsp:param name="eq" value="" />
  
 </jsp:forward>