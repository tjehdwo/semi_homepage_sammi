<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.sammi.RealEstate" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>매물 검색 결과</title>
</head>
<body>
    <h2>매물 검색 결과</h2>

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
        
            List<RealEstate> searchResults = (List<RealEstate>) request.getAttribute("searchResults");
           System.out.println("searchResults : " + searchResults);
        	for (RealEstate result : searchResults) {
        %>
            <tr>
                <td><%= result.getRealestateId() %></td>
                <td><%= result.getRealestateType() %></td>
                <td><%= result.getBuildType() %></td>
                <td><%= result.getArea() %></td>
                <td><%= result.getTotalRoom() %></td>
                <td><%= result.getRealestatePrice() %></td>
            </tr>
        <% 
            }
        %>
    </table>
</body>
</html>
