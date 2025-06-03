package com.mt;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import com.mt.config.DatabaseConfig;

@Configuration
@ComponentScan({"com.mt.repository"})
@Import(DatabaseConfig.class)
public class RootConfig {
}
