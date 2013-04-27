/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rpll.controller;

import com.rpll.model.University;
import com.rpll.util.HibernateUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "EditBadanHukumServlet", urlPatterns = {"/BadanHukumServlet"})
public class BadanHukumServlet extends HttpServlet {

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
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            int mode = Integer.parseInt(request.getParameter("mode"));
            
            if(mode==1 || mode==2){
                String univName = request.getParameter("univName");
                String univAddress = request.getParameter("univAddress");
                String univTelp = request.getParameter("univTelp");
                String univEmail = request.getParameter("univEmail");
                String univHomepage = request.getParameter("univHomepage");
                int noAkreditasi = Integer.parseInt(request.getParameter("univNoAkreditasi"));
                String akreditasi = request.getParameter("univAkreditasi");
                String foundDate = request.getParameter("univFound");
                String rector = request.getParameter("univRector");
                
                University univ = new University();
                univ.setUnivName(univName);
                univ.setUnivAddress(univAddress);
                univ.setUnivTelp(univTelp);
                univ.setUnivEmail(univEmail);
                univ.setUnivHomepage(univHomepage);
                univ.setNoAkreditasi(noAkreditasi);
                univ.setAkreditasi(akreditasi);
                
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                
                Date convertedDate = sdf.parse(foundDate);
                univ.setFoundDate(convertedDate);
                univ.setRector(rector);
                
                Session sess = HibernateUtil.getSessionFactory().openSession();
                if(mode==1){ //buat yg create
                    sess.beginTransaction();
                    sess.save(univ);
                    sess.getTransaction().commit();
                    sess.close();
                }
                else { //buat yg update
                    int univId = Integer.parseInt(request.getParameter("univId"));
                    univ.setUnivId(univId);
                    sess.beginTransaction();
                    sess.update(univ);
                    sess.getTransaction().commit();
                    sess.close();
                }
                response.sendRedirect("content/badanhukum/list.jsp");
            }
            
           
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(BadanHukumServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(BadanHukumServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
