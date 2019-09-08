package io.github.eyulingo.Dao;


import io.github.eyulingo.Entity.Delivers;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DeliversRepository extends CrudRepository<Delivers,String> {
    List<Delivers> findAll();
}
