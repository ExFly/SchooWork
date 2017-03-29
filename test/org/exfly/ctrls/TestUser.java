package org.exfly.ctrls;

import org.exfly.ctrls.auth.*;
public class TestUser {
	public static void main(String[] args) {
		new User().signUp("root", "toor");
		new User().login("root", "toor");
	}
}
