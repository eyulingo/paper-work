package io.github.eyulingo.Dao;

import org.springframework.data.repository.CrudRepository;
import io.github.eyulingo.Entity.Stores;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface StoreRepository extends CrudRepository<Stores,Long>
{
        Stores  findByStoreId(Long storeId);

        Stores  findByStoreName(String storeName);

        Stores  findByDistName(String distName);

        List<Stores>  findAll();
}
