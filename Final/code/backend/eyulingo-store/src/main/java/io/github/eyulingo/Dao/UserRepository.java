package io.github.eyulingo.Dao;


import io.github.eyulingo.Entity.Users;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface UserRepository extends CrudRepository<Users, Long> {
    List<Users> findAll();
    Users findByUserId(Long userid);

    Users findByUserName(String username);
    Users findByUserEmail(String email);

}
