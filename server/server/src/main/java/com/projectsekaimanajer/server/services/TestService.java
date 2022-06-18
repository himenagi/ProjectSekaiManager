package com.projectsekaimanajer.server.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.projectsekaimanajer.server.tables.Unit;

@Service
public class TestService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Bean
    public List<Unit> SelectAllUnits() {
        var query = "SELECT * FROM m_unit";
        var units = jdbcTemplate.query(query, new BeanPropertyRowMapper<>(Unit.class));
        return units;
    }
}
