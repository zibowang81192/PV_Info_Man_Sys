package com.wzb.pvms.servlet;

import com.wzb.pvms.entity.brief;
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

@WebServlet("/overview")
public class overviewServlet extends HttpServlet {
    programRepository programRepository=new programRepository();
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int PNO= Integer.parseInt(req.getParameter("id"));
        req.setCharacterEncoding("UTF-8");
        program pro=null;
        pro=programRepository.findByPNO(PNO);

        List<program> list=new ArrayList<program>();
        list.add(pro);

        System.out.println( pro.toString());

        req.setAttribute("list",list);
        req.setAttribute("PNO",PNO);
        req.getRequestDispatcher("overview.jsp").forward(req,resp);


    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
       super.doPost(req, resp);
    }

}
