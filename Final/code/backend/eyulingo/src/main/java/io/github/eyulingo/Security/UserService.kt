package io.github.eyulingo.Security

import io.github.eyulingo.Dao.UserRepository
import org.springframework.security.core.userdetails.UsernameNotFoundException
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.security.core.userdetails.UserDetailsService
import org.springframework.stereotype.Service


class UserService : UserDetailsService {

    @Autowired
    private val sysUserRepository: UserRepository? = null


    override fun loadUserByUsername(username: String): UserDetails {

        return sysUserRepository!!.findByUserName(username) ?: throw UsernameNotFoundException("Username not found")
    }


}
