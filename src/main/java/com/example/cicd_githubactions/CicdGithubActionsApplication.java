package com.example.cicd_githubactions;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class CicdGithubActionsApplication {

    public static void main(String[] args) {
        SpringApplication.run(CicdGithubActionsApplication.class, args);

        System.out.println("CICD 테스트 용입니다");
    }

}
