package temp;

import java.io.*;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet("/Tenant_adder")
public class Tenant_adder extends HttpServlet
{
    public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
    {
      response.setContentType("text/html");
      PrintWriter out=response.getWriter();
      Connection con = null;
      ResultSet rs = null;
       try{

      	 Class.forName("com.mysql.jdbc.Driver"); 
      	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sarath","root","");           
              Statement  st=con.createStatement();

      String Unit=request.getParameter("unit");
      System.out.println(Unit);
      
      	
      out.println("<h1>hiiii </h1>");
      out.println("<a href='DBLoginValidationClient1.html'>Back</a>");
      out.close();
       }
       catch(Exception e)
       {
    	   System.out.println(e);
       }
     

   

    

      
    }
}
