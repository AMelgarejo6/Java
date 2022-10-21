package com.anthony.athlead.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.anthony.athlead.models.LoginUser;
import com.anthony.athlead.models.User;
import com.anthony.athlead.repos.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;

	public User register(User newUser, BindingResult result) {
		Optional<User> potentialUser = userRepository.findByEmail(newUser.getEmail());
		if (potentialUser.isPresent()) {
			result.rejectValue("email", "registerError", "this email is taken");
		}
		if (!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("confirm", "registerError", "passwords must match");
		}

		if (result.hasErrors()) {
			return null;
		} else {
			String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
			newUser.setPassword(hashed);
			return userRepository.save(newUser);
		}
	}

	public User login(LoginUser newLoginObject, BindingResult result) {
		Optional<User> potentialUser = userRepository.findByEmail(newLoginObject.getEmail());
		if (!potentialUser.isPresent()) {
			result.rejectValue("email", "loginError", "email not in database");
		} else {
			User user = potentialUser.get();
			// Bcrypt check password
			System.out.println(user.getPassword());
			System.out.println(newLoginObject.getPassword());
			if (!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {

				result.rejectValue("password", "loginError", "wrong password");
			}

			if (result.hasErrors()) {
				System.out.println(result);
				return null;
			} else {
				return user;
			}
		}
		return null;
	}

	public List<User> allUsers() {
		return userRepository.findAll();
	}

	public User findOne(Long id) {
		Optional<User> optionalUser = userRepository.findById(id);
		if (optionalUser.isPresent()) {
			return optionalUser.get();
		} else {
			return null;
		}
	}
}
