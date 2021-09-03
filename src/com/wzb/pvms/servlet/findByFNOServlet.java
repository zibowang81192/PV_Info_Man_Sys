package com.wzb.pvms.servlet;

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

@WebServlet("/findByFNO")
public class findByFNOServlet extends HttpServlet {

    siteRepository siteRepository=new siteRepository();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int PNO= Integer.parseInt(req.getParameter("id"));
        req.setCharacterEncoding("UTF-8");
        site_factory site=null;
        site= siteRepository.findByPNO(PNO);
        System.out.println( site.toString());
        req.setAttribute("site_factory",site);
        req.getRequestDispatcher("update_SITEInfo.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
