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
@Table(name = "TB_DINER")
@SequenceGenerator(
        name= "SQ_DINER_GENERATOR"
        , sequenceName = "SQ_DINER"
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
@SQLDelete(sql="UPDATE TB_DINER SET DELETE_YN = 'Y', DELETE_TIME = TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') WHERE DNO = ?")
public class Diner extends BaseTimeEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE
            , generator = "SQ_DINER_GENERATOR"
    )
    private Integer dno;

    @javax.persistence.Column
    private String dname;

    @javax.persistence.Column
    private double score;

    @javax.persistence.Column
    private String loc;

    @javax.persistence.Column
    private String phone;

    @javax.persistence.Column
    private String menu; // 한식, 중식, 일식, 양식

    @javax.persistence.Column
    private String theme;

    @javax.persistence.Column
    private String mainphoto;

    @javax.persistence.Column
    private String photo1;

    @javax.persistence.Column
    private String photo2;

    @javax.persistence.Column
    private String photo3;

    @javax.persistence.Column
    private double lat;

    @javax.persistence.Column
    private double lng;

    @javax.persistence.Column(columnDefinition = "NUMBER")
    private Integer views;

    @javax.persistence.Column(columnDefinition = "NUMBER")
    private Integer dno_count;

    @javax.persistence.Column
    private String menu1;

    @javax.persistence.Column
    private Integer price1;

    @javax.persistence.Column
    private String menu2;

    @javax.persistence.Column
    private Integer price2;

    @javax.persistence.Column
    private String menu3;

    @javax.persistence.Column
    private Integer price3;

    @javax.persistence.Column
    private String menu4;

    @javax.persistence.Column
    private Integer price4;

    @javax.persistence.Column
    private String menu5;

    @javax.persistence.Column
    private Integer price5;

}










