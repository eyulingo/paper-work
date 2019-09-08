package io.github.eyulingo.Security

import io.github.eyulingo.Dao.AdminRepository
import org.springframework.security.core.userdetails.UsernameNotFoundException
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.security.core.userdetails.UserDetailsService
import org.springframework.stereotype.Service


class AdminService : UserDetailsService {

    @Autowired
    private val sysUserRepository: AdminRepository? = null


    override fun loadUserByUsername(adminname: String): UserDetails {

        return sysUserRepository!!.findByAdminName(adminname) ?: throw UsernameNotFoundException("AdminName not found")
    }


}
