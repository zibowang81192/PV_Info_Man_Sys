package com.wzb.pvms.servlet;

import com.wzb.pvms.entity.weather;
import com.wzb.pvms.repository.programRepository;
import com.wzb.pvms.repository.weatherInfoRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/findByWNO")
public class findByWNOServlet extends HttpServlet {

    weatherInfoRepository weatherInfoRepository=new weatherInfoRepository();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int FNO= Integer.parseInt(req.getParameter("id"));
        req.setCharacterEncoding("UTF-8");
        weather wea=null;
        wea= weatherInfoRepository.findByFNO(FNO);
        System.out.println( wea.toString());
        req.setAttribute("wea",wea);

        System.out.println("findByWNOServlet : FNO = "+FNO);
        //System.out.println("findByWNOServlet : WNO = "+WNO);

        req.getRequestDispatcher("update_WEATHERInfo.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
