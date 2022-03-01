package utils;

import services.EmailConst;

import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtil {
    public static void sendHTMLMail(String message, String title, String toAddress) throws MessagingException {
        Properties prop = new Properties();
        prop.put("mail.smtp.host", EmailConst.mailhost);
        prop.put("mail.smtp.port", EmailConst.mailport);
        prop.put("mail.smtp.auth", true);
        //prop.put("mail.smtp.starttls.enable", true);

        //Authenticator
        Authenticator auth = new Authenticator(){
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EmailConst.username, EmailConst.password);
            }
        };
        Session session = Session.getInstance(prop, auth);

        // creates a new e-mail message
        Message msg = new MimeMessage(session);

        msg.setFrom(new InternetAddress(EmailConst.mailFrom));
        InternetAddress[] toAddresses = { new InternetAddress(toAddress) };
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setHeader("Content-Type","text/plain; charset=\"utf-8\"");
        msg.setSubject(title);
        msg.setSentDate(new Date());
        msg.setContent(message, "text/html; charset=UTF-8");

        // sends the e-mail
        Transport.send(msg);
        System.out.println("Mail Send");
    }

    public static void sendTextMail(String message, String title, String toAddress) throws MessagingException {
        Properties prop = new Properties();
        prop.put("mail.smtp.host", EmailConst.mailhost);
        prop.put("mail.smtp.port", EmailConst.mailport);
        prop.put("mail.smtp.auth", true);
        //prop.put("mail.smtp.starttls.enable", true);

        //Authenticator
        Authenticator auth = new Authenticator(){
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EmailConst.username, EmailConst.password);
            }
        };
        Session session = Session.getInstance(prop, auth);

        // creates a new e-mail message
        Message msg = new MimeMessage(session);

        msg.setFrom(new InternetAddress(EmailConst.mailFrom));
        InternetAddress[] toAddresses = { new InternetAddress(toAddress) };
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setHeader("Content-Type","text/plain; charset=\"utf-8\"");
        msg.setSubject(title);
        msg.setSentDate(new Date());
        msg.setText(message);

        // sends the e-mail
        Transport.send(msg);
        System.out.println("Mail Send");
    }
}
