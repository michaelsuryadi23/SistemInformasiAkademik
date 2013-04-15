/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rpll.controller;

import com.rpll.model.Announcements;
import com.rpll.model.Department;
import com.rpll.model.Staff;
import com.rpll.util.HibernateUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
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
 * @author Beatrix
 */
@WebServlet(name = "Pengumuman", urlPatterns = {"/Pengumuman"})
public class PengumumanServlet extends HttpServlet {

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
            int mode = Integer.parseInt(request.getParameter("mode"));
            
            if(mode==1){
                
                String datePost = request.getParameter("datePost");
                String content = request.getParameter("content");
                int department = Integer.parseInt(request.getParameter("department"));
                int staff = Integer.parseInt(request.getSession().getAttribute("username").toString());
                Session sess = HibernateUtil.getSessionFactory().openSession();
                List<Department> listDept = sess.createQuery("from Department where departmentId="+department).list();
                Department dept = listDept.get(0);
                Announcements ann = new Announcements();
                ann.setAnnId(0);
                
                List<Staff> listStaff = sess.createQuery("from Staff where staffId="+staff).list();
                
                
                ann.setContent(content);
                ann.setDepartment(dept);
                ann.setStaff(listStaff.get(0));
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                
                Date convertedDate = sdf.parse(datePost);
                ann.setDatePost(convertedDate);
                
                Session sess2 = HibernateUtil.getSessionFactory().openSession();
                if(mode==1){ //buat yg create
                    sess2.beginTransaction();
                    sess2.save(ann);
                    sess2.getTransaction().commit();
                    sess2.close();
                }
                else { //buat yg update
                    sess2.beginTransaction();
                    sess2.update(ann);
                    sess2.getTransaction().commit();
                    sess2.close();
                }
                response.sendRedirect("content/pengumuman/list.jsp");
            }
            
        } catch (ParseException ex) {
            Logger.getLogger(PengumumanServlet.class.getName()).log(Level.SEVERE, null, ex);
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
