package com.ychurinov.controller;

import com.ychurinov.service.EmailService;
import com.ychurinov.service.EmailServiceImpl;
import com.ychurinov.util.PropertiesUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@Controller
public class EmailController {

    @Autowired
    private EmailService emailServiceImpl;

    @RequestMapping(value = "/email", method = RequestMethod.GET)
    public void email(@RequestParam(value = "sendTo") String sendTo,
                      @RequestParam(value = "pdf", required = false) String pdf,
                      @RequestParam(value = "doc", required = false) String doc,
                      HttpServletResponse response) {
        Map<String, Object> model = new HashMap<>();
        model.put(EmailServiceImpl.FROM, PropertiesUtil.getProperty("java.mail.username"));
        model.put(EmailServiceImpl.TO, sendTo);
        model.put("pdf", pdf);
        model.put("doc", doc);

        if (emailServiceImpl.sendEmail("cv.vm", model)) {
            response.setStatus(HttpStatus.OK.value());
        } else {
            response.setStatus(HttpStatus.INTERNAL_SERVER_ERROR.value());
        }
    }
}
