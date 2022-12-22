package com.example.simpledms.service;

import com.example.simpledms.model.Announce;
import com.example.simpledms.model.Free;
import com.example.simpledms.repository.AnnounceRepository;
import com.example.simpledms.repository.FreeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Optional;

/**
 * packageName : com.example.jpaexam.service.exam01
 * fileName : QnaService
 * author : ds
 * date : 2022-10-20
 * description : 부서 업무 서비스 클래스
 * ===========================================================
 * DATE            AUTHOR             NOTE
 * —————————————————————————————
 * 2022-10-20         ds          최초 생성
 */
@Service
public class FreeService {

    @Autowired
    FreeRepository freeRepository; // JPA CRUD 함수가 있는 인터페이스

    //    전체 조회 함수( 페이징 처리 )
    public Page<Free> findAll(Pageable pageable) {
        Page<Free> page = freeRepository.findAll(pageable);

        return page;
    }

    //    전체 삭제 함수
    public void removeAll() {
        freeRepository.deleteAll(); // 전체 삭제
    }

    //   부서 정보 저장/수정 함수
    public Free save(Free free) {

        Free free2 = freeRepository.save(free);

        return free2;
    }

    //    부서번호로 조회하는 함수
    public Optional<Free> findById(int fno) {
//        findById(기본키속성)
        Optional<Free> optionalFree = freeRepository.findById(fno);

        return optionalFree;
    }

    // 부서번호(no)로 삭제하는 함수
    public boolean removeById(int fno) {
//        existsById(기본키) 있으면 삭제 실행 + true 리턴
        if(freeRepository.existsById(fno) == true) {


            freeRepository.deleteById(fno);
            return true;
        }

//        없으면 그냥 false 리턴
        return false;
    }

    //    question(질문) like 검색 함수 ( 페이징 처리 )
    public Page<Free> findAllByWriterContainingOrderByInsertTimeDescFnoDesc(String writer, Pageable pageable) {
        Page<Free> page = freeRepository.findAllByWriterContainingOrderByInsertTimeDescFnoDesc(writer, pageable);

        return page;
    }

    //    questioner(질문자) like 검색 함수 ( 페이징 처리 )
    public Page<Free> findAllByTitleContainingOrderByInsertTimeDescFnoDesc(String title, Pageable pageable) {
        Page<Free> page = freeRepository.findAllByTitleContainingOrderByInsertTimeDescFnoDesc(title, pageable);

        return page;
    }
}









