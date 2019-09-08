package io.github.eyulingo.Utilities

import io.github.biezhi.ome.OhMyEmail
import org.springframework.core.io.ClassPathResource
import java.util.*

class CodeSender {
    init {
        // create file input stream object for the properties file
        val fis = ClassPathResource(
                "application.properties").inputStream
        // create Properties class object to access properties file
        val prop = Properties()
        // load the properties file
        prop.load(fis)
        // get the property of "url" using getProperty()

        OhMyEmail.config(OhMyEmail.SMTP_163(false), prop.getProperty("check.mail.username"), prop.getProperty("check.mail.password"))
    }



    fun sendCode(to: String, code: String) {
        val content = "<!DOCTYPE html>\n" +
                "<html lang=\"en\" xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:th=\"http://www.thymeleaf.org\">\n" +
                "<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <title>Eyulingo 验证邮件</title>\n" +
                "</head>\n" +
                "<body>\n" +
                "    <h1>感谢您注册 Eyulingo！</h1>\n" +
                "    <h3>此封邮件用于确认您的电子邮件地址是否有效。<br>您的验证码是：</h3>\n" +
                "    <h2>" + code + "</h2>\n" +
                "    <h3>谢谢！</h3>\n" +
                "    <h3>Eyulingo 敬上</h3>\n" +
                "</body>\n" +
                "</html>"


        OhMyEmail.subject("Eyulingo 验证消息")
                    .from("Eyulingo 团队")
                    .to(to)
                    .html(content)
                    .send()

    }
}