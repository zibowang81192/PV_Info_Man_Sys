package com.wzb.pvms.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String username=req.getParameter("username");
        String password=req.getParameter("password");
        String user=req.getParameter("user");
        if(user.equals("admin")) {
            if (username.equals("admin") && password.equals("admin")) {
                req.getSession().setAttribute("username", username);
                Cookie cookie = new Cookie("username", username);
                cookie.setMaxAge(60 * 60 * 24);
                resp.addCookie(cookie);

                resp.sendRedirect("proList");
            }
            else {
                PrintWriter out = resp.getWriter();
                out.print("<script language='javascript'>alert('The account or password is wrong, please log in again! ! ! ');window.location.href='login.jsp';</script>");
            }
        }
        else{
            PrintWriter out = resp.getWriter();
            out.print("<script language='javascript'>alert('WRONG!!!');window.location.href='login.jsp';</script>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}

