package com.anthony.athlead.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.anthony.athlead.models.LoginUser;
import com.anthony.athlead.models.User;
import com.anthony.athlead.services.UserService;

@Controller
public class LoginController {
	@Autowired
	private UserService userService;

	@GetMapping("/")
	public String login(Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "login.jsp";
	}
	
	
	@GetMapping("/success")
	public String success(HttpSession s, Model model) {
		Long logged_id = (Long) s.getAttribute("logged_id");
		if (logged_id == null) {
			return "redirect:/";
		}
		
		return "redirect:/home";
	}

	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model,
			HttpSession session) {

		userService.register(newUser, result);

		if (result.hasErrors()) {

			model.addAttribute("newLogin", new LoginUser());
			return "login.jsp";
		} else {
			session.setAttribute("logged_id", newUser.getId());
			session.setAttribute("logged_name", newUser.getUserName());
			return "redirect:/success";
		}

	}

	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model,
			HttpSession session) {

		// Add once service is implemented:
		User user = userService.login(newLogin, result);
//		System.out.println(user);
		if (result.hasErrors()) {
			model.addAttribute("newUser", new User());
			System.out.println("do i has errros?" + result);
			return "login.jsp";
		}
		System.out.println(user.getId());
		session.setAttribute("logged_id", user.getId());
		session.setAttribute("logged_name", user.getUserName());
		return "redirect:/success"; //if this doesnt work then try to route to the "/" route
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session, Model model) {
		model.addAttribute("newLogin", new LoginUser());
		session.invalidate();
		return "redirect:/";
	}
}
