/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rpll.controller;

import com.rpll.model.Bobot;
import com.rpll.model.BobotId;
import com.rpll.model.Lectures;
import com.rpll.model.Matkul;
import com.rpll.model.Periods;
import com.rpll.util.HibernateUtil;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;

/**
 *
 * @author Michael
 */
@WebServlet(name = "BobotNilaiServlet", urlPatterns = {"/BobotNilaiServlet"})
public class BobotNilaiServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            int period = Integer.parseInt(request.getParameter("period"));
            int matkul = Integer.parseInt(request.getParameter("matkul"));
            int lecture = Integer.parseInt(request.getParameter("lecture"));
            
            Session sess = HibernateUtil.getSessionFactory().openSession();
            Periods per = (Periods) sess.createQuery("from Periods where periodYear="+period).list().get(0);
            Matkul mat = (Matkul) sess.createQuery("from Matkul where matkulId="+matkul).list().get(0);
            Lectures lec = (Lectures) sess.createQuery("from Lectures where lectureId="+lecture).list().get(0);
            
            double nilai1 = Double.parseDouble(request.getParameter("nilai1"))/100;
            double nilai2 = Double.parseDouble(request.getParameter("nilai2"))/100;
            double nilai3 = Double.parseDouble(request.getParameter("nilai3"))/100;
            double nilai4 = Double.parseDouble(request.getParameter("nilai4"))/100;
            double nilai5 = Double.parseDouble(request.getParameter("nilai5"))/100;
            double uas = Double.parseDouble(request.getParameter("uas"))/100;
            
            Bobot bobot = new Bobot();
            BobotId bobotId = new BobotId();
            bobotId.setPeriodId(period);
            bobotId.setLectureId(lecture);
            bobotId.setMatkulId(matkul);
            
            bobot.setLectures(lec);
            bobot.setPeriods(per);
            bobot.setId(bobotId);
            bobot.setMatkul(mat);
            
            bobot.setNilai1(nilai1);
            bobot.setNilai2(nilai2);
            bobot.setNilai3(nilai3);
            bobot.setNilai4(nilai4);
            bobot.setNilai5(nilai5);
            bobot.setUas(uas);
            
            sess.beginTransaction();
            sess.update(bobot);
            sess.getTransaction().commit();
            sess.close();
            
            response.sendRedirect("content/penilaian/view.jsp?mode=1&matkul="+matkul+"&stat=1");
            
            
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
