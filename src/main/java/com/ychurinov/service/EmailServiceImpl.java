package com.ychurinov.service;

import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
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

    /*Email To*/
    public static final String TO = "to";
    public static final String FROM = "from";
    public static final String SUBJECT = "Yaroslav Churinov Java Developer CV";

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private VelocityEngine velocityEngine;

    public boolean sendEmail(final String templateName, final Map<String, Object> model) {
        try {
            MimeMessagePreparator preparator = mimeMessage -> {
                MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage);
                messageHelper.setFrom((String) model.get(FROM));
                messageHelper.setTo((String) model.get(TO));
                messageHelper.setSubject(SUBJECT);
                messageHelper.setSentDate(new Date());
                model.put("noArgs", new Object[]{});
                String text = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine,
                        templateName, "UTF-8", model);
                messageHelper.setText(text, true);
            };
            mailSender.send(preparator);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
