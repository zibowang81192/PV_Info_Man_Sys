package com.wzb.pvms.servlet;

import com.wzb.pvms.entity.site_factory;
import com.wzb.pvms.entity.weather;
import com.wzb.pvms.repository.siteRepository;
import com.wzb.pvms.repository.weatherInfoRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/weatherInfo")

public class weatherInfoServlet extends HttpServlet {
    weatherInfoRepository weatherInfoRepository=new weatherInfoRepository();
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        weather weather=null;
        List<weather> list=new ArrayList<>();
        int FNO= Integer.parseInt(req.getParameter("id"));
        System.out.println("FNO："+FNO);
        weather=weatherInfoRepository.findByFNO(FNO);
        list.add(weather);
        req.setAttribute("list",list);
        req.setAttribute("FNO",FNO);
        req.getRequestDispatcher("weatherInfo.jsp").forward(req,resp);

    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        super.doPost(req, resp);
    }
}
