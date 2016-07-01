package com.ychurinov.service;

import java.util.Map;

public interface EmailService {
    public boolean sendEmail(final String templateName, final Map<String, Object> model);
}
