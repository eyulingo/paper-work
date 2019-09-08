package io.github.eyulingo.Dao;


import io.github.eyulingo.Entity.Goods;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GoodsRepository extends CrudRepository<Goods,Long> {
    List<Goods> findByStoreId(Long storeId);
    Goods findByGoodId(Long goodId);
    List<Goods> findAll();
}
