package temp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Register_process {
	
	public static void validate(Object obj){
		System.out.println(obj);
		boolean d = false;
	
	try
	{
		Class.forName("org.sqlite.JDBC");
		Connection con=DriverManager.getConnection("jdbc:sqlite:D:/database/demo/table.db");
	Statement st=con.createStatement();
	
	String query ="";
			//"insert into Admin(uname,pass)values('"+email+"','"+password+"')";
	st.executeUpdate(query);
	
	}
	catch(Exception e)
	{
	System.out.print(e);
	e.printStackTrace();
	}
	}
	

}
