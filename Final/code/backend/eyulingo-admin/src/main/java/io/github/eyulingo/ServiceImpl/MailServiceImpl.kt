package io.github.eyulingo.ServiceImpl

import io.github.eyulingo.Service.MailService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.beans.factory.annotation.Value
import org.springframework.mail.javamail.JavaMailSender
import org.springframework.mail.javamail.MimeMessageHelper
import org.springframework.stereotype.Service
import javax.mail.internet.MimeMessage



@Service
class MailServiceImpl : MailService {

    @Autowired
    private val mailSender: JavaMailSender? = null


    override fun sendHtmlMail(to: String, subject: String, content: String) {
        val message: MimeMessage = mailSender!!.createMimeMessage()
        try {
            //true表示需要创建一个multipart message
            val helper = MimeMessageHelper(message,true)
//            helper.setFrom(to)
            helper.setTo(to)
            helper.setSubject(subject)
            helper.setText(content,true)
            mailSender.send(message)
            println("Successfully sent email.")
        } catch (e: Exception) {
            println("Failed to sent email.")
            e.printStackTrace()
        }
    }
}
