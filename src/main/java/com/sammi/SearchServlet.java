package com.sammi;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//사용자가 입력한 값을 가져오기
@WebServlet("/HomeSearchServlet")
public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	request.setCharacterEncoding("UTF-8");
        //String realestateType = request.getParameter("realestate_type");
        String build_Type = request.getParameter("build_Type");
        
        // DAO를 사용하여 검색 수행
        SearchDAO searchDAO = new SearchDAO();
        //List<RealEstate> searchResults = searchDAO.searchByRealestateType(realestateType,buildType);
        List<RealEstate> searchResults = searchDAO.searchByRealestateType(build_Type);
        System.out.println("HomeSearchServlet  searchResults :   "+searchResults);
       
        // 검색 결과를 request에 저장
        request.setAttribute("searchResults", searchResults);
        ServletContext context = getServletContext();
       
        // 결과를 표시할 JSP 페이지로 포워딩
        RequestDispatcher dispatcher = context.getRequestDispatcher("/result_search.jsp");
        dispatcher.forward(request, response);

        
    }
}
