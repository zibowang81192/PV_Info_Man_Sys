package com.wzb.pvms.test;

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

//@WebServlet("/proList")
public class proListServlet extends HttpServlet {
    programRepository programRepository=new programRepository();
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

        req.setCharacterEncoding("UTF-8");
        List<program> list=new ArrayList<program>();
        list= programRepository.findAll();

        req.setAttribute("list",list);
        req.getRequestDispatcher("pro_list.jsp").forward(req,resp);

    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        super.doPost(req, resp);

    }


}
