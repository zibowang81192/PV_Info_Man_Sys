package com.wzb.pvms.servlet;

import com.wzb.pvms.repository.programRepository;
import com.wzb.pvms.repository.siteRepository;
import com.wzb.pvms.repository.weatherInfoRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/update_WEATHERInfo")
public class updateWeatherinfoServlet extends HttpServlet {
    private weatherInfoRepository weatherRepository=new weatherInfoRepository();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        int WNO=Integer.parseInt(req.getParameter("WNO"));
        double LSRA_MJ= Double.parseDouble(req.getParameter("LSRA_MJ"));
        double LSRA_KWH= Double.parseDouble(req.getParameter("LSRA_KWH"));
        int BRA= Integer.parseInt(req.getParameter("BRA"));
        double YMAT= Double.parseDouble(req.getParameter("YMAT"));
        double YHT= Double.parseDouble(req.getParameter("YHT"));
        double YLT= Double.parseDouble(req.getParameter("YLT"));
        double HMMT= Double.parseDouble(req.getParameter("HMMT"));
        int MDFS=Integer.parseInt(req.getParameter("MDFS"));
        double AWS= Double.parseDouble(req.getParameter("AWS"));
        double EWS= Double.parseDouble(req.getParameter("EWS"));
        double ATD= Double.parseDouble(req.getParameter("ATD"));
        int PC=Integer.parseInt(req.getParameter("PC"));
        weatherRepository.updateByFNO(WNO,LSRA_MJ,LSRA_KWH,BRA,YMAT,YHT,YLT,HMMT,MDFS,AWS,EWS,ATD,PC);

        System.out.println("updateWeatherInfoServlet : WNO = "+WNO);

        resp.sendRedirect("weatherInfo?id="+WNO);//重定向
    }
}
