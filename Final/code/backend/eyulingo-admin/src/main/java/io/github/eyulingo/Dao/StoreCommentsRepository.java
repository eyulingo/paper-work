package io.github.eyulingo.Dao;


import io.github.eyulingo.Entity.StoreComments;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface StoreCommentsRepository extends JpaRepository<StoreComments,Long> {
    List<StoreComments> findAll();
    List<StoreComments>  findByStoreId(Long storeId);
}
