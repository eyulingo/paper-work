package io.github.eyulingo.Utilities

import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.core.io.ClassPathResource
import org.springframework.mail.javamail.JavaMailSenderImpl
import java.util.*


@Configuration
open class MailConfiguration {
    @Bean
    open fun JavaMailSender(): JavaMailSenderImpl {
        // create file input stream object for the properties file
        val fis = ClassPathResource(
                "application.properties").inputStream
        // create Properties class object to access properties file
        val prop = Properties()
        // load the properties file
        prop.load(fis)
        // get the property of "url" using getProperty()

        val mailSender = JavaMailSenderImpl()
        mailSender.host = prop.getProperty("spring.mail.host")
        mailSender.port = prop.getProperty("spring.mail.port").toInt()
        mailSender.username = prop.getProperty("spring.mail.username")
        mailSender.password = prop.getProperty("spring.mail.password")

        return mailSender
    }
}