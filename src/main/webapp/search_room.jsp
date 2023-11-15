<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.sammi.RealEstate" %>
<%@ page import="com.sammi.SearchDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>매물 검색</title>
</head>
<body> 

	
	<form action="SearchServlet" method="post">
        <label for="build_Type">건물 타입:</label>
    	<input type="text" name="build_Type" id="build_Type" placeholder="아파트, 단독주택, 빌라, 오피스텔, 원룸 등" required>
		<input type="submit" value="검색">
    </form>

    <form action="CheckSearchServlet" method="post">
        <label>매물유형:</label>
        <input type="checkbox" name="realestate_type" value="월세"> 월세
        <input type="checkbox" name="realestate_type" value="전세"> 전세
        <input type="checkbox" name="realestate_type" value="매매"> 매매
		<br>
        <label>건물유형:</label>
        <input type="checkbox" name="build_type" value="아파트"> 아파트
        <input type="checkbox" name="build_type" value="단독주택"> 단독주택
        <input type="checkbox" name="build_type" value="빌라"> 빌라
        <input type="checkbox" name="build_type" value="오피스텔"> 오피스텔
        <input type="checkbox" name="build_type" value="원룸"> 원룸
		<br>
        <label>면적:</label>
        <input type="checkbox" name="area" value="10"> 10평
        <input type="checkbox" name="area" value="20"> 20평
        <input type="checkbox" name="area" value="30"> 30평
        <input type="checkbox" name="area" value="40"> 40평 이상
		<br>
        <label>방 개수:</label>
        <input type="checkbox" name="total_room" value="1"> 1개
        <input type="checkbox" name="total_room" value="2"> 2개
        <input type="checkbox" name="total_room" value="3"> 3개
        <input type="checkbox" name="total_room" value="4"> 4개
        <input type="checkbox" name="total_room" value="5이상"> 5개 이상
		<br>
        <input type="submit" value="검색" />
    </form>
    
     <!-- DB에 있는 모든 방 목록 표시 -->
  <table border="1">
        <tr>
            <th>매물 ID</th>
            <th>매물 유형</th>
            <th>건물 유형</th>
            <th>면적</th>
            <th>방 개수</th>
            <th>매매가</th>
        </tr>
        <% 
       	 	SearchDAO SDAO = new SearchDAO();
        	List<RealEstate> sss = SDAO.getAllRealEstateList();
		
			for(RealEstate p : sss) {
        %>
            <tr>
                <td><%= p.getRealestateId() %></td>
                <td><%= p.getRealestateType() %></td>
                <td><%= p.getBuildType() %></td>
                <td><%= p.getArea() %></td>
                <td><%= p.getTotalRoom() %></td>
                <td><%= p.getRealestatePrice() %></td>
            </tr>
        <% 
            }
        %>
    </table>
</body>
</html>
