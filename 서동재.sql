1.회원가입
INSERT INTO USERINFO (ID,PASSWORD,PWCHECK,PHONE_NUMBER,EMAIL,ADDRESS)
VALUES(?,?,?,?,?,?)
아이디 중복
SELECT ID FROM USERINFO WHERE ID = ?;
이메일 체크
SELECT EMAIL FROM USERINFO WHERE EMAIL = ?; 


2.회원탈퇴
DELETE FROM USERINFO WHERE ID = ? AND PASSWORD =?;

3.로그인
SELECT ID,PASSWORD FROM USERINFO WHERE ID = ? AND PASSWORD = ?;

4.문의하기
조회
SELECT FROM CONNECTING WHERE USER_ID = ? AND CONNECTING_INTERMEDIARY_ID = ?

작성
INSERT INTO CONNECTING(CONNECTING_INTERMEDIARY_ID,CONNECTING_DETAL,CONNECTING_DATE,CONNECTING_A_C,CONNECTING_USER_ID,CONNECTING_ANSWER)
VALUES(?,?,?,?,?,?)

문의 내용 수정
UPDATE CONNECTING SET CONNECTING_DETAIL = ?  WHERE CONNECTING_ID = ?;

5.비밀번호 찾기
SELECT *FROM USERINFO WHERE ID = ? AND PHONE_NUMBER =?


회원가입 순서
1. 아이디를 입력한다.
2. 아이디가 중복되었는지 체크한다.
3. 비밀번호를 입력한다
4. 비밀번호 확인을 입력한다.
5. 입력한 비밀번호가 동일한지 체크한다.
6. 휴대폰 번호를 입력한다.
7. 이메일을 입력한다.
8. 주소를 입력한다.
9. 가입하기 버튼을 누른다.(중복체크가 안되어 있을시 중복체크를 눌러달라고 알림,
중복체크 Boolean으로 체크, 아이디변경 되었을경우 다시 중복체크,가입하기 눌렀을때 이메일 제외 빈값이 있을경우 필수항목을 입력하세요 알림)

로그인 순서

1.아이디와 비밀번호 입력
2. 로그인버튼을 누를시 아이디나 비밀번호가 비어있으면 입력하세요, 틀렸을경우 아이디혹은 비밀번호가 맞지않습니다 알림
3. 동일한경우 메인페이지로 이동

로그인 홈페이지에서 다른 항목
1. 회원가입을 누를경우 회원가입 페이지로 이동
2. 비밀번호를 잊어버리셨나요? 클릭시 비밀번호 찾기 페이지로 이동 (아이디를 입력해서 찾기)
3. 비밀번호 보기 누를시 비밀번호가 보이게 변경

비밀번호 찾기 페이지
1.아이디와 전화번호 입력해서 비밀번호 변경하는 페이지로 이동(아이디혹은 번호가 다를경우 아이디혹은 번호를 확인하세요)

비밀번호 변경 페이지
1.새비밀번호와 새비밀번호확인입력(비어있는 칸이 있거나 일치하지 않으면 입력하라고 알림)
2. 정확히 입력후 로그인 페이지로 이동

회원탈퇴 페이지
1.아이디 비밀번호 입력후 회원 탈퇴 버튼 누를시 정말로 탈퇴 하시겠습니까 알림
2.돌아가기 누를시 메인페이지로 다시이동
3.확인 입력시 회원탈퇴되었습니다 알림창 이동
4.확인 누를때메인페이지로 이동

문의하기 페이지
1.제목을 작성한다.(제목 작성 안할시 제목 작성해달라고 알림)
2.내용을 작성한다.(내용 작성 안할시 내용 작성해달라고 알림)
3. 취소를 누를시 마이페이지로 이동
4. 작성하기 누를시 게시물 작성됨






