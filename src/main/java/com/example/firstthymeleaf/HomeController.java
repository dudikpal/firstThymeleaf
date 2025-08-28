package com.example.firstthymeleaf;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

		@GetMapping("/")
		public String home(@RequestParam(name = "name", required = false, defaultValue = "Guest") String name, Model model) {
			model.addAttribute("message", "Hello " + name + "!");
			return "home"; // refers to home.html in templates
		}

}
