<%-- 
    Document   : view
    Created on : Apr 15, 2013, 6:49:04 PM
    Author     : Acer
--%>

<%@page import="com.rpll.model.TakeMatkulPeriod"%>
<%@page import="com.rpll.model.TeachPeriod"%>
<%@page import="com.rpll.model.Periods"%>
<%@page import="com.rpll.model.Staff"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.rpll.util.HibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home - Sistem Informasi Akademik</title>
        <link rel="stylesheet" type="text/css" href="../../resources/style/home.css"/>
        <link rel="stylesheet" type="text/css" href="../../resources/style/viewstaff.css"/>
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
        <jsp:include page="privilage.jsp"/>
        <jsp:include page="../header.jsp"/>
        <div id="content">
            <%-- <jsp:include page="../sidemenu.jsp" /> Blom ada buat Dosen --%>
            <div id="content-left">
            </div>

            <div id="content-mid">
                <h2 style="text-align: center; margin-left: 20px;">CEF Matakuliah</h2>
                <%
                    Session sess = HibernateUtil.getSessionFactory().openSession();
                    int idMatkul = Integer.parseInt(request.getParameter("matkul").toString());
                    List<TakeMatkulPeriod> listCEF = sess.createQuery("from TakeMatkulPeriod where matkul.matkulId= " + idMatkul).list();
                %>
                <h4><%= listCEF.get(0).getMatkul().getMatkulName() %></h4>
                <table style="margin-left: 70px; " border="1">
                    <th>NIM</th>
                    <th>Saran</th>
                    <%
                        for (TakeMatkulPeriod t : listCEF) {

                    %>
                    <tr>
                        <td><%= t.getStudents().getStudentId() %></td>
                        <td><%= t.getMatkulCef() %></td>
                    </tr>
                    <%  }
                    %>
                    <tr></tr>
                </table>
                    <form action="viewdosen.jsp" method="get">
                        <input type="hidden" name="period" value="<%= listCEF.get(0).getPeriods().getPeriodYear() %>"/>
                        <input type="submit" value="Back"/>
                    </form>
            </div>

            <div id="content-right">

            </div>
        </div>

        <div id="footer" style="background-color: black; height: 70px; width: 1000px; margin: auto; text-align: center;">

        </div>

    </body>
</html>