package io.github.eyulingo.Dao;


import io.github.eyulingo.Entity.UserAddress;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


import java.util.List;

@Repository
public interface UserAddressRepository extends CrudRepository<UserAddress,Long> {
    List<UserAddress>  findByUserId(Long userId);
}
