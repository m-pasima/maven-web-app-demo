package com.mt.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import javax.sql.DataSource;

@Configuration
public class DatabaseConfig {

    @Bean
    public DataSource dataSource() {
        DriverManagerDataSource ds = new DriverManagerDataSource();
        ds.setDriverClassName("org.postgresql.Driver");
        ds.setUrl(System.getenv().getOrDefault("DB_URL", "jdbc:postgresql://localhost:5432/postgres"));
        ds.setUsername(System.getenv().getOrDefault("DB_USERNAME", "postgres"));
        ds.setPassword(System.getenv().getOrDefault("DB_PASSWORD", "postgres"));
        return ds;
    }

    @Bean
    public JdbcTemplate jdbcTemplate(DataSource dataSource) {
        return new JdbcTemplate(dataSource);
    }
}
