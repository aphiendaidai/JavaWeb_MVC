package com.thick.contro;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thick.Service.UserService;
import com.thick.model.User;

@Controller
public class AuthController {

    @Autowired
    private UserService userService;
    
    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    @GetMapping("/register")
    public String registerPage() {
        return "register";
    }
    
    @PostMapping("/login")
    public String login(@RequestParam("username") String username,
                         @RequestParam("password")  String password,
                       RedirectAttributes redirectAttributes) {
        try {
            userService.login(username, password);
            return "redirect:/home";
            
        } catch (RuntimeException e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
            return "redirect:/login";
        }
    }
    
    
    @PostMapping("/register")
    public String register(User user, RedirectAttributes redirectAttributes) {
        try {
            userService.registerNewUser(user);
            return "redirect:/home";
        } catch (RuntimeException e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
            return "redirect:/register";
        }
    }
}


//    @PostMapping("/register")
//    public String registerUser(@RequestParam("username") String username,
//                             @RequestParam("password")  String password,
//                             @RequestParam("email") String email,
//                             @RequestParam("fullName") String fullName,
//                             Model model) {
//        try {
//            User user = new User(username, password, email, fullName);
//            userService.registerNewUser(user);
//            return "redirect:/login?registered";
//        } catch (RuntimeException e) {
//            model.addAttribute("error", e.getMessage());
//            return "register";
//        }
//    }

    
    
