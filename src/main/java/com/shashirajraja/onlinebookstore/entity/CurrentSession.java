package com.shashirajraja.onlinebookstore.entity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.SessionScope;

import com.shashirajraja.onlinebookstore.service.UserService;

@Component("currentSession")
@SessionScope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class CurrentSession {

	@Autowired
	UserService userService;
	
	private User user;
	
	
	public User getUser() {
		if (user == null) {
			try {
				String username = SecurityContextHolder.getContext().getAuthentication().getName();
				if (username != null && !username.equals("anonymousUser")) {
					user = userService.getUserByUsername(username);
				}
			} catch (Exception e) {
				// Handle authentication errors gracefully
				user = null;
			}
        }
        return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}
	
	
}
