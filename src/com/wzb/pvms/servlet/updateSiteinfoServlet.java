package com.wzb.pvms.servlet;

import com.wzb.pvms.repository.programRepository;
import com.wzb.pvms.repository.siteRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/update_SITEInfo")
public class updateSiteinfoServlet extends HttpServlet {
    private siteRepository SiteRepository=new siteRepository();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        int FNO=Integer.parseInt(req.getParameter("FNO"));
        String LOC=req.getParameter("LOC");
        String FCHARACTER=req.getParameter("FCHARACTER");
        String PROVINCE=req.getParameter("PROVINCE");
        String CITY=req.getParameter("CITY");
        String COUNTRY=req.getParameter("COUNTRY");
        double CAPACITY= Double.valueOf(req.getParameter("CAPACITY"));
        double AREA= Double.valueOf(req.getParameter("AREA"));
        int ALTITUDE_MAX=Integer.parseInt(req.getParameter("ALTITUDE_MAX"));
        int ALTITUDE_MIN=Integer.parseInt(req.getParameter("ALTITUDE_MIN"));
        double LONGITUDE= Double.valueOf(req.getParameter("LONGITUDE"));
        String LONGITUDE_EORW=req.getParameter("LONGITUDE_EORW");
        double LATITUDE= Double.valueOf(req.getParameter("LATITUDE"));
        String LATITUDE_NORS=req.getParameter("LATITUDE_NORS");


        SiteRepository.updateByFNO(FNO,LOC,FCHARACTER,PROVINCE,CITY,COUNTRY,CAPACITY,AREA,ALTITUDE_MAX,ALTITUDE_MIN,LONGITUDE,LONGITUDE_EORW,LATITUDE,LATITUDE_NORS);
        resp.sendRedirect("siteInfo?id="+FNO);//重定向
    }
}
