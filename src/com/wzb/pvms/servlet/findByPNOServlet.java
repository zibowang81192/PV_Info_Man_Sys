package com.wzb.pvms.servlet;

import com.wzb.pvms.entity.program;
import com.wzb.pvms.repository.programRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/findByPNO")
public class findByPNOServlet extends HttpServlet {

    programRepository programRepository=new programRepository();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int PNO= Integer.parseInt(req.getParameter("id"));
        req.setCharacterEncoding("UTF-8");
        program pro=null;
        pro= programRepository.findByPNO(PNO);
        System.out.println( pro.toString());
        req.setAttribute("program",pro);
        req.getRequestDispatcher("update_overview.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
