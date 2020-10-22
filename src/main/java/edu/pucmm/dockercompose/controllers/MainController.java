package edu.pucmm.dockercompose.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import java.security.Principal;

@Controller
public class MainController {

    @GetMapping("/")
    public String getHome(Model model, Principal principal){
        model.addAttribute("user", principal);
        return "home";
    }
}
