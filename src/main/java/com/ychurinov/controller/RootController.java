package com.ychurinov.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import sun.rmi.transport.proxy.HttpReceiveSocket;

import javax.servlet.http.HttpServletRequest;

@Controller
public class RootController {

    private static final Logger logger = LoggerFactory.getLogger(RootController.class);

    // Actually this project could be done with no java code at all
    // This simple work could be done in mvc-config.xml by defining
    // <mvc:view-controller path="/" view-name="/index"/>
    @RequestMapping(value = "/", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView showIndex() {
        return new ModelAndView("index");
    }
}
