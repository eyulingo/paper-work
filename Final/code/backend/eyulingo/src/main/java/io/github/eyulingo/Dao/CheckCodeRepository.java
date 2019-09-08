package io.github.eyulingo.Dao;


import io.github.eyulingo.Entity.CheckCodes;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CheckCodeRepository extends JpaRepository<CheckCodes,String> {
    List<CheckCodes> findByUserEmail(String email);
    List<CheckCodes> findByUserEmailAndType(String email,Long type);
}
