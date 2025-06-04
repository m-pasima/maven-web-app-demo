package com.mt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HelloController {

    @GetMapping({"/", "/hello"})
    public String home(Model model) {
        model.addAttribute("message", "Hello, DevOps Academy!");
        return "home";
    }
}
