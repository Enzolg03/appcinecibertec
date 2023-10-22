package cibertec.edu.pe.appcinecibertec.Controller;

import org.springframework.web.bind.annotation.GetMapping;

public class HomeController {
    @GetMapping("/home")
    public String home(){ return "home";}
}
