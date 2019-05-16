package model;

import java.util.ArrayList;
import java.util.List;

public class Validate {

	public static int ValidateUser(String user, String password) {

		if (password.equals("java") && user.equals("system")) {
			return 1;
		}
		if (password.equals("passw0rd") && user.equals("admin")) {
			return 2;
		}
		return 0;

	}
}
