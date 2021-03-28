package bookstore;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import bookstore.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    
    @Autowired
    UserService userService;
    
       @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
		 auth.authenticationProvider(authenticationProvider());
	}
    
     @Override
	public void configure(HttpSecurity http) throws Exception {
		  http
                .authorizeRequests()  //Restrict access based on HttpServletRequest
                .antMatchers("/","/home").permitAll() //Everybody (Visitors) have access to /bookstore and bookstore/home
                .antMatchers("/admin/**").hasRole("ADMIN")//Only Admin has access to /admin
                .antMatchers("/customer/**").hasAnyRole("CUSTOMER", "ADMIN", "SERVICEAGENT")
                .antMatchers("/service/**").hasAnyRole("SERVICEAGENT", "ADMIN")
                .antMatchers("/stock/**").hasAnyRole("STOCKMANAGER", "ADMIN")
                          
                .and()
                .formLogin()//We are changing the default Spring security process of login
                .loginPage("/login")//Show my form at this URL
                .loginProcessingUrl("/authenticate")//When submit button is pressed the request will be sent to this URL
                .permitAll()//Allow everyone to see login page. Don't have to be logged in.
                
                .and().logout().permitAll()
                
                .and().exceptionHandling().accessDeniedPage("/access-denied")
                ;
	}
    
    
    @Bean
    public DaoAuthenticationProvider authenticationProvider(){
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
        provider.setUserDetailsService(userService);
        provider.setPasswordEncoder(passwordEncoder());
        return provider;
    }
    
    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }



}
