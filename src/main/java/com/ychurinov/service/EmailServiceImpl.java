package com.ychurinov.service;

import org.apache.velocity.app.VelocityEngine;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import org.springframework.ui.velocity.VelocityEngineUtils;

import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Map;

@Service
public class EmailServiceImpl implements EmailService {
    private static final Logger logger = LoggerFactory.getLogger(EmailServiceImpl.class);

    public static final String TO = "to";
    public static final String FROM = "from";
    public static final String SUBJECT = "Yaroslav Churinov Java Developer CV";

    public static final String PDF_REQUIRED = "pdf";
    public static final String DOC_REQUIRED = "doc";
    public static final String REQUIRED = "on";

    @Autowired
    private ApplicationContext appContext;

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private VelocityEngine velocityEngine;

    public boolean sendEmail(final String templateName, final Map<String, Object> model) {
        String sendTo = (String) model.get(TO);
        try {
            MimeMessagePreparator preparator = mimeMessage -> {
                MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true);
                messageHelper.setFrom((String) model.get(FROM));
                messageHelper.setTo(sendTo);
                messageHelper.setSubject(SUBJECT);
                messageHelper.setSentDate(new Date());
                if (REQUIRED.equals(model.get(PDF_REQUIRED))) {
                    messageHelper.addAttachment(appContext.getResource("/resources/pdf/1.pdf").getFilename(),
                            appContext.getResource("/resources/pdf/1.pdf"));
                }
//                if (REQUIRED.equals(model.get(DOC_REQUIRED))) {
//                    messageHelper.addAttachment();
//                }
                String text = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, templateName, "UTF-8", model);
                messageHelper.setText(text, true);
            };
            mailSender.send(preparator);
            logger.info("Mail successfully sent to " + sendTo);
            return true;
        } catch (MailException e) {
            logger.warn("Filed sending mail to " + sendTo);
            e.printStackTrace();
        }
        return false;
    }
}
