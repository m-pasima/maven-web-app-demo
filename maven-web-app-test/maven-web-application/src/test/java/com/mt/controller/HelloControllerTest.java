package com.mt.controller;

import static org.junit.Assert.*;
import org.junit.Test;
import org.springframework.ui.ModelMap;

public class HelloControllerTest {

    @Test
    public void testHome() {
        HelloController ctrl = new HelloController();
        ModelMap model = new ModelMap();
        String view = ctrl.home(model);
        assertEquals("home", view);
        assertTrue(model.containsKey("message"));
        assertEquals("Hello, DevOps Academy!", model.get("message"));
    }
}
