<%-- 
    Document   : home
    Created on : Apr 8, 2013, 2:17:15 PM
    Author     : Michael
--%>

<%@page import="com.rpll.model.TeachPeriod"%>
<%@page import="com.rpll.model.MatkulDept"%>
<%@page import="com.rpll.model.MatkulMandatory"%>
<%@page import="com.rpll.model.Matkul"%>
<%@page import="com.rpll.model.Department"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>
<%@page import="com.rpll.model.Marks"%>
<%@page import="com.rpll.util.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Bobot Penilaian - Sistem Informasi Akademik</title>
        <link rel="stylesheet" type="text/css" href="../../resources/style/home.css"/>
        <link rel="stylesheet" type="text/css" href="../../resources/style/home2.css"/>
        <link rel="stylesheet" type="text/css" href="../../resources/style/kurikulum.css"/>
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
        <jsp:include page="privilage.jsp"/>


        <div id="content">
            <jsp:include page="../sidemenu.jsp" />
            <h2 style="text-align: center; margin-left: 20px;">Edit Bobot Penilaian</h2>
            <div id="insertDiv">
                <form action="../../KurikulumServlet" method="get">
                    <fieldset>
                        <% 
                            int id = Integer.parseInt(session.getAttribute("username").toString());
                            Session sess = HibernateUtil.getSessionFactory().openSession();
                            List<TeachPeriod> listTeach = sess.createQuery("from TeachPeriod where id.lectureId="+id).list();
                        %>
                        Pilih Matakuliah :
                        
                    </fieldset>
                </form>
                        <h3 style="text-align: center; margin-left: 20px;">List Matkul Departement</h3>
                        
                        
            </div>



        </div>

        <div id="footer" style="background-color: black; height: 70px; width: 1000px; margin: auto; text-align: center;">
            <p style=" color: white; padding-top: 20px;">Copyright 2013 RPLL Kelompok 3</p>
        </div>

    </body>
</html>
