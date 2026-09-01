package com.cvc.security;

import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.cvc.util.MyUtill;

public class PasswordCheck implements PasswordEncoder {

	
	public String encode(CharSequence rawPassword) {
		// TODO Auto-generated method stub
		return (String) rawPassword;
	}

	
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		
		String decrypt = ((String) rawPassword).substring(32);
		if((MyUtill.getMd5(encodedPassword+MyUtill.getMd5(decrypt))+decrypt).equals(rawPassword)){
			return true;
		}
		
		return false;
	}

	public static boolean checkpw(String plaintext, String hashed) {
		return equalsNoEarlyReturn(hashed, BCrypt.hashpw(plaintext, hashed));
	}

	
	
	static boolean equalsNoEarlyReturn(String a, String b) {
		char[] caa = a.toCharArray();
		char[] cab = b.toCharArray();

		if (caa.length != cab.length) {
			return false;
		}

		byte ret = 0;
		for (int i = 0; i < caa.length; i++) {
			ret |= caa[i] ^ cab[i];
		}
		return ret == 0;
	}
	
}
