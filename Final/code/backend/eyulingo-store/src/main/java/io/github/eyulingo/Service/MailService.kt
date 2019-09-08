package io.github.eyulingo.Service

interface MailService {
    fun sendHtmlMail(to: String, subject: String, content: String)
}