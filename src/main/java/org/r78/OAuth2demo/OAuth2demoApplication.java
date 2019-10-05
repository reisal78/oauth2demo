package org.r78.OAuth2demo;

import org.r78.OAuth2demo.domain.IUserRepository;
import org.r78.OAuth2demo.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.Optional;

@SpringBootApplication
public class OAuth2demoApplication {

	public static void main(String[] args) {
		SpringApplication.run(OAuth2demoApplication.class, args);
	}



	@Bean
	public CommandLineRunner init(IUserRepository userRepository, PasswordEncoder passwordEncoder) {
		return args -> {
			Optional<User> admin = userRepository.findByUsername("admin");
			if (!admin.isPresent()) {
				userRepository.save(new User("admin", passwordEncoder.encode("admin")));
			}
		};
	}

}
