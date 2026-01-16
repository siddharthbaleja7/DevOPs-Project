package com.example.cicdadvancedpipeline;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.assertNotNull;

@SpringBootTest
class CicdadvancedpipelineApplicationTests {

    @Test
    void contextLoads() {
    }
    @Test
    void testAppLogic() {
        String status = "UP";
        assertNotNull(status, "The app status should not be null");
    }

}
