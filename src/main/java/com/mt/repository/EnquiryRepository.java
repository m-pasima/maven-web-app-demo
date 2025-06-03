package com.mt.repository;

import com.mt.model.Enquiry;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class EnquiryRepository {
    private final JdbcTemplate jdbcTemplate;

    public EnquiryRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
        this.jdbcTemplate.execute("CREATE TABLE IF NOT EXISTS enquiries (" +
                "id SERIAL PRIMARY KEY," +
                "name VARCHAR(255)," +
                "email VARCHAR(255)," +
                "message TEXT)");
    }

    public void save(Enquiry enquiry) {
        jdbcTemplate.update(
                "INSERT INTO enquiries(name, email, message) VALUES(?,?,?)",
                enquiry.getName(), enquiry.getEmail(), enquiry.getMessage());
    }

    public List<Enquiry> findAll() {
        return jdbcTemplate.query("SELECT * FROM enquiries", new RowMapper<Enquiry>() {
            @Override
            public Enquiry mapRow(ResultSet rs, int rowNum) throws SQLException {
                Enquiry e = new Enquiry();
                e.setId(rs.getInt("id"));
                e.setName(rs.getString("name"));
                e.setEmail(rs.getString("email"));
                e.setMessage(rs.getString("message"));
                return e;
            }
        });
    }
}
