package io.github.eyulingo.Dao;

import io.github.eyulingo.Entity.OrderItems;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderitemsRepository extends CrudRepository<OrderItems,Long> {
    List<OrderItems> findByOrderId(Long orderId);
    OrderItems findByOrderIdAndGoodId(Long orderId,Long good_id);
}
