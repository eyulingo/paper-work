package io.github.eyulingo.Dao;



import io.github.eyulingo.Entity.Tags;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TagsRepository extends CrudRepository<Tags,Long> {
    List<Tags> findByGoodId(Long goodId);
    Tags findByGoodIdAndAndTagName(Long goodId,String tagName);
}
