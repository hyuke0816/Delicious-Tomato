<template>
  <div>
    <div class="container col-8 mb-2 mt-2">
      <div class="ColumnView-header mt-5">
        <h1 class="text-900">푸드컬럼</h1>
      </div>
      <div class="ColumnView-title">
        <table class="table">
          <colgroup>
            <col style="width: 15%" />
            <col style="width: 85%" />
          </colgroup>
          <thead>
            <tr>
              <th scope="col"></th>
              <th scope="col"></th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th scope="col">제목</th>
              <td scope="col" v-text="currentColumn.title"></td>
            </tr>
            <tr>
              <th scope="col">부제목</th>
              <td scope="col" v-text="currentColumn.subtitle"></td>
            </tr>
            <tr>
              <th scope="row">작성자</th>
              <td scope="row" v-text="currentColumn.writer"></td>
            </tr>
            <tr>
              <th scope="row">조회수</th>
              <td scope="row" v-text="currentcolumnForViews.views"></td>
            </tr>
            <tr>
              <td colspan="2" scope="row" style="padding: 10px">
                <div class="contentarea">
                  <div>
                    <img v-if="existImage" id="imageSize" class="preview my-3 " :src="currentColumn2.fileUrl" alt="" />
                  </div>
                  {{ currentColumn.content }}
                </div>
              </td>
            </tr>
          </tbody>
        </table>
        <div class="card">
          <div class="card-header pb-4">댓글
            <ul class="list-group">
              <li class="list-group-item d-flex justify-content-between p-2" v-for="(data, index) in comment"
                :key="index">
                <h4 class="col-1"><span class="badge rounded-pill bg-primary  text-dark">{{ data.writer }}</span></h4>
                <p class="col-6">{{ data.content }}</p>
                <div class="d-flex">
                  <div class="front-italic col-">작성일:{{ data.insertTime.split(" ")[0] }}&nbsp;</div>
                  <span class="badge bg-primary p-2 mt-1 ms-3"><span class="fs-0">수정</span></span>
                  <span class="badge bg-danger p-2 mt-1 ms-3"><span class="fs-0">삭제</span></span>
                  <!-- <span class="badge rounded-pill bg-danger text-dark col-2">삭제</span> -->
                </div>
                <!-- <h1>여기</h1> -->
              </li>
            </ul>
          </div>
        </div>

        <br />

        <div class="card">
          <div class="card-body input-group"><span class="input-group-text">댓글창</span><textarea class="form-control"
              row="1"></textarea><button type="button" class="btn btn-danger">등록</button></div>
        </div>
      </div>
    </div>

    <div class="mb-3">
      <router-link :to="'/column/' + currentColumn.cid" v-if="showDetailBoard">
        <button class="btn btn-warning offset-5" type="button">
          수정&삭제
        </button>
      </router-link>
    </div>
  </div>
</template>

<script>
import ColumnDataService from "@/services/ColumnDataService";
import CommentDataService from "@/services/CommentDataService";
import User from "@/model/user";

