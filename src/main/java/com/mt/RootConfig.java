package com.mt;

import com.mt.repository.EnquiryRepository;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class RootConfig {

    @Bean
    public EnquiryRepository enquiryRepository() {
        return new EnquiryRepository();
    }
}
