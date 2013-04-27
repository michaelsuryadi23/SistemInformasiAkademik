/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rpll.controller;

import com.rpll.model.Marks;
import com.rpll.model.MarksId;
import com.rpll.model.Matkul;
import com.rpll.model.Periods;
import com.rpll.model.Students;
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
@WebServlet(name = "PenilaianServlet", urlPatterns = {"/PenilaianServlet"})
public class PenilaianServlet extends HttpServlet {

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
            int counter = Integer.parseInt(request.getParameter("counter"));
            Session sess = HibernateUtil.getSessionFactory().openSession();
            
                int matkulId = Integer.parseInt(request.getParameter("matkul"));
            for(int i = 1; i <counter; i++) {
                int studentId = Integer.parseInt(request.getParameter("idstu-"+i));
                int periodId = Integer.parseInt(request.getParameter("period"));
                
                double nilai1 = Double.parseDouble(request.getParameter("nilai1-"+i));
                double nilai2 = Double.parseDouble(request.getParameter("nilai2-"+i));
                double nilai3 = Double.parseDouble(request.getParameter("nilai3-"+i));
                double nilai4 = Double.parseDouble(request.getParameter("nilai4-"+i));
                double nilai5 = Double.parseDouble(request.getParameter("nilai5-"+i));
                double uas = Double.parseDouble(request.getParameter("uas-"+i));
                
                Matkul matkul = (Matkul) sess.createQuery("From Matkul where matkulId="+matkulId).list().get(0);
                Students stu = (Students) sess.createQuery("From Students where studentId="+studentId).list().get(0);
                Periods per = (Periods) sess.createQuery("from Periods where periodYear="+periodId).list().get(0);
                
                Marks mark = new Marks();
                MarksId markId = new MarksId();
                markId.setMatkulId(matkulId);
                markId.setStudentId(studentId);
                markId.setPeriodId(periodId);
                
                mark.setId(markId);
                mark.setMatkul(matkul);
                mark.setStudents(stu);
                mark.setNilai1(nilai1);
                mark.setNilai2(nilai2);
                mark.setNilai3(nilai3);
                mark.setNilai4(nilai4);
                mark.setNilai5(nilai5);
                mark.setUas(uas);
                
                sess.beginTransaction();
                sess.update(mark);
                sess.getTransaction().commit();
                
                
                
                
            }
            response.sendRedirect("content/penilaian/view.jsp?mode=1&matkul="+matkulId+"&stat=1");
            
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
