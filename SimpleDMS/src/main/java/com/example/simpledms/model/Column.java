package com.example.simpledms.model;

import lombok.*;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;

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
@Table(name = "TB_COLUMN")
@SequenceGenerator(
        name= "SQ_COLUMN_GENERATOR"
        , sequenceName = "SQ_COLUMN"
        , initialValue = 1
        , allocationSize = 1
)
@Getter
@Setter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
@DynamicInsert
@DynamicUpdate
@Where(clause = "DELETE_YN = 'N'")
@SQLDelete(sql="UPDATE TB_COLUMN SET DELETE_YN = 'Y', DELETE_TIME = TO_CHAR(SYSDATE, 'YYYY-MM-DD') WHERE CID = ?")
public class Column extends BaseTimeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE
                   , generator = "SQ_COLUMN_GENERATOR"
    )
    private Integer cid;

    @javax.persistence.Column
    private Integer id;

    @javax.persistence.Column(columnDefinition = "VARCHAR2(255)")
    private String writer;

    @javax.persistence.Column(columnDefinition = "VARCHAR2(255)")
    private String title;

    @javax.persistence.Column(columnDefinition = "VARCHAR2(255)")
    private String subtitle;

    @javax.persistence.Column(columnDefinition = "VARCHAR2(4000)")
    private String content;

    @javax.persistence.Column
    private String galleryTitle;

    @javax.persistence.Column
    private String galleryFileName;

    @javax.persistence.Column
    private String galleryType;

    @Lob
    @javax.persistence.Column(columnDefinition = "BLOB")
    private byte[] blobFile; // 이미지

//    public Free(String galleryTitle, String galleryFileName, String galleryType, byte[] blobFile) {
//        this.galleryTitle = galleryTitle;
//        this.galleryFileName = galleryFileName;
//        this.galleryType = galleryType;
//        this.blobFile = blobFile;
//    }
    @javax.persistence.Column(columnDefinition = "NUMBER")
    private Integer views;
}










