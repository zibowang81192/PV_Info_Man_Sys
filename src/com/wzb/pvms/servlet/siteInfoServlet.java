package com.wzb.pvms.servlet;

import com.wzb.pvms.entity.program;
import com.wzb.pvms.entity.site_factory;
import com.wzb.pvms.repository.programRepository;
import com.wzb.pvms.repository.siteRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
@WebServlet("/siteInfo")
public class siteInfoServlet extends HttpServlet {
    siteRepository siteRepository=new siteRepository();
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        site_factory site_factory=null;
        List<site_factory> list=new ArrayList<>();
        int PNO= Integer.parseInt(req.getParameter("id"));
        System.out.println("PNO"+PNO);
        site_factory=siteRepository.findByPNO(PNO);
        System.out.println(site_factory.toString());
        list.add(site_factory);
        req.setAttribute("list",list);
        req.setAttribute("PNO",PNO);

        System.out.println("siteInfoServlet : PNO = "+PNO);

        req.getRequestDispatcher("site_info.jsp").forward(req,resp);

    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        super.doPost(req, resp);
    }


}
