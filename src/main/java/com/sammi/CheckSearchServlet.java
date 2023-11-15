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

@WebServlet("/CheckSearchServlet")
public class CheckSearchServlet extends HttpServlet {
    private String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
    private String jdbcUsername = "sm";
    private String jdbcPassword = "sm1234";
    
    protected List<RealEstate> getAllRealEstateList(String sqlBuilder) {
        List<RealEstate> realEstateList = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement pstmt = conn.prepareStatement(sqlBuilder);
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
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	 try {
             Class.forName("oracle.jdbc.driver.OracleDriver");
         } catch (ClassNotFoundException e) {
             e.printStackTrace();
         }
    	 request.setCharacterEncoding("UTF-8");

        String[] realestateTypes = request.getParameterValues("realestate_type");
        String[] buildTypes = request.getParameterValues("build_type");
        String[] areas = request.getParameterValues("area");
        String[] totalRooms = request.getParameterValues("total_room");
        
        
        int minPrice = 0;
        int maxPrice = 999999999;

        StringBuilder sqlBuilder = new StringBuilder("SELECT * FROM realestate_info WHERE 1 = 1");

        
        if (realestateTypes != null && realestateTypes.length > 0) {
            sqlBuilder.append(" AND realestate_type IN (");
            for (String type : realestateTypes) {
                sqlBuilder.append("'").append(type).append("',");
            }
            sqlBuilder.deleteCharAt(sqlBuilder.length() - 1);
            sqlBuilder.append(")");
        }

       
        if (realestateTypes != null && realestateTypes.length > 0) {
            sqlBuilder.append(" AND realestate_type IN (");
            for (String type : realestateTypes) {
                sqlBuilder.append("'").append(type).append("',");
            }
            sqlBuilder.deleteCharAt(sqlBuilder.length() - 1);
            sqlBuilder.append(")");
        }

        if (buildTypes != null && buildTypes.length > 0) {
            sqlBuilder.append(" AND build_type IN (");
            for (String type : buildTypes) {
                sqlBuilder.append("'").append(type).append("',");
            }
            sqlBuilder.deleteCharAt(sqlBuilder.length() - 1);
            sqlBuilder.append(")");
        }

        if (areas != null && areas.length > 0) {
            sqlBuilder.append(" AND area IN (");
            for (String area : areas) {
                sqlBuilder.append(area).append(",");
            }
            sqlBuilder.deleteCharAt(sqlBuilder.length() - 1);
            sqlBuilder.append(")");
        }

        if (totalRooms != null && totalRooms.length > 0) {
        	sqlBuilder.append(" AND total_room IN (");

            for (String room : totalRooms) {
                sqlBuilder.append(room.equals("5�̻�") ? "5" : room).append(",");
            }
            sqlBuilder.deleteCharAt(sqlBuilder.length() - 1);
            sqlBuilder.append(")");
        }
      
        sqlBuilder.append(" AND realestate_price BETWEEN ").append(minPrice).append(" AND ").append(maxPrice);

    
        try (Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement pstmt = conn.prepareStatement(sqlBuilder.toString());
             ResultSet rs = pstmt.executeQuery()) {
        	List<RealEstate> listRealEstates = new ArrayList<RealEstate>();
            
            while (rs.next()) {
                int realestateId = rs.getInt("realestate_id");
                String realestateType = rs.getString("realestate_type");
                String buildType = rs.getString("build_type");
                int area = rs.getInt("area");
                int totalRoom = rs.getInt("total_room");
                int realestatePrice = rs.getInt("realestate_price");
                RealEstate t = new RealEstate(realestateId, realestateType, buildType, area, totalRoom, realestatePrice);
                listRealEstates.add(t);
               
            }

            request.setAttribute("searchResult", listRealEstates);
            request.getRequestDispatcher("result_check.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    
}
