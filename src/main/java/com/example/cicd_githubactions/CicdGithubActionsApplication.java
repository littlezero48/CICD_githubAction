package com.example.cicd_githubactions;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import static java.lang.Thread.sleep;

@SpringBootApplication
public class CicdGithubActionsApplication {

    public static void main(String[] args) throws InterruptedException {
        SpringApplication.run(CicdGithubActionsApplication.class, args);

        System.out.println("CICD 테스트 용입니다");

        sleep(100000);
    }

}
