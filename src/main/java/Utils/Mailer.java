package Utils;

import java.io.File;
import java.util.Properties;

import jakarta.mail.*;
import jakarta.mail.internet.*;
import jakarta.activation.*;

public class Mailer {
    public static void send(String from, String to, String subject, String body, String imagePath) {
        Properties props = new Properties();
        props.setProperty("mail.smtp.auth", "true");
        props.setProperty("mail.smtp.starttls.enable", "true");
        props.setProperty("mail.smtp.host", "smtp.gmail.com");
        props.setProperty("mail.smtp.port", "587");
        props.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");

        String username = "langochungse23@gmail.com";
        String password = "cajf dbqb ofzr mddu";

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        session.setDebug(true);

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject, "utf-8");

            // ⚠️ Multipart chứa nội dung và ảnh đính kèm
            Multipart multipart = new MimeMultipart();

            // ✅ Nội dung HTML
            MimeBodyPart textPart = new MimeBodyPart();
            textPart.setContent(body, "text/html; charset=UTF-8");
            multipart.addBodyPart(textPart);

            // ✅ Nếu có ảnh thì đính kèm
            if (imagePath != null && !imagePath.isEmpty()) {
                MimeBodyPart imagePart = new MimeBodyPart();
                FileDataSource source = new FileDataSource(new File(imagePath));
                imagePart.setDataHandler(new DataHandler(source));
                imagePart.setFileName(new File(imagePath).getName());
                multipart.addBodyPart(imagePart);
            }

            message.setContent(multipart);
            message.setReplyTo(message.getFrom());

            Transport.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
