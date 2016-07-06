package com.ychurinov.controller;

import com.ychurinov.service.EmailService;
import com.ychurinov.service.EmailServiceImpl;
import com.ychurinov.util.MessagesProvider;
import com.ychurinov.util.PropertiesUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@RestController
public class EmailController {
    private static final Logger logger = LoggerFactory.getLogger(EmailController.class);

    @Resource(name = "messagesProvider")
    private MessagesProvider messagesProvider;

    @Autowired
    private EmailService emailServiceImpl;

    @RequestMapping(value = "/email", method = RequestMethod.POST)
    public String sendCvOnEmail(@RequestParam(value = "sendTo") String sendTo,
                                @RequestParam(value = "pdf", required = false) String pdf,
                                @RequestParam(value = "doc", required = false) String doc,
                                HttpServletResponse response,
                                HttpServletRequest request) {
        logger.debug("Processing request: "
                + request.getRequestURL()
                + (request.getQueryString() != null ? ('?' + request.getQueryString()) : ""));
        Map<String, Object> model = new HashMap<>();
        model.put(EmailServiceImpl.FROM, PropertiesUtil.getProperty("java.mail.username"));
        model.put(EmailServiceImpl.TO, sendTo);
        model.put(EmailServiceImpl.PDF_REQUIRED, pdf);
        model.put(EmailServiceImpl.DOC_REQUIRED, doc);

        if (emailServiceImpl.sendEmail("cv.vm", model)) {
            response.setStatus(HttpStatus.OK.value());
            return messagesProvider.getMessage("main.layout.sticker.success.mail.CV.message.start")
                    + ' '
                    + sendTo.replaceAll("-","&#8209") //dashes need to be replaced because browser can brake line when meets it
                    + ' '
                    + messagesProvider.getMessage("main.layout.sticker.success.mail.CV.message.end");
        } else {
            response.setStatus(HttpStatus.INTERNAL_SERVER_ERROR.value());
            return messagesProvider.getMessage("main.layout.sticker.fail.mail.CV.message.start")
                    + ' '
                    + sendTo.replaceAll("-","&#8209")
                    + ' '
                    + messagesProvider.getMessage("main.layout.sticker.fail.mail.CV.message.end");
        }
    }

    @RequestMapping(value = "/messageMe", method = RequestMethod.POST)
    public void sendMeEmail(@RequestParam(value = "subject") String sendTo,
                            @RequestParam(value = "name") String name,
                            @RequestParam(value = "message") String message,
                            HttpServletResponse response,
                            HttpServletRequest request) {
        logger.debug("Processing request: "
                + request.getRequestURL()
                + (request.getQueryString() != null ? ('?' + request.getQueryString()) : ""));

    }
}
