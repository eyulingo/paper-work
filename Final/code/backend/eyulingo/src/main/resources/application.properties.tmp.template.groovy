spring.datasource.url=<Placeholder>
/* Put your Release used MySQL Database connection here */
/* Don't forget to add the following parameters: *
/* ?serverTimezone=UTC&useSSL=false&characterEncoding=UTF-8 */

spring.datasource.username=<Placeholder>
/* Put your datasource username here */

spring.datasource.password=<Placeholder>
/* Put your datasource password here */

spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
/* Using com.mysql.cj.jdbc.Driver is suggested */

spring.jpa.properties.hibernate.hbm2ddl.auto=none
/* Set hbm2ddl.auto = none is preferred */

spring.data.mongodb.uri=<Placeholder>
/* Place your mongodb uri alongside your login token here */

spring.main.allow-bean-definition-overriding=true
/* Critical: disallowing Bean definition overriding would cause runtime error */

spring.jpa.hibernate.naming.physical-strategy=org.hibernate.boot.model.naming.PhysicalNamingStrategyStandardImpl
/* Not really necessary here */

spring.mail.properties.mail.smtp.connecttimeout=<Placeholder>
spring.mail.properties.mail.smtp.timeout=<Placeholder>
spring.mail.properties.mail.smtp.writetimeout=<Placeholder>
/* Timeout unit is "ms"(milliseconds) */

spring.mail.host=<Placeholder>
spring.mail.password=<Placeholder>
spring.mail.port=<Placeholder>
spring.mail.username=<Placeholder>
spring.mail.properties.mail.smtp.starttls.enable=false
spring.mail.properties.mail.smtp.auth=true
spring.mail.properties.mail.smtp.socketFactory.fallback=true
/* If you're going to use MailService to send email, configure all these parameters above */

check.mail.username=<Placeholder>
check.mail.password=<Placeholder>
/* If you're going to use the Mail library, configure them here, and make sure you're using Netease 163 mail */

# THYMELEAF (ThymeleafAutoConfiguration)
spring.thymeleaf.check-template-location=true
spring.thymeleaf.prefix=classpath:/templates/
spring.thymeleaf.suffix=.html
spring.thymeleaf.mode=HTML
spring.thymeleaf.encoding=UTF-8
spring.thymeleaf.servlet.content-type=text/html