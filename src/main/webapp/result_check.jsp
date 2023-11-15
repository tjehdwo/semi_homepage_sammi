<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.sammi.RealEstate" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>매물 검색 결과</title>
</head>
<body>

    <!-- 검색 결과 테이블 표시 -->
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
        Object a = request.getAttribute("searchResult");
        for (RealEstate realEstate : (List<RealEstate>)a ) {
        %>
            <tr>
                <td><%= realEstate.getRealestateId() %></td>
                <td><%= realEstate.getRealestateType() %></td>
                <td><%= realEstate.getBuildType() %></td>
                <td><%= realEstate.getArea() %></td>
                <td><%= realEstate.getTotalRoom() %></td>
                <td><%= realEstate.getRealestatePrice() %></td>
            </tr>
        <% 
            }
        %>
    </table>
</body>
</html>
