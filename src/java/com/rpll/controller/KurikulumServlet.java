/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rpll.controller;

import com.rpll.model.Department;
import com.rpll.model.Matkul;
import com.rpll.model.MatkulDept;
import com.rpll.model.MatkulDeptId;
import com.rpll.model.MatkulMandatory;
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
@WebServlet(name = "KurikulumServlet", urlPatterns = {"/KurikulumServlet"})
public class KurikulumServlet extends HttpServlet {

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
            
           int matkulId = Integer.parseInt(request.getParameter("matkul"));
           int bobot = Integer.parseInt(request.getParameter("bobot"));
           int semester = Integer.parseInt(request.getParameter("semester"));
           int deptId = Integer.parseInt(request.getParameter("deptId"));
           int mandatory = Integer.parseInt(request.getParameter("jenisMK"));
           
            Session sess = HibernateUtil.getSessionFactory().openSession();
            Matkul matkul = (Matkul) sess.createQuery("from Matkul where matkulId="+matkulId).list().get(0);
            Department dept = (Department) sess.createQuery("from Department where departmentId="+deptId).list().get(0);
            MatkulMandatory man = (MatkulMandatory) sess.createQuery("from MatkulMandatory where mandatoryId="+mandatory).list().get(0);
            MatkulDeptId matId = new MatkulDeptId();
            matId.setMatkulId(matkulId);
            matId.setDepartmentId(deptId);
            
            MatkulDept kurikulum = new MatkulDept();
            kurikulum.setId(matId);
            kurikulum.setMatkul(matkul);
            kurikulum.setBobotSks(bobot);
            kurikulum.setMatkulSem(semester);
            kurikulum.setDepartment(dept);
            kurikulum.setMatkulMandatory(man);
            
            
            sess.beginTransaction();
            sess.save(kurikulum);
            sess.getTransaction().commit();
            sess.close();
            
            response.sendRedirect("content/kurikulum/view.jsp");
           
            
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
