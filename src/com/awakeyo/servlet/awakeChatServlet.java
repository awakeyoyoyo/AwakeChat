package com.awakeyo.servlet;

import com.awakeyo.socket.UserManager;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class awakeChatServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<String> names=UserManager.names();
        ObjectMapper mapper=new ObjectMapper();
        String username=req.getParameter("username");
        req.setAttribute("username",username);
        req.setAttribute("names",mapper.writeValueAsString(names));
        req.getRequestDispatcher("/jsps/awakeChat.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
