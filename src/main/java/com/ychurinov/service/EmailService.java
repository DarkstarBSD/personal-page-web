package com.ychurinov.service;

import java.util.Map;

public interface EmailService {
    public boolean sendCvOnEmail(final String templateName, final Map<String, Object> model);

    boolean sendMessageOnEmail(String templateName, Map<String, Object> model);
}
