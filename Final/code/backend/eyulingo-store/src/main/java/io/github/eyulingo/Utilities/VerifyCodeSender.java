package io.github.eyulingo.Utilities;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

public class VerifyCodeSender {
    public void sendHtmlMail(String to, String subject, String captcha) throws MessagingException {
        MailConfiguration mC = new MailConfiguration();
        JavaMailSender javaMailSender = mC.JavaMailSender();

        String content = "<!DOCTYPE html>\n" +
                "<html lang=\"en\" xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:th=\"http://www.thymeleaf.org\">\n" +
                "<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <title>Eyulingo 验证邮件</title>\n" +
                "</head>\n" +
                "<body>\n" +
                "    <h1>感谢您注册 Eyulingo！</h1>\n" +
                "    <h3>此封邮件用于确认您的电子邮件地址是否有效。<br>您的验证码是：</h3>\n" +
                "    <h2 th:text=" + captcha + "></h2>\n" +
                "    <h3>谢谢！</h3>\n" +
                "    <h3>Eyulingo 敬上</h3>\n" +
                "</body>\n" +
                "</html>";
        //创建message
        MimeMessage message = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true);
        //发件人
        helper.setFrom("eyulingo@yandex.com");
        //收件人
        helper.setTo(to);
        //邮件标题
        helper.setSubject(subject);
        //true指的是html邮件
        helper.setText(content, true);
        //发送邮件
        javaMailSender.send(message);
    }
}


