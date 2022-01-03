package kwonminyoung.ums.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kwonminyoung.ums.user.domain.User;
import kwonminyoung.ums.user.service.UserService;

@Controller
@RequestMapping
public class UserController {
	@Autowired private UserService userService;
	
	@RequestMapping
	public String main(Model model) {
		List<User> users = userService.listUsers();
		model.addAttribute("users", users);
		return "main";
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public boolean join(String userName) {
		return userService.join(userName);
	}
	
	@RequestMapping("/edit")
	@ResponseBody
	public boolean correctUser(User user){
		return userService.correctUser(user);
	}
	
	@RequestMapping("/remove")
	@ResponseBody
	public boolean secede(int userNo){
		return userService.secede(userNo);
	}
}