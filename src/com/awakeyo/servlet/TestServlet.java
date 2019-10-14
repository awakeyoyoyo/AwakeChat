package com.awakeyo.servlet;



import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class TestServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8"); //1
        resp.setContentType("text/html;charset=utf-8"); //2
        req.setCharacterEncoding("utf-8"); //3
        int number=0;
        String tetst01=req.getParameter("test01");
        if (tetst01.equals("yes")){
            number++;
        }
        String tetst02=req.getParameter("test02");
        if (tetst02.equals("rose")){
            number++;
        }
        String[] tetst03=req.getParameterValues("test03");
        number+=tetst03.length;
        String tetst04=req.getParameter("test04");
        String tetst05=req.getParameter("test05");
        resp.getWriter().println("你的分数是："+number);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
