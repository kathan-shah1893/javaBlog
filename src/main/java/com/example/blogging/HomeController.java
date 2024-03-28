package com.example.blogging;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpSession;
	
	import org.springframework.stereotype.Controller;
	import org.springframework.ui.Model;
	import org.springframework.web.bind.annotation.RequestMapping;
	import org.springframework.web.bind.annotation.RequestParam;
	@Controller
	public class HomeController {
		@RequestMapping("/")
		public String def()
		{
			System.out.println("This is default");
			return "Login";
		}
		@RequestMapping("/home")
		public String homepage(HttpSession session,Model model)
		{
			int uid = (int) session.getAttribute("userid");
			String username = (String) session.getAttribute("username");
			
			model.addAttribute(uid);
			model.addAttribute(username);
			return "Welcome";
		}
		@RequestMapping("/Add")
		public String AddingPost(HttpSession session,Model model)
		{
			int uid = (int) session.getAttribute("userid");
			model.addAttribute(uid);
			return "AddPost";
		}
	
	}
