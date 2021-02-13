package temp;


import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.annotation.WebServlet;

import java.util.*;
import java.util.logging.Level;

public class Mail_messsage {

   final static String senderEmailID = "sarathgopal33@gmail.com";
final String senderPassword = "bharathiboy";
final static String emailSMTPserver = "smtp.gmail.com";
final static String emailServerPort = "587";
static String receiverEmailID = null;
static String emailSubject = "Test Mail";
static String emailBody = ":)";
  public static void Mail(String recepient)  throws Exception{
   
  // Receiver Email Address
  receiverEmailID="sarathdhoni33@gmail.com"; 
  // Subject
  emailSubject="hi there";
  // Body
  emailBody="dffdsfds";
  Properties props = new Properties();
  
  props.put("mail.smtp.host", emailSMTPserver);
  props.put("mail.smtp.port", emailServerPort);
  props.put("mail.smtp.starttls.enable", "true");
  props.put("mail.smtp.auth", "true");
  
  String myAccountEmail = "sarathgopal33@gmail.com";
  String password="bharathiboy";
  
  
 
  Session session = Session.getInstance(props, new Authenticator(){
  
  @Override
  protected PasswordAuthentication getPasswordAuthentication(){
	  return new PasswordAuthentication(myAccountEmail,password);
  }
  
  });
  
  Message message = prepareMessage(session, myAccountEmail, recepient);
  
  Transport.send(message);
  
  System.out.println("doneee");
  }
  
  
  private static Message prepareMessage(Session session, String myAccountEmail,String recepient)
  {
	
	  try{
		  Message message = new MimeMessage(session);
		  message.setFrom(new InternetAddress(myAccountEmail));
		  message.setRecipient(Message.RecipientType.TO, new InternetAddress(recepient));
		  message.setSubject("headerer ");
		  message.setText("kksklf");
		  return message;
	  }
	  catch(Exception e)
	  {
		 System.out.println(e);
	  }
	  return null;
	  
  }
  
}

  
  
  
