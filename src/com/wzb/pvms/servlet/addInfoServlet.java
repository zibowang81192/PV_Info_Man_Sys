package com.wzb.pvms.servlet;

import com.wzb.pvms.repository.programRepository;
import com.wzb.pvms.repository.siteRepository;
import com.wzb.pvms.repository.weatherInfoRepository;
import com.wzb.pvms.repository.designerRepository;
import com.wzb.pvms.repository.dpRepository;
import com.wzb.pvms.repository.psRepository;
import com.wzb.pvms.repository.swRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/addInfo")
public class addInfoServlet extends HttpServlet {
    private programRepository proRepository=new programRepository();
    private siteRepository siteRepository=new siteRepository();
    private weatherInfoRepository weatherInfoRepository=new weatherInfoRepository();
    private designerRepository designerRepository=new designerRepository();
    private dpRepository dpRepository=new dpRepository();
    private psRepository psRepository=new psRepository();
    private swRepository swRepository=new swRepository();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int WNO=0;
        int DNO=0;
        int FNO=0;
        req.setCharacterEncoding("UTF-8");
        int PNO=Integer.parseInt(req.getParameter("PNO"));
        String PNAME=req.getParameter("PNAME");
        String PTYPE=req.getParameter("PTYPE");
        String PTERM=req.getParameter("PTERM");
        String POWNER=req.getParameter("POWNER");
        String PFIRM=req.getParameter("FIRM");
        int PYEAR=Integer.parseInt(req.getParameter("PYEAR"));
        int PMONTH=Integer.parseInt(req.getParameter("PMONTH"));
        proRepository.add(PNO,PNAME,PTYPE,PTERM,POWNER,PFIRM,PYEAR,PMONTH);

        String LOC=req.getParameter("LOC");
        String FCHARACTER=req.getParameter("FCHARACTER");
        String PROVINCE=req.getParameter("PROVINCE");
        String CITY=req.getParameter("CITY");
        String COUNTRY=req.getParameter("COUNTRY");
        double CAPACITY=Double.parseDouble(req.getParameter("CAPACITY"));
        double AREA=Double.parseDouble(req.getParameter("AREA"));
        int ALTITUDE_MAX=Integer.parseInt(req.getParameter("ALTITUDE_MAX"));
        int ALTITUDE_MIN=Integer.parseInt(req.getParameter("ALTITUDE_MIN"));
        double LONGITUDE=Double.parseDouble(req.getParameter("LONGITUDE"));
        String LONGITUDE_EORW=req.getParameter("LONGITUDE_EORW");
        double LATITUDE=Double.parseDouble(req.getParameter("LATITUDE"));
        String LATITUDE_NORS=req.getParameter("LATITUDE_NORS");
        FNO=siteRepository.add(LOC,FCHARACTER,PROVINCE,CITY,COUNTRY,CAPACITY,AREA,
                ALTITUDE_MAX,ALTITUDE_MIN,LONGITUDE,LONGITUDE_EORW,LATITUDE,LATITUDE_NORS);

        double LSRA_MJ=Double.parseDouble(req.getParameter("LSRA_MJ"));
        double LSRA_KWH=Double.parseDouble(req.getParameter("LSRA_KWH"));
        int BRA=Integer.parseInt(req.getParameter("BRA"));
        double YMAT=Double.parseDouble(req.getParameter("YMAT"));
        double YHT=Double.parseDouble(req.getParameter("YHT"));
        double YLT=Double.parseDouble(req.getParameter("YLT"));
        double HMMT=Double.parseDouble(req.getParameter("HMMT"));
        int MDFS=Integer.parseInt(req.getParameter("MDFS"));
        double AWS=Double.parseDouble(req.getParameter("AWS"));
        double EWS=Double.parseDouble(req.getParameter("EWS"));
        double ATD=Double.parseDouble(req.getParameter("ATD"));
        int PC=Integer.parseInt(req.getParameter("PC"));
        WNO=weatherInfoRepository.add(LSRA_MJ,LSRA_KWH,BRA,YMAT,YHT,YLT,HMMT,MDFS,AWS,EWS,ATD,PC);

        String DNAME=req.getParameter("DNAME");
        DNO=designerRepository.add(DNAME);
        /*
        FNO,DNO,WNO由于是自增的，所以需要查询最新增加的序列
        由于未使用数据库连接池所以以下方法不可用

        int FNO=siteRepository.find_last_insert_id();
        int DNO=designerRepository.find_last_insert_id();
        int WNO=weatherInfoRepository.find_last_insert_id();

         */

        System.out.println("(FNO,DNO,WNO) = "+"("+FNO+","+DNO+","+WNO+")");

        dpRepository.add(PNO,DNO);
        psRepository.add(PNO,FNO);
        swRepository.add(FNO,WNO);

        resp.sendRedirect("proList");
    }

}
