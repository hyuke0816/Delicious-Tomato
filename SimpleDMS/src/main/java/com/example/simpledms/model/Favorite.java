package com.example.simpledms.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;

import javax.persistence.Column;
import javax.persistence.*;

/**
 * packageName : com.example.jpaexam.model
 * fileName : Faq
 * author : ds
 * date : 2022-10-19
 * description : QNA 모델(== JPA : 엔티티(Entity)) 클래스
 * ===========================================================
 * DATE            AUTHOR             NOTE
 * —————————————————————————————
 * 2022-10-19         ds          최초 생성
 */
@Entity
@Table(name = "TB_FAVORITE")
@SequenceGenerator(
        name= "SQ_FAVORITE_GENERATOR"
        , sequenceName = "SQ_FAVORITE"
        , initialValue = 1
        , allocationSize = 1
)
@Getter
@Setter
@NoArgsConstructor
@DynamicInsert
@DynamicUpdate
@Where(clause = "DELETE_YN = 'N'")
@SQLDelete(sql="UPDATE TB_FAVORITE SET DELETE_YN = 'Y', DELETE_TIME = TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') WHERE FID = ?")
public class Favorite extends BaseTimeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE
                   , generator = "SQ_FAVORITE_GENERATOR"
    )
    private Integer fid;

    @Column
    private String id;

    @Column
    private String dno;

    @Column
    private String favoriteYn;
}










