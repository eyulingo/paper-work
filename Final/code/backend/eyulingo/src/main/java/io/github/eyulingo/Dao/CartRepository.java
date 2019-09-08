package io.github.eyulingo.Dao;


import io.github.eyulingo.Entity.Carts;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartRepository extends CrudRepository<Carts,Long> {
    List<Carts> findByUserId(Long id);
    Carts findByUserIdAndGoodId(Long userId,Long goodId);
}