export default {
  data() {
    return {
      currentColumn: null,
      currentColumn2: null,
      message2: "",
      currentImage: undefined, // 현재 이미지 변수
      previewImage: undefined, // 미리보기 이미지 변수
      message: "", // 서버쪽 메세지를 저장할 변수
      currentIndex: -1,
      name: "",

      // 질문 댓글 조회를 위한 배열 생성
      comment: [],

      // 질문 댓글 생성을 위한 객체 생성
      cidComment: {
        cno: null,
        qno: null,
        fno: null,
        aid: null,
        cid: null,
        id: null,
        writer: "",
        content: "",
      },

      // 댓글 수정창이 보일지 말지 결정하는 변수
      showUpdateComment: false,
      // 댓글 입력창이 보일지 말지 결정하는 변수 - 초기값
      showInsertComment: true,

      // 조회수용 변수 추가
      currentcolumnForViews: null,


      // 페이징을 위한 변수 정의
      page: 1, // 현재 페이지
      count: 0, // 전체 데이터 건수
      pageSize: 3, // 한페이지당 몇개를 화면에 보여줄지 결정하는 변수
    };
  },
  methods: {
    // TODO: 푸드컬럼 pk로 조회 요청하는 함수
    getColumn(cid) {
      // axios 공통함수 호출
      ColumnDataService.get(cid)
        // 성공하면 .then() 결과가 리턴됨
        .then((response) => {
          // springboot 결과를 리턴함(부서 객체)
          this.currentColumn = response.data;
          // 콘솔 로그 출력
          console.log("댓글정보 조회 성공 : ", response.data);
        })
        // 실패하면 .catch() 에러메세지가 리턴됨
        .catch((e) => {
          console.log("댓글정보 조회 실패 : ", e);
        });
      ColumnDataService.getById(cid)
        // 성공하면 .then() 결과가 리턴됨
        .then((response) => {
          // springboot 결과를 리턴함(부서 객체)
          this.currentcolumnForViews = response.data;
          // 콘솔 로그 출력
          console.log(response.data);
        })
        // 실패하면 .catch() 에러메세지가 리턴됨
        .catch((e) => {
          console.log(e);
        });
      ColumnDataService.getImage(cid)
        .then((response) => {
          this.currentColumn2 = response.data;
          console.log(response.data);
        })
        .catch((e) => {
          console.log(e);
        });
    },

    // ==================================== 댓글 관련 ======================================= //
    // TODO: 댓글 정보를 조회요청하는 함수
    getCommentByCid() {
      CommentDataService.getCommentByCid(
        this.$route.params.cid,
        this.page - 1,
        this.pageSize
      )
        .then((response) => {
          // springboot 결과를 리턴함(질문 객체)
          const { comment, totalItems } = response.data; // springboot 의 전송한 맵 정보
          this.comment = comment; // 스프링부트에서 전송한 데이터
          this.count = totalItems;
          // 콘솔 로그 출력
          console.log(
            "푸드컬럼 번호에 해당하는 댓글 정보 조회요청 성공 : ",
            response.data
          );
        })
        // 실패하면 .catch() 에러메세지가 리턴됨
        .catch((e) => {
          console.log(
            "푸드컬럼 번호에 해당하는 댓글 정보 조회요청 실패 : ",
            e
          );
        });
    },

    // TODO: 댓글 번호에 해당하는 댓글 정보를 조회요청하는 함수
    getCommentByCno(cno) {
      CommentDataService.getByCno(cno)
        .then((response) => {
          // springboot 결과를 리턴함(질문 객체)
          this.currentComment = response.data;
          // 콘솔 로그 출력
          console.log(
            "댓글번호에 해당하는 댓글 정보 조회 성공 : ",
            response.data
          );
        })
        // 실패하면 .catch() 에러메세지가 리턴됨
        .catch((e) => {
          console.log("댓글번호에 해당하는 댓글 정보 조회 실패 : ", e);
        });
    },
    // TODO: 댓글 정보를 저장 요청하는 함수
    saveCidComment() {
      if (this.currentUser.id != null) {
        let data = {
          // cno는 자동생성
          qno: null,
          fno: null,
          aid: null,
          cid: this.$route.params.cid,
          id: this.currentUser.id,
          writer: this.currentUser.username,
          content: this.cidComment.content,
        };

        CommentDataService.create(data)
          // 성공하면 then() 결과가 전송됨
          .then((response) => {
            this.cidComment.cno = response.data.cno;
            // 콘솔 로그 출력(response.data)
            console.log("댓글정보 저장 성공 : ", response.data);
            // 변수 submitted
            this.submitted = true;
            this.$router.go();
          })
          // 실패하면 .catch() 결과가 전송됨
          .catch((e) => {
            console.log("댓글정보 저장 실패 : ", e);
          });
      } else {
        this.$swal({
          icon: "error",
          title: "로그인이 필요한 서비스입니다",
          text: "로그인하시면 다양한 서비스를 이용할 수 있습니다",
          confirmButtonColor: "#E1793D",
          confirmButtonText: "확인",
        });
      }
    },
    // TODO: 댓글 정보를 수정 요청하는 함수
    updateCidComment() {
      CommentDataService.update(this.currentComment.cno, this.currentComment)
        // 성공하면 then() 결과가 전송됨
        .then((response) => {
          console.log("댓글 정보 수정 성공 : ", response.data);
          this.$router.go();
        })
        // 실패하면 .catch() 에러메세지가 전송됨
        .catch((e) => {
          console.log("댓글 정보 수정 실패 : ", e);
        });
    },
    // TODO: 댓글정보를 삭제 요청하는 함수
    deleteComment(cno) {
      // axios 공통함수 호출
      CommentDataService.delete("댓글 정보 삭제 성공 : ", cno)
        // 성공하면 then() 결과가 전송됨
        .then((response) => {
          console.log(response.data);
          this.$router.go();
        })
        // 실패하면 .catch() 에러메세지가 전송됨
        .catch((e) => {
          console.log("댓글 정보 삭제 실패 : ", e);
        });
    },
    // TODO: 댓글정보가 있는지 확인하는 함수
    existComment() {
      if (this.comment != null) {
        return false;
      } else {
        return true;
      }
    },

    // TODO: 관리자 또는 댓글 작성자인지 확인하는 함수
    showEditDelete(data) {
      if (this.currentUser.roles) {
        if (
          this.currentUser.roles.includes("ROLE_ADMIN") ||
          this.currentUser.id == data.id
        ) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    },

    // TODO: 수정버튼을 클릭시 댓글 입력창과 댓글 수정창이 바뀌는 버튼
    toggleComment(cno) {
      this.showInsertComment = !this.showInsertComment;
      if (this.showInsertComment == false) {
        this.showUpdateComment = true;
        this.getCommentByCno(cno);
      } else {
        this.showUpdateComment = false;
      }
    },
    // TODO: 댓글 페이징 처리 함수들
    // select box 값 변경시 실행되는 함수(재조회)
    handlePageSizeChange(event) {
      this.pageSize = event.target.value; // 한페이지당 개수 저장(3, 6, 9)
      this.page = 1;
      // 재조회 함수 호출
      this.getCommentByCid();
    },
    // 페이지 번호 변경시 실행되는 함수(재조회)
    handlePageChange(value) {
      this.page = value; // 매개변수값으로 현재페이지 변경
      // 재조회 함수 호출
      this.getCommentByCid();
    },
    // ==================================== 댓글 관련 ======================================= //

  },

  computed: {
    // TODO: 로컬 스토리지에 저장된 현재 유저 정보 가져오는 함수
    currentUser() {
      // 만약 로컬스토리지에 유저객체가 없으면 빈유저 생성
      if (this.$store.state.auth.user == undefined) {
        let notLoggedUser = new User();
        return notLoggedUser;
      } else {
        // 모듈 저장소 : this.$store.state.모듈명.state값
        // user 객체 의 속성 : username, password, email, accesToken, roles(배열)
        return this.$store.state.auth.user;
      }
    },

    // TODO: 글작성자 or 관리자일 경우 버튼이 보이게 하는 함수
    showDetailBoard() {
      if (this.currentUser && this.currentUser.roles) {
        // if ROLE_ADMIN 있으면 true 없으면 false 이거나 현재로그인한id == 글쓴사람id
        return (
          this.currentUser.roles.includes("ROLE_ADMIN") ||
          this.currentUser.id == this.currentFree.id
        );
      }
      // currentUser 없으면 false (메뉴가 안보임)
      return false;
    },

    // TODO: 이미지가 존재하는지 여부 확인하는 함수
    existImage() {
      if (this.currentColumn2.fileUrl != null) {
        console.log("로그는:", this.currentColumn);
        return true;
      } else {
        console.log("else:", this.currentColumn);
        return false;
      }
    }
  },

  // 화면이 뜨자 마자 실행되는 이벤트
  mounted() {
    this.message2 = "";
    this.getColumn(this.$route.params.cid);
    this.getCommentByCid();

  },
};
</script>

<style>
.contentarea {
  width: 1240px;
  height: 600px;
  padding: 30px;
}

#imageSize {
  width: 550px;
  height: 500px;
}
</style>
