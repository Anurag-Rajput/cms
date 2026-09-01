package com.cvc.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.cvc.dto.UserLoginAuthenticationDto;
import com.cvc.user.service.impl.UserServiceImpl;

@Service
public class CustomUserDetailsService implements UserDetailsService {


@Autowired
UserServiceImpl userServiceImpl;
	/**
	 * Returns a populated {@link UserDetails} object. The username is first
	 * retrieved from the database and then mapped to a {@link UserDetails}
	 * object.
	 */


	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		try {
			UserLoginAuthenticationDto userLoginAuthenticationDto = null;
			if(userServiceImpl.getUserAuthentication(username)!=null){
			userLoginAuthenticationDto=userServiceImpl.getUserAuthentication(username);
			}else{
			 userLoginAuthenticationDto=userServiceImpl.getCitizenAuthentication(username);
			}
			if(userLoginAuthenticationDto!=null){
			if(!userLoginAuthenticationDto.isAccountLocked()){
				throw new Exception("User Is Locked");
			}
			Collection<String> roles = userLoginAuthenticationDto.getListRole();	
			Collection<SimpleGrantedAuthority> authorities = new ArrayList<SimpleGrantedAuthority>();
			Iterator<String> iterator = roles.iterator();
			while (iterator.hasNext()) {
				authorities.add(new SimpleGrantedAuthority(iterator.next()));
			}
			return new org.springframework.security.core.userdetails.User(username,userLoginAuthenticationDto.getPassword(),authorities);
			}else{
				userServiceImpl.getUserAuthentication(username);
				throw new Exception("User Not Found"); 
			}
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	
	}

	/**
	 * Retrieves a collection of {@link GrantedAuthority} based on a numerical
	 * role
	 * 
	 * @param role
	 *            the numerical role
	 * @return a collection of {@link GrantedAuthority
	 * 
	 */
	public Collection<? extends GrantedAuthority> getAuthorities(Integer role) {
		List<GrantedAuthority> authList = getGrantedAuthorities(getRoles(role));
		return authList;
	}

	/**
	 * Converts a numerical role to an equivalent list of roles
	 * 
	 * @param role
	 *            the numerical role
	 * @return list of roles as as a list of {@link String}
	 */
	public List<String> getRoles(Integer role) {
		List<String> roles = new ArrayList<String>();
		if (role.intValue() == 1) {
			roles.add("ROLE_Diary");
			roles.add("ROLE_DH");
			roles.add("ROLE_SO");
			roles.add("ROLE_CVO");
			roles.add("ROLE_HELP");
			roles.add("ROLE_BO");
			roles.add("ROLE_CITIZEN");
			roles.add("ROLE_CLR");
			roles.add("ROLE_COORD");
			

		} else if (role.intValue() == 2) {
			roles.add("ROLE_USER");
		}

		return roles;
	}

	/**
	 * Wraps {@link String} roles to {@link SimpleGrantedAuthority} objects
	 * 
	 * @param roles
	 *            {@link String} of roles
	 * @return list of granted authorities
	 */
	public static List<GrantedAuthority> getGrantedAuthorities(List<String> roles) {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		for (String role : roles) {
			authorities.add(new SimpleGrantedAuthority(role));
		}
		return authorities;
	}

	public UserLoginAuthenticationDto getCurrentUser() {
		return userServiceImpl.getUserAuthentication(((org.springframework.security.core.userdetails.User) SecurityContextHolder
				.getContext().getAuthentication().getPrincipal()).getUsername());
	}
	
	
	
}
