package com.sammi;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//검색용 쿼리문 작성해놓은 dao
public class SearchDAO  {
	private static final String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String jdbcUsername = "sm";
    private static final String jdbcPassword = "sm1234";
    public SearchDAO() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
    
    //모든 매물 보기
    public List<RealEstate> getAllRealEstateList() {
        List<RealEstate> realEstateList = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM realestate_info");
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
               
               int realestate_id =  rs.getInt("realestate_id");
                String realestate_type = rs.getString("realestate_type");
                String build_type = rs.getString("build_type");
                int area = rs.getInt("area");
                int total_room = rs.getInt("total_room");
                int realestate_price = rs.getInt("realestate_price");
                RealEstate realEstate = new RealEstate(realestate_id,realestate_type,build_type,area,total_room,realestate_price);
				realEstateList.add(realEstate);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return realEstateList;
    }
   // public List<RealEstate> searchByRealestateType(/*String realestateType, */String buildType) {
    
    //검색조건 설정 후 검색하는 메소드 검색조건 : 건물유형
    public List<RealEstate> searchByRealestateType(String build_Type) {
        List<RealEstate> result = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            // 데이터베이스 연결
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            //String query = "SELECT * FROM realestate_info WHERE realestate_type = ? AND build_type = ?";
            //Like로 변경해줄 것
            String query = "SELECT * FROM realestate_info WHERE build_Type = ?";

            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, build_Type);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                RealEstate realEstate = new RealEstate(build_Type);
                // 결과에서 필요한 정보를 RealEstate 객체에 설정
                realEstate.setRealestateId(resultSet.getInt("realestate_id"));
                realEstate.setRealestateType(resultSet.getString("realestate_type"));
                realEstate.setBuildType(resultSet.getString("build_Type"));
                realEstate.setArea(resultSet.getInt("area"));
                realEstate.setTotalRoom(resultSet.getInt("total_room"));
                realEstate.setRealestatePrice(resultSet.getInt("realestate_price"));

                result.add(realEstate);
            }
        } catch (SQLException e) {
            e.printStackTrace();
           
        } finally {
           
        }

        return result;
    }
}
