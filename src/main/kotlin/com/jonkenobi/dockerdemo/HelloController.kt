package com.jonkenobi.dockerdemo

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController


@RestController
class HelloController {
    @GetMapping("/hello")
    fun dockerDemo(): String {
        return "Hello Dockerized Spring Boot Application"
    }
}