<%-- 
    Document   : home
    Created on : Apr 8, 2013, 2:17:15 PM
    Author     : Michael
--%>

<%@page import="com.rpll.model.MatkulDept"%>
<%@page import="java.util.List"%>
<%@page import="com.rpll.model.TakeMatkulPeriod"%>
<%@page import="com.rpll.model.StudentAngkatan"%>
<%@page import="com.rpll.model.Students"%>
<%@page import="com.rpll.model.Periods"%>
<%@page import="com.rpll.util.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Kartu Rencana Studi - Sistem Informasi Akademik</title>
        <link rel="stylesheet" type="text/css" href="../../resources/style/home.css"/>
        <link rel="stylesheet" type="text/css" href="../../resources/style/home2.css"/>
        <link rel="stylesheet" type="text/css" href="../../resources/style/fixedMenu_style2.css"/>

        <script src="../../resources/js/jquery-1.7.2.min.js"></script>
        <script src="../../resources/js/jquery.fixedMenu.js"></script>
        <script>
            $('document').ready(function() {
                $('.menu').fixedMenu();
            });
        </script>
    </head>

   <body>
        <jsp:include page="../header.jsp"/>
        
        <div id="content">
            <jsp:include page="../sidemenu.jsp" />
            
            <%
                Session sess=HibernateUtil.getSessionFactory().openSession();
                int period2 = Integer.parseInt(request.getParameter("period"));
                int studentId = Integer.parseInt(request.getParameter("nim"));
                int deptId = Integer.parseInt(request.getParameter("dept"));
                
                Periods period = (Periods) sess.createQuery("from Periods where periodYear="+period2).list().get(0);
                Students student = (Students) sess.createQuery("from Students where studentId="+studentId).list().get(0);
                StudentAngkatan stu = (StudentAngkatan) sess.createQuery("from StudentAngkatan where id.studentId="+student.getStudentId()).list().get(0);
                List<TakeMatkulPeriod> take = sess.createQuery("from TakeMatkulPeriod where id.studentId="+studentId+" and id.periodId="+period2).list();
                int i=1;
                %>
            <h2 style="text-align: center; margin-left: 20px;">View dan Cetak KRS</h2>
            <p>NIM : <%= student.getStudentId()%>
            <br/>Nama : <%= student.getStudentName() %>
            <br/> Jurusan : <%= stu.getDepartment().getDepartmentName() %>
            <br/>Periode : <%= period.getYear() %>- <%= period.getPeriodDescription() %></p>
            
            <table style="margin-left: 200px; width: 600px;">
                <thead style="background-color: black; color: white;">
                <th>No</th>
                <th>Matkul ID</th>
                <th>Matkul Name</th>
                <th>Matkul Semester</th>
                <th>Bobot SKS</th>
                </thead>
                
                <%
                    for(TakeMatkulPeriod t : take) {
                        MatkulDept m = (MatkulDept)sess.createQuery("from MatkulDept where id.matkulId="+t.getMatkul().getMatkulId()).list().get(0);
                        %>
                        <tr>
                            <td><%= i %></td>
                            <td><%= t.getMatkul().getMatkulId() %></td>
                            <td><%= t.getMatkul().getMatkulName() %></td>
                            <td><%= m.getMatkulSem() %></td>
                            <td><%= m.getBobotSks() %></td>
                        </tr>
                        
                        <%
                    }
                    %>
                
            </table>
        </div>

        <div id="footer" style="background-color: black; height: 70px; width: 1000px; margin: auto; text-align: center;">
            <p style=" color: white; padding-top: 20px;">Copyright 2013 RPLL Kelompok 3</p>
        </div>

    </body>
</html>
