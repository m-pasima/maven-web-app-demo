package com.mt.controller;

import com.mt.model.Enquiry;
import com.mt.repository.EnquiryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class EnquiryController {
    private final EnquiryRepository repository;

    @Autowired
    public EnquiryController(EnquiryRepository repository) {
        this.repository = repository;
    }

    @GetMapping("/enquiry")
    public String showForm(Model model) {
        model.addAttribute("enquiry", new Enquiry());
        model.addAttribute("enquiries", repository.findAll());
        return "enquiry";
    }

    @PostMapping("/enquiry")
    public String handleSubmit(@ModelAttribute Enquiry enquiry) {
        repository.save(enquiry);
        return "redirect:/enquiry";
    }
}
