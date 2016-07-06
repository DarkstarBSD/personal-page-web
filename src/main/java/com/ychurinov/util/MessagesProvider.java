package com.ychurinov.util;

import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;

/**
 * Simple MessageSource wrapper that provides simpler way of getting localized messages in java code
 */
public class MessagesProvider {
    private MessageSource messageSource;

    public String getMessage(String code) {
        return messageSource.getMessage(code, new Object[0], LocaleContextHolder.getLocale());
    }

    public void setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }
}
