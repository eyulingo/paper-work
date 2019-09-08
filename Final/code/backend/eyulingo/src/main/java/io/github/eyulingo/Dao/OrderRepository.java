package io.github.eyulingo.Dao;

import io.github.eyulingo.Entity.Orders;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface OrderRepository extends CrudRepository<Orders,Long> {
    List<Orders> findByUserId(Long userId);
    List<Orders> findByStoreId(Long storeId);
    Orders findByOrderIdAndStoreId(Long orderId,Long storeId);
    Orders findByOrderId(Long orderId);
}
