package com.anthony.athlead.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.anthony.athlead.models.Meet;
import com.anthony.athlead.models.User;
import com.anthony.athlead.services.MeetService;
import com.anthony.athlead.services.UserService;

@Controller
public class AthleadController {
	@Autowired
	private MeetService meetService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/home")
	public String homePage() {
		return "home.jsp";
	}
	
	@GetMapping("/meets")
	public String meets(Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("logged_id");
		User thisLoggedUser = userService.findOne(userId);
		session.setAttribute("thisLoggedUser", thisLoggedUser);
		List<Meet> allMeets = meetService.allMeets();
		model.addAttribute("allMeets", allMeets);
		return "meets.jsp";
	}
	
	@GetMapping("/test")
	public String test() {
		return "testworld.jsp";
	}
	
	@GetMapping("/meet/{meetId}")
	public String singleMeet(@PathVariable("meetId")Long meetId, Model model, HttpSession session) {
		Meet myMeet = meetService.findMeet(meetId);
		model.addAttribute("myMeet", myMeet);
		return "singlemeet.jsp";
	}
	
	@GetMapping("/newmeet")
	public String renderNewMeet(Model model, HttpSession session) {
		Long logged_id = (Long) session.getAttribute("logged_id");
		if(logged_id == null) {
			return "redirect:/";
		}
		Meet newMeet = new Meet();
		model.addAttribute("newMeet", newMeet);
		return "newmeet.jsp";
	}
	
	@GetMapping("/rsvp/{meetId}")
	public String rsvp(@PathVariable("meetId") Long meetId,
						HttpSession session) {
		Meet thisMeet = meetService.findMeet(meetId);
		Long userId = (Long)session.getAttribute("logged_id");
		
		User thisUser = userService.findOne(userId);
		
		thisMeet.getAttendees().add(thisUser);
		meetService.update(thisMeet);
		return "redirect:/meets";
	}
	
	@GetMapping("/meet/edit/{meetId}")
	public String renderEdit(@PathVariable("meetId") Long meetId, Model model, HttpSession session) {
		Meet myMeet = meetService.findMeet(meetId);
		model.addAttribute("myMeet", myMeet);
		return "editpage.jsp";
	}
	
	@PostMapping("/meets")
	public String submitMeet(@Valid @ModelAttribute("newMeet") Meet meet,
							BindingResult result,
							RedirectAttributes flash) {
		if(result.hasErrors()) {
			return "newmeet.jsp";
		}
		else {
			meetService.createMeet(meet);
			flash.addAttribute("success", "Successfully made a meet!");
			return "redirect:/meets";
		}
	}
	
	@RequestMapping(value="/meet/{id}", method=RequestMethod.DELETE)
	public String delete(@PathVariable("id") Long id) {
		meetService.deleteMeet(id);
		return "redirect:/meets";
	}
	
	@RequestMapping(value="/meet/{meetId}", method = RequestMethod.PUT)
	public String update(@Valid @ModelAttribute("myMeet") Meet meet, BindingResult result) {
		if(result.hasErrors()) {
			return "editpage.jsp";
		}
		else {
			meetService.update(meet);
			return "redirect:/meets";
		}
	}

}
