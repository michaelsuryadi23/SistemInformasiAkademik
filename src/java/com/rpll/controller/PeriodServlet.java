/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rpll.controller;

import com.rpll.model.Periods;
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
 * @author DONI
 */
@WebServlet(name = "PeriodServlet", urlPatterns = {"/PeriodServlet"})
public class PeriodServlet extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
                int periodYear = Integer.parseInt(request.getParameter("periodYear"));
                String periodDes = request.getParameter("periodDes");
                String strFrs = request.getParameter("strFrs");
                String strPrs = request.getParameter("strPrs");
                String strPay1 = request.getParameter("strPay1");
                String strPay2 = request.getParameter("strPay2");
                String finishFrs = request.getParameter("finishFrs");
                String finishPrs = request.getParameter("finishPrs");
                String finishPay1 = request.getParameter("finishPay1");
                String finishPay2 = request.getParameter("finishPay2");
                String strSmstr = request.getParameter("strSmstr");
                String finishSmstr = request.getParameter("finishSmstr");
                
                Periods period = new Periods();
                period.setPeriodYear(periodYear);
                period.setPeriodDescription(periodDes);
                               
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                
                Date convertedDate = sdf.parse(strFrs);
                period.setStartFrs(convertedDate);
                Date convertedDate2 = sdf.parse(strPrs);
                period.setStartPrs(convertedDate2);
                Date convertedDate3 = sdf.parse(strPay1);
                period.setStartPayment1(convertedDate3);
                Date convertedDate4 = sdf.parse(strPay2);
                period.setStartPayment2(convertedDate4);
                Date convertedDate5 = sdf.parse(finishFrs);
                period.setFinishFrs(convertedDate5);
                Date convertedDate6 = sdf.parse(finishPrs);
                period.setFinishPrs(convertedDate6);
                Date convertedDate7 = sdf.parse(finishPay1);
                period.setFinishPayment1(convertedDate7);
                Date convertedDate8 = sdf.parse(finishPay2);
                period.setFinishPayment2(convertedDate8);
                Date convertedDate9 = sdf.parse(strSmstr);
                period.setStartSemester(convertedDate9);
                Date convertedDate10 = sdf.parse(finishSmstr);
                period.setFinishSemester(convertedDate10);
                
                Session sess = HibernateUtil.getSessionFactory().openSession();
                if(mode==1){ //buat yg create
                    sess.beginTransaction();
                    sess.save(period);
                    sess.getTransaction().commit();
                    sess.close();
                }
                else { //buat yg update
                    sess.beginTransaction();
                    sess.update(period);
                    sess.getTransaction().commit();
                    sess.close();
                }
                response.sendRedirect("content/period/list.jsp");
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
