<%-- 
    Document   : view
    Created on : Apr 15, 2013, 11:06:24 AM
    Author     : Acer
--%>
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
        <jsp:include page="../header.jsp"/>
        <div id="content">
            <jsp:include page="../sidemenu.jsp" />
            <div id="content-left">
            </div>

            <div id="content-mid">
                <h2 style="text-align: center; margin-left: 20px;">Matakuliah yang di ajar</h2>
                <form action="viewdosen.jsp" method="get">Period
                    <%
                        Session ses = HibernateUtil.getSessionFactory().openSession();
                        int nik = 1112001;//Integer.parseInt(session.getAttribute("username").toString());
                        List<Periods> listPeriod = ses.createQuery("from Periods").list();
                    %>
                    <select  name="period" >
                        <% for (Periods p : listPeriod) {
                        %>
                        <option value="<%= p.getPeriodYear()%>">
                            <%
                            if(p.getPeriodYear()%10==1){
                                out.print(p.getPeriodYear()/10+"-Ganjil");
                            }else{
                                out.print(p.getPeriodYear()/10+"-Genap");
                            }
                            %>
                        </option>
                        <% }
                        %>
                    </select>
                    <input type="submit" value="Pilih"/>
                    <%
                        if (request.getParameter("period") != null) {
                    %>
                    <table style="margin-left: 70px; width: 500px;" border="1">
                        <th>Matakuliah</th>
                        <th> </th>
                        <%
                            int period = Integer.parseInt(request.getParameter("period"));
                            List<TeachPeriod> listTeach = ses.createQuery("from TeachPeriod where lectures.lectureId = " + nik + " and periods.periodYear= " + period).list();
                            for (TeachPeriod t : listTeach) {
                        %>
                        <tr>
                            <td><%= t.getMatkul().getMatkulName()%></td>
                            <td><a href="view.jsp?matkul=<%= t.getMatkul().getMatkulId()%>&&nmatkul=<%= t.getMatkul().getMatkulName()%>"/>View</td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                    <%
                        }
                    %>
                </form>
            </div>

            <div id="content-right">

            </div>
        </div>

        <div id="footer" style="background-color: black; height: 70px; width: 1000px; margin: auto; text-align: center;">

        </div>

    </body>
</html>
