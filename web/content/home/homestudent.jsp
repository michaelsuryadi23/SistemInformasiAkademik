<%-- 
    Document   : home
    Created on : Apr 8, 2013, 2:17:15 PM
    Author     : Michael
--%>

<%@page import="com.rpll.model.Students"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.rpll.util.HibernateUtil"%>
<%@page import="com.rpll.util.HibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home - Sistem Informasi Akademik</title>
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
            <h2 style="text-align: center; margin-left: 20px;">Selamat Datang di Layanan Mahasiswa</h2>
            <div id="content-left" style="text-align: left">
                <h4 style="margin-left: 30px">Layanan untuk Student antara lain :</h4>
                <ul>View Pengumuman</ul>
                <ul>View Laporan Akademik (KRS, KHS, Transkrip)</ul>
                <ul>Mengisi CEF, Kotak Saran</ul>
            </div>

            <div id="content-right" style="text-align: left">
                <%
                    int staffID = Integer.parseInt(session.getAttribute("username").toString());
                    Session sesStaff = HibernateUtil.getSessionFactory().openSession();
                    List<Students> listStudents = sesStaff.createQuery("from Students where studentId=" + staffID + "").list();
                    Students student = listStudents.get(0);
                %>
                <h4 style="margin-left: 130px;">Your Account</h4>
                <pre>
                <img src="../../resources/img/people.jpg" style="width: 100px; height: 80px;"/>
                NIK     : <%= student.getStudentId()%>
                Nama    : <%= student.getStudentName()%>
                Email   : <%= student.getStudentEmail()%>
                </pre>
            </div>
        </div>

        <div id="footer" style="background-color: black; height: 70px; width: 1000px; margin: auto; text-align: center;">
            <p style=" color: white; padding-top: 20px;">Copyright 2013 RPLL Kelompok 3</p>
        </div>

    </body>
</html>
