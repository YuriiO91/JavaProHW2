package com.example.hw1;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.concurrent.atomic.AtomicInteger;

@WebServlet(name = "questionServlet", value = "/question")
public class QuestionServlet extends HttpServlet {
    private AtomicInteger aOne = new AtomicInteger(0);
    private AtomicInteger aTwo = new AtomicInteger(0);
    private AtomicInteger aThre = new AtomicInteger(0);
    private AtomicInteger aFour = new AtomicInteger(0);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String a = req.getParameter("a");
        HttpSession session = req.getSession(false);

        if ("exit".equals(a) && (session != null))
            session.removeAttribute("answer");

        resp.sendRedirect("index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String qOne = req.getParameter("myanswer");

        String answer = null;
        if (qOne.equals("five")) {
            aOne.incrementAndGet();
            answer = "5";
        } else if (qOne.equals("four")) {
            aTwo.incrementAndGet();
            answer = "4";
        } else if (qOne.equals("internet") || qOne.equals("tv")) {
            if (qOne.equals("internet")) {
                aThre.incrementAndGet();
                answer = "internet";
            } else if (qOne.equals("tv")) {
                aFour.incrementAndGet();
                answer = "tv";
            }

        }
        HttpSession session = req.getSession(true);
        session.setAttribute("answer", answer);
        session.setAttribute("aOne", aOne.get());
        session.setAttribute("aTwo", aTwo.get());
        session.setAttribute("aThre", aThre.get());
        session.setAttribute("aFour", aFour.get());

        resp.sendRedirect("index.jsp");
    }
}