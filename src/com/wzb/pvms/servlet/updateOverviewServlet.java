package com.wzb.pvms.servlet;

import com.wzb.pvms.repository.programRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/update_overview")
public class updateOverviewServlet extends HttpServlet {
    private programRepository proRepository=new programRepository();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        int PNO=Integer.parseInt(req.getParameter("PNO"));
        String PNAME=req.getParameter("PNAME");
        String PTYPE=req.getParameter("PTYPE");
        String PTERM=req.getParameter("PTERM");
        String POWNER=req.getParameter("POWNER");
        String PFIRM=req.getParameter("FIRM");
        int PYEAR=Integer.parseInt(req.getParameter("PYEAR"));
        int PMONTH=Integer.parseInt(req.getParameter("PMONTH"));
        proRepository.updateByPNO(PNO,PNAME,PTYPE,PTERM,POWNER,PFIRM,PYEAR,PMONTH);
        resp.sendRedirect("overview?id="+PNO);//重定向
    }
}
