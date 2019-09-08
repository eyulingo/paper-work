package io.github.eyulingo.Dao;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import io.github.eyulingo.Entity.Admins;

import java.util.List;

@Repository
public interface AdminRepository extends CrudRepository<Admins,String> {
    Admins findByAdminName(String adminName);
    List<Admins>  findAll();
}
