package com.awakeyo.servlet;

import com.sun.net.httpserver.HttpServer;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8"); //1
        resp.setContentType("text/html;charset=utf-8"); //2
        req.setCharacterEncoding("utf-8"); //3

        String username =req.getParameter("username");
        String password =req.getParameter("password");
        req.getSession().setAttribute("crrentUser",username);
        System.out.println(username+" "+password );
        req.getRequestDispatcher("index.jsp").forward(req,resp);
    }
}
