// filepath: /C:/Users/ravin/OneDrive/SourceCodes/Java-Projects/studydesign/src/test/java/com/dhilloncorp/studydesign/DatabaseConnectionTest.java
package com.dhilloncorp.studydesign;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.JdbcTemplate;
import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
public class DatabaseConnectionTest {

    private static final Logger logger = LoggerFactory.getLogger(DatabaseConnectionTest.class);

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Test
    public void testDatabaseConnection() {
        logger.info("Starting testDatabaseConnection");

        // Execute a simple query to check the connection
        Integer result = jdbcTemplate.queryForObject("SELECT 1", Integer.class);
        assertThat(result).isEqualTo(1);

        logger.info("Database connection test passed");
    }
}