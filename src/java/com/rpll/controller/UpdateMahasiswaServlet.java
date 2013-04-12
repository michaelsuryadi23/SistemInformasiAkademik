/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rpll.controller;

import com.rpll.model.Lectures;
import com.rpll.model.Students;
import com.rpll.util.HibernateUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name = "UpdateMahasiswaServlet", urlPatterns = {"/UpdateMahasiswaServlet"})
public class UpdateMahasiswaServlet extends HttpServlet {

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
            int nim = Integer.parseInt(request.getParameter("nim"));
            String nama = request.getParameter("nama");
            String alamat = request.getParameter("alamat");
            int telp = Integer.parseInt(request.getParameter("telp"));
            String email = request.getParameter("email");
            int status = Integer.parseInt(request.getParameter("status"));
            int dosenwali = Integer.parseInt(request.getParameter("dosenwali"));
            
            Session sess = HibernateUtil.getSessionFactory().openSession();
            List<Lectures> listLecture = sess.createQuery("from Lectures where lectureId="+dosenwali).list();
            Lectures lecture = listLecture.get(0);
            
            
            
//            Students student = new Students(nim, lecture, nama, alamat, telp, email, status);
//            
//            Session sess2 = HibernateUtil.getSessionFactory().openSession();
//            sess2.beginTransaction();
//            sess2.update(student);
//            sess2.getTransaction().commit();
            
//            sess2.close();
            
            response.sendRedirect("content/mahasiswa/showmahasiswa.jsp");
            
            
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
