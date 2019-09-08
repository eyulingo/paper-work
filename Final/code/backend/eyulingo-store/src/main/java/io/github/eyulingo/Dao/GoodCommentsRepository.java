package io.github.eyulingo.Dao;


import io.github.eyulingo.Entity.GoodComments;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GoodCommentsRepository extends CrudRepository<GoodComments,Long> {
    List<GoodComments> findByGoodId(Long goodId);
}
