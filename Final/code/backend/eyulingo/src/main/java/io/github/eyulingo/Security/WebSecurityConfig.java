package io.github.eyulingo.Security;

import io.github.eyulingo.Security.UserService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * Security 主配置文件
 * @author Veiking
 */
@Configuration
@EnableWebSecurity //开启Spring Security的功能
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Bean
    UserDetailsService customUserService(){
        return new UserService();
    }

    /**
     * 定义不需要过滤的静态资源（等价于HttpSecurity的permitAll）
     */
    @Override
    public void configure(WebSecurity webSecurity) throws Exception {

        webSecurity.ignoring().antMatchers("/store/**", "/admin/**", "/js/**", "/css/**");

    }

    /**
     * 安全策略配置
     */
    @Override
    protected void configure(HttpSecurity httpSecurity) throws Exception {
        httpSecurity
                .authorizeRequests().antMatchers("/store/**", "/admin/**","/img/download", "/img/upload", "/login", "/failure", "/ok","/register","/getcode","/findpassword","/findcheckcode", "/index.html", "/index").permitAll()
                // 对于网站部分资源需要指定鉴权
//             .antMatchers("/admin/**").hasRole("R_ADMIN")
                // 除上面外的所有请求全部需要鉴权认证
                .anyRequest().authenticated().and()
                // 定义当需要用户登录时候，转到的登录页面
                .formLogin().loginPage("/login")
                .defaultSuccessUrl("/ok")
                .permitAll()
                .failureUrl("/failure").and()
                // 定义登出操作
                .logout().logoutSuccessUrl("/kickout").permitAll().and()
                .csrf().disable()
        ;
        // 禁用缓存
        httpSecurity.headers().cacheControl();
        httpSecurity.sessionManagement().maximumSessions(1).expiredUrl("/failure");
    }

    @Bean
    public static PasswordEncoder passwordEncoder(){
        return NoOpPasswordEncoder.getInstance();
    }

}
