/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rpll.controller;

import com.rpll.model.Matkul;
import com.rpll.model.TakeMatkulPeriod;
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
@WebServlet(name = "deleteKrsServlet", urlPatterns = {"/deleteKrsServlet"})
public class deleteKrsServlet extends HttpServlet {

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
        Session sess = HibernateUtil.getSessionFactory().openSession();
        try {
            int studentId = Integer.parseInt(request.getParameter("studentId"));
            int periodId = Integer.parseInt(request.getParameter("period"));
            int matkulId = Integer.parseInt(request.getParameter("matkul"));
            int deptId = Integer.parseInt(request.getParameter("deptId"));
            TakeMatkulPeriod take = (TakeMatkulPeriod) sess.createQuery("from TakeMatkulPeriod where id.periodId="+periodId+" and id.matkulId="+matkulId+" and id.studentId="+studentId).list().get(0);
            
            sess.beginTransaction();
            sess.delete(take);
            sess.getTransaction().commit();
            sess.close();
            
            response.sendRedirect("content/krs/view.jsp?period="+periodId+"&nim="+studentId+"&dept="+deptId);
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
