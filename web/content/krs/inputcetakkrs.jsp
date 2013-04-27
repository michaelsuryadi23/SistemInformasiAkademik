<%-- 
    Document   : home
    Created on : Apr 8, 2013, 2:17:15 PM
    Author     : Michael
--%>

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
                Periods period = (Periods) sess.createQuery("from Periods where status=1").list().get(0);
                Students student = (Students) sess.createQuery("from Students where studentId="+session.getAttribute("username")).list().get(0);
                StudentAngkatan stu = (StudentAngkatan) sess.createQuery("from StudentAngkatan where id.studentId="+student.getStudentId()).list().get(0);
                
                %>
            <h2 style="text-align: center; margin-left: 20px;">View dan Cetak KRS</h2>
            <form method="get" action="cetakkrs.jsp">
            <table style="margin-left: 350px;">
                <input type="hidden" name="period" value="<%= period.getPeriodYear() %>"/>
                <input type="hidden" name="nim" value="<%= student.getStudentId() %>"/>
                <input type="hidden" name="dept" value="<%= stu.getDepartment().getDepartmentId() %>"/>
                
                <tr>
                    <td>Nama : </td>
                    <td><input type="text" style="width: 200px;" disabled="disabled" value="<%= student.getStudentName() %>"</td>
                </tr>
                <tr>
                    <td>Jurusan : </td>
                    <td><input type="text" style="width: 200px;" disabled="disabled" value="<%= stu.getDepartment().getDepartmentName() %>"</td>
                </tr>
                <tr>
                    <td>Periode : </td>
                    <td><input type="text" style="width: 200px;" disabled="disabled" value="<%= period.getYear() %>-<%= period.getPeriodDescription() %>"</td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Proses" /></td>
                </tr>
            </table>
            </form>
        </div>

        <div id="footer" style="background-color: black; height: 70px; width: 1000px; margin: auto; text-align: center;">
            <p style=" color: white; padding-top: 20px;">Copyright 2013 RPLL Kelompok 3</p>
        </div>

    </body>
</html>
