package io.github.eyulingo.Security

import io.github.eyulingo.Dao.StoreRepository
import io.github.eyulingo.Dao.UserRepository
import io.github.eyulingo.Entity.Stores
import org.springframework.security.core.userdetails.UsernameNotFoundException
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.security.core.userdetails.UserDetailsService
import org.springframework.stereotype.Service


class StoreService : UserDetailsService {

    @Autowired
    private val sysUserRepository: StoreRepository? = null


    override fun loadUserByUsername(distname: String): UserDetails {

        return sysUserRepository!!.findByDistName(distname) ?: throw UsernameNotFoundException("Username not found")
    }


}
