<template>
  <div>
    <div>
      <div class="container col-6 mb-2 mt-2">
        <div class="AnnounceView-header mt-5">
          <h1>
            <strong>자유게시판 수정</strong>
          </h1>
        </div>
        <div class="AnnounceView-title">
          <div class="input-group mt-3 mb-4">
            <span class="input-group-text">제목</span>
            <input
              type="text"
              class="form-control"
              style="height: 50px"
              id="title"
              required
              name="title"
              v-model="currentFree.title"
            />
          </div>
          <div class="input-group mb-4">
            <span class="input-group-text">작성자</span>
            <input
              type="writer"
              class="form-control"
              style="height: 50px"
              id="writer"
              required
              name="writer"
              v-bind:disabled="true"
              v-model="currentUser.username"
            />
          </div>

          <div class="mb-5">
            <textarea
              class="form-control form-control-lg"
              id="content"
              rows="8"
              required
              name="content"
              v-model="currentFree.content"
            ></textarea>
          </div>
        </div>

        <div class="mb-3" v-if="showAdminBoard">
          <button @click="updateFree" class="btn btn-primary me-3">수정</button>
          <button @click="deleteFree" class="btn btn-danger me-3">삭제</button>
        </div>
        <div>
          <button @click="goFreeList" class="btn btn-danger me-3">
            목록보기
          </button>
        </div>
        <div class="alert alert-success" role="alert" v-if="message">
          {{ message }}
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import FreeDataService from "@/services/FreeDataService";
export default {
  data() {
    return {
      currentFree: null,
      message: "",
    };
  },
  methods: {
    // TODO: 자유게시판 pk로 조회 요청하는 함수
    getFree(fno) {
      // axios 공통함수 호출
      FreeDataService.get(fno)
        // 성공하면 .then() 결과가 리턴됨
        .then((response) => {
          // springboot 결과를 리턴함(부서 객체)
          this.currentFree = response.data;
          // 콘솔 로그 출력
          console.log("자유게시판 정보 조회 성공 : " , response.data);
        })
        // 실패하면 .catch() 에러메세지가 리턴됨
        .catch((e) => {
          console.log("자유게시판 정보 조회 실패 : " , e);
        });
    },
    // TODO: 자유게시판 정보를 수정 요청하는 함수
    updateFree() {
      // axios 공통함수 호출
      FreeDataService.update(this.currentFree.fno, this.currentFree)
        // 성공하면 then() 결과가 전송됨
        .then((response) => {
          console.log("자유게시판 정보 수정 성공 : " , response.data);
          this.message = "The Announce was updated successfully!";
          this.$router.push("/free");
        })
        // 실패하면 .catch() 에러메세지가 전송됨
        .catch((e) => {
          console.log("자유게시판 정보 수정 실패 : " , e);
        });
    },
    // TODO: 자유게시판 정보를 삭제 요청하는 함수
    deleteFree() {
      // axios 공통함수 호출
      FreeDataService.delete(this.currentFree.fno)
        // 성공하면 then() 결과가 전송됨
        .then((response) => {
          console.log("자유게시판 정보 삭제 성공 : " , response.data);
          // 첫페이지(전체목록_조회_페이지) 강제 이동 : /announce
          this.$router.push("/free");
        })
        // 실패하면 .catch() 에러메세지가 전송됨
        .catch((e) => {
          console.log("자유게시판 정보 삭제 실패 : " , e);
        });
    },
    // 푸드컬럼리스트로 페이지 이동하는 함수
    goFreeList() {
      this.$router.push("/free");
    },
  },
  computed: {
    // TODO: 로컬 스토리지에 저장된 현재 유저 정보 가져오는 함수
    currentUser() {
      // 모듈 저장소 : this.$store.state.모듈명.state값
      // user 객체 의 속성 : username, password, email, accesToken, roles(배열)
      return this.$store.state.auth.user;
    },
    // TODO: 글작성자 or 관리자일 경우 버튼이 보이게 하는 함수
    showAdminBoard() {
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
  },
  // 화면이 뜨자 마자 실행되는 이벤트
  mounted() {
    this.message = "";
    this.getFree(this.$route.params.fno);
  },
};
</script>

<style>
</style>