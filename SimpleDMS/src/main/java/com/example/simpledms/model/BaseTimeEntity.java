package com.example.simpledms.model;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.EntityListeners;
import javax.persistence.MappedSuperclass;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * packageName : com.example.jpaexam.model
 * fileName : BaseTimeEntity
 * author : ds
 * date : 2022-10-20
 * description : JPA 에서 자동으로 생성일자/수정일자를 만들어주는 클래스
 *              포맷 : yyyy-MM-dd HH:mm:ss
 *           ✅ Entity == SQL Table
 * ===========================================================
 * DATE            AUTHOR             NOTE
 * —————————————————————————————
 * 2022-10-20         ds          최초 생성
 */
@Getter
@Setter
// 모델을 감시하다가 생성일자/수정일자를 자동으로 포함시키는 어노테이션
@MappedSuperclass
@EntityListeners(AuditingEntityListener.class)
public abstract class BaseTimeEntity {

//    생성일자 속성
    private String insertTime;
//    수정일자 속성
    private String updateTime;

//    soft delete를 위한 속성 2개
    private String deleteYn;
    private String deleteTime;

//    감시 함수
//    대상 모델(엔티티) 를 저장하기전(insert) 실행되는 함수
    @PrePersist
    void onPrePersist() {
        this.insertTime = LocalDateTime.now()
                .format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        this.deleteYn = "N"; // null 값이 들어가는 것을 방지하기 위한 초기화
    }

//    대상 모델(엔티티) 를 수정하기전(update) 실행되는 함수
    @PreUpdate
    void onPreUpdate() {
        this.updateTime = LocalDateTime.now()
                .format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
//        this.insertTime = this.updateTime; // FIXME: 원래는 주석처리 안되있는 코드인데 주석풀면 조회수 증가시킬때 게시판 생성시간으로 수정되는 문제가 있음
        this.deleteYn = "N"; // null 값이 들어가는 것을 방지하기 위한 초기화
    }
}









