/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rpll.controller;

import com.rpll.model.Department;
import com.rpll.model.Matkul;
import com.rpll.model.Periods;
import com.rpll.model.Students;
import com.rpll.model.TakeMatkulPeriod;
import com.rpll.model.TakeMatkulPeriodId;
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
@WebServlet(name = "KrsServlet", urlPatterns = {"/KrsServlet"})
public class KrsServlet extends HttpServlet {

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
            out.println(counter);
            Session sess = HibernateUtil.getSessionFactory().openSession();
            int studentId = Integer.parseInt(request.getParameter("studentId"));
            int periodId = Integer.parseInt(request.getParameter("period"));
            int deptId = Integer.parseInt(request.getParameter("deptId"));
            for (int i = 0; i < counter; i++) {
                int matkulId = Integer.parseInt(request.getParameter("idMatkul" + i));
                if (request.getParameter("cek"+i)!=null) {
                    System.out.println("msk");
                    Matkul matkul = (Matkul) sess.createQuery("from Matkul where matkulId=" + matkulId).list().get(0);
                    Students student = (Students) sess.createQuery("from Students where studentId=" + studentId).list().get(0);
                    Periods period = (Periods) sess.createQuery("from Periods where periodYear=" + periodId).list().get(0);
                    Department dept = (Department) sess.createQuery("from Department where departmentId=" + deptId).list().get(0);

                    TakeMatkulPeriodId id = new TakeMatkulPeriodId();
                    id.setMatkulId(matkulId);
                    id.setPeriodId(periodId);
                    id.setStudentId(studentId);

                    TakeMatkulPeriod take = new TakeMatkulPeriod();
                    take.setId(id);
                    take.setMatkul(matkul);
                    take.setStudents(student);
                    take.setMatkulCef("");
                    take.setPeriods(period);

                    sess.beginTransaction();
                    sess.save(take);
                    sess.getTransaction().commit();
                    System.out.println("sss");
                }
            }
            response.sendRedirect("content/krs/view.jsp?period=" + periodId + "&nim=" + studentId + "&dept=" + deptId);

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
