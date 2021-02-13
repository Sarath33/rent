<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
    <%@page import="java.io.*" %>
    <%@page import="java.util.*"%>

    <%
    String bookId = request.getParameter("BookId");
    
    ServletOutputStream sos;
    Connection  con=null;
    PreparedStatement pstmt=null;
     
    response.setContentType("application/pdf");

    response.setHeader("Content-disposition","inline; filename="+bookId+".pdf" );

System.out.print("came up");
     sos = response.getOutputStream();
     

       try {
    	   Class.forName("com.mysql.jdbc.Driver"); 
      	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");  
      } catch (Exception e) {
                 System.out.println(e);
                 System.exit(0); 
                      }
        
      ResultSet rset=null;
        try {
            pstmt = con.prepareStatement("Select receipt from receipt where unit_id=?");
            pstmt.setString(1, "IB7472");
            rset = pstmt.executeQuery();
            if (rset.next())
                sos.write(rset.getString("receipt").getBytes());
            else
                return;
             
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
 
    sos.flush();
    sos.close();
     
    %>