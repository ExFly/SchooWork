package org.exfly.models;

import org.exfly.models.auth.User;
public class TestUser {
	public static void main(String[] args) {
		new User().signUp("root", "toor");
		
		User tools = new User();
		User user = tools.getUserbyID(tools.login("root", "toor"));
		System.out.println(user.getUsername() + "," + user.getId());
		//root,bb5e7ceb-4ef3-44f5-94d2-9dd61516d957
		
		user = tools.getUserbyUsername("test");
		System.out.println(user.getUsername() + "," + user.getId());
		//test,32058959-6d95-4ccd-b066-4f0a389352ac
	
		user = tools.getUserbyUsername("root");
		System.out.println(user.isAdmin(user));
		System.out.println(user.isAdmin("bb5e7ceb-4ef3-44f5-94d2-9dd61516d957"));
		
		user = tools.getUserbyUsername("root");
		System.out.println(user.hasPermission(user));
		System.out.println(user.hasPermission("bb5e7ceb-4ef3-44f5-94d2-9dd61516d957"));
		
	}
}
