package org.r78.OAuth2demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

@RestController
public class TestController {

    @GetMapping("/api/hello")
    public String sayHello(Principal principal) {
        return "Hello " + principal.getName();
    }
}
