package com.example.simpledms.repository;

import com.example.simpledms.dto.FavoriteDto;
import com.example.simpledms.dto.response.UserRoleDto;
import com.example.simpledms.model.Favorite;
import com.example.simpledms.model.Free;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

/**
 * packageName : com.example.jpaexam.repository
 * fileName : DeptRepository
 * author : ds
 * date : 2022-10-20
 * description : JPA CRUD를 위한 인터페이스(==DAO)
 * ===========================================================
 * DATE            AUTHOR             NOTE
 * —————————————————————————————
 * 2022-10-20         ds          최초 생성
 */

public interface FavoriteRepository extends JpaRepository<Favorite, Integer> {
//    question 조회하는 like 검색 함수
//    1) 쿼리메소드 방식으로 함수 정의

//    프로필페이지에서 사용할 함수
    Page<Favorite> findAllByFidOrderByDno(Integer dno, Pageable pageable);

//    id랑 dno로 Fid찾는 함수
    Optional<Favorite> findByIdAndDno (Integer id, Integer dno);

    @Query(value = "select fa.*, di.dname, di.phone, di.loc, di.photo " +
                   "from tb_diner di, tb_favorite fa " +
                   "where di.dno = fa.dno " +
                   "and id = :id",
                    countQuery = "select fa.*, di.dname, di.phone, di.loc, di.photo  " +
                                 "from tb_diner di, tb_favorite fa " +
                                 "where di.dno = fa.dno " +
                                 "and id = :id"
            ,nativeQuery = true)
    Page<FavoriteDto> findAllById (Integer id, Pageable pageable);

}









