package com.example.simpledms.model;

import lombok.*;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;

import javax.persistence.*;


/**
 * packageName : com.example.jpaexam.model
 * fileName : Dept
 * author : ds
 * date : 2022-10-19
 * description : 부서 모델(== JPA : 엔티티(Entity)) 클래스
 * ===========================================================
 * DATE            AUTHOR             NOTE
 * —————————————————————————————
 * 2022-10-19         ds          최초 생성
 */
@Entity
@Table(name = "TB_FREE")
@SequenceGenerator(
        name= "SQ_FREE_GENERATOR"
        , sequenceName = "SQ_FREE"
        , initialValue = 1
        , allocationSize = 1
)
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@DynamicInsert
@DynamicUpdate
@ToString
@Where(clause = "DELETE_YN = 'N'")
@SQLDelete(sql="UPDATE TB_FREE SET DELETE_YN = 'Y', DELETE_TIME = TO_CHAR(SYSDATE, 'YYYY-MM-DD') WHERE FNO = ?")
public class Free extends BaseTimeEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE
            , generator = "SQ_FREE_GENERATOR"
    )
    @javax.persistence.Column
    private Integer fno;

    @javax.persistence.Column
    private String title;

    @javax.persistence.Column
    private String content;

    @javax.persistence.Column
    private String writer;

//    글쓴사람 id값
    @javax.persistence.Column
    private Integer id;

    @javax.persistence.Column(columnDefinition = "NUMBER")
    private Integer views;


}










