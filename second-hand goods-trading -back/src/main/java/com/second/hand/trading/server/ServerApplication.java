package com.second.hand.trading.server;

import com.second.hand.trading.server.utils.OrderTaskHandler;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication()
public class ServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(ServerApplication.class, args);
        OrderTaskHandler.run();
    }

}
