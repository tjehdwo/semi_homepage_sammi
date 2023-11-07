CONNECTING_DATE,CONNECTING_A_C, CONNECTING_USER_ID, CONNECTING_ANSWER) values (?,?,?,?,?,?,?)

/*코멘트 최신순*/
SELECT * FROM connecting order by connecting_date DESC;

/*코멘트 과거순*/
SELECT * FROM connecting order by connecting_date ASC;

/*코멘트 수정*/
UPDATE connecting SET connecting_detail = ? where connecting_id = ?;

/*코멘트 삭제*/
DELETE connecting WHERE connecting_id = ?;

/*2. 매물 찜하기*/

/*찜하기*/
INSERT INTO likelist(like_id, intermediary_id, user_id,realestate_id)
values(?,?,?,?) 

/*찜 취소하기 */
DELETE likelist where like_id = ? AND user_id =?;

/*찜 개수 추가*/



/*3. 매물 추천하기*/

/*(중개인,매물정보 조인)i : 중개인, r : 매물 정보*/
SELECT i.intermediary_id , i.company_address, r.realestate_id, r.intermediary_id
FROM intermediary i , realestate_id r
where i.intermediary_id = r.intermediary_id 
AND i.company_address LIKE '%?%' ;

/*4. 매물 검색하기*/

/*검색창이 공백일 때*/
SELECT * from 
