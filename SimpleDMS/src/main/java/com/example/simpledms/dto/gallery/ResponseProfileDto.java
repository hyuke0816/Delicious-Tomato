package com.example.simpledms.dto.gallery;

import lombok.*;

/**
 * packageName : com.example.simpledms.dto.filedb
 * fileName : ResponseFileDto
 * author : hyuk
 * date : 2022/11/10
 * description : FileDb Dto
 * ===========================================================
 * DATE            AUTHOR             NOTE
 * —————————————————————————————
 * 2022/11/10         hyuk          최초 생성
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ResponseProfileDto {

    private Integer pno;
    private String galleryFileName;


//    가공된 속성 (모델엔 없음)

    private Integer fileSize; // 이미지 크기
    private String fileUrl; // 이미지 다운로드 URL
    private String fileType;
}
