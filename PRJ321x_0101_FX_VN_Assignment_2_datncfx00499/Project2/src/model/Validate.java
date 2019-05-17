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

	public static List<String> ValidateRegister(String name, int age, String[] languages) {

		List<String> errors = new ArrayList<>();
		int checkLanguages = 0;

		// Validate name
		if (name.trim().equals("") || name == null) {
			errors.add("Username is required!");
		}

		// Validate age
		if (age < 18 || age > 40) {
			errors.add("Age must be between 18 and 40!");
		}

		// Validate languages
		for (int i = 0; i < languages.length; i++) {
			if (languages[i] == null) {
				checkLanguages++;
			}
		}
		if (checkLanguages == 3) {
			errors.add("Languages must be choosen!");
		}

		return errors;

	}
}
