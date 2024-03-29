import http from "@/http-common";
import authHeader from "@/services/auth/auth-header";

class UserDataService {
  getAll(username, page, size) {
    return http.get(`/user?username=${username}&page=${page}&size=${size}`, {
      headers: authHeader(),
    });
  }

  get(id) {
    return http.get(`/user/${id}`, { headers: authHeader() });
  }

  create(user) {
    let userData = {
      username: user.username,
      email: user.email,
      password: user.password,
      name : user.name, // 사용자 이름
      birthday : user.birthday, // 사용자 생년월일
      gender : user.gender, // 사용자 성별
      phone : user.phone, // 사용자 전화번호
      address : user.address, // 사용자 전화번호
      role: [user.role], 
    };
    console.log(userData);
    // return axios.post(API_URL + 'signup', userData);
    return http.post("/user", userData, { headers: authHeader() });
  }

  update(id, changePwd, user) {
    let userData = {
      username: user.username,
      email: user.email,
      password: user.password,
      name : user.name, // 사용자 이름
      birthday : user.birthday, // 사용자 생년월일
      gender : user.gender, // 사용자 성별
      phone : user.phone, // 사용자 전화번호
      address : user.address, // 사용자 전화번호
      role: [user.role[0].rname],
      changePwd: changePwd,

    };

    console.log(userData);
    console.log(changePwd);
    return http.put(`/user/${id}`, userData, { headers: authHeader() });
  }

  delete(id) {
    return http.delete(`/user/deletion/${id}`, { headers: authHeader() });
  }

  // (12/30 추가) 아이디 찾기시 필요한 함수
  getId(email) {
    return http.get(`/user/email/${email}`, { headers: authHeader() });
  }
      // (12/30 추가) 비번 찾기시 필요한 함수
  getPw(username, email) {
    return http.get(`/user/findPw/username/${username}/email/${email}`, { headers: authHeader() });
  }    
    // (12/30 추가) 비번 재설정 시 필요한 함수
    updatePassword(email, user) {
      let userData = {
        password: user.password,
      };
    return http.put(`/user/changePw/email/${email}`,userData, { headers: authHeader() });
  }
}

export default new UserDataService();
