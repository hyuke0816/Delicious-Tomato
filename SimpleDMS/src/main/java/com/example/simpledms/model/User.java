package com.example.simpledms.model;

import lombok.*;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.HashSet;
import java.util.Set;

@Entity
@SequenceGenerator(
        name = "SQ_USER_GENERATOR"
        , sequenceName = "SQ_USER"
        , initialValue = 1
        , allocationSize = 1
)
@Table(name = "TB_USER",
        uniqueConstraints = {
                @UniqueConstraint(columnNames = "USERNAME"),
                @UniqueConstraint(columnNames = "EMAIL")
        })
@Getter
@Setter
@ToString(exclude = "role")
@NoArgsConstructor
@DynamicInsert
@DynamicUpdate
// soft delete
@Where(clause = "DELETE_YN = 'N'")
@SQLDelete(sql = "UPDATE TB_USER SET DELETE_YN = 'Y', DELETE_TIME=TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') WHERE ID = ?")
public class User extends BaseTimeEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE
            , generator = "SQ_USER_GENERATOR"
    )
    @javax.persistence.Column
    private Long id;

    //  로그인 ID 임
    @NotBlank
    @Size(max = 20)
    @javax.persistence.Column
    private String username;

    @NotBlank
    @Size(max = 50)
    @Email
    @javax.persistence.Column
    private String email;

    @NotBlank
    @Size(max = 120)
    @javax.persistence.Column
    private String password;

    @NotBlank
    @Size(max = 120)
    @javax.persistence.Column
    private String name;


    @Size(max = 120)
    @javax.persistence.Column
    private String birthday;


    @Size(max = 120)
    @javax.persistence.Column
    private String gender;


    @Size(max = 120)
    @javax.persistence.Column
    private String phone;


    @Size(max = 120)
    @javax.persistence.Column
    private String address;


    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(  name = "TB_USER_ROLE",
            joinColumns = @JoinColumn(name = "USER_ID"),
            inverseJoinColumns = @JoinColumn(name = "ROLE_ID"))
    private Set<Role> role = new HashSet<>();

    public User(String username, String email, String password, String name, String birthday, String gender, String phone, String address) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.name = name;
        this.birthday = birthday;
        this.gender = gender;
        this.phone = phone;
        this.address = address;
    }

    public User(Long id, String username, String email, String password, String name, String birthday, String gender, String phone, String address) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.name = name;
        this.birthday = birthday;
        this.gender = gender;
        this.phone = phone;
        this.address = address;
    }

    //
//    public User(String username, String email, String password) {
//        this.username = username;
//        this.email = email;
//        this.password = password;
//    }
//
//    public User(Long id, String username, String email, String password) {
//        this.id = id;
//        this.username = username;
//        this.email = email;
//        this.password = password;
//    }


    //  TODO : 1) 추가
    @Builder
    public User(String username, String email, String password, String name, Set<Role> role) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.name = name;
        this.role = role;
    }
    //  TODO : 2) 추가
    public User update(String name) {
        this.username = username;

        return this;
    }

//    todo: 12/30 비번 찾기용 소스 추가
@Builder
public User(Long id, String username, String email, String password, String name, String birthday, String gender, String phone, String address, Set<Role> role) {
    this.id = id;
    this.username = username;
    this.email = email;
    this.password = password;
    this.name = name;
    this.birthday = birthday;
    this.gender = gender;
    this.phone = phone;
    this.address = address;
    this.role = role;

}
}
