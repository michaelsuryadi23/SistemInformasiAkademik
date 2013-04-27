<%-- 
    Document   : home
    Created on : Apr 8, 2013, 2:17:15 PM
    Author     : Michael
--%>

<%@page import="com.rpll.model.Periods"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.rpll.util.HibernateUtil"%>
<%@page import="com.rpll.model.University"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Badan Hukum - Sistem Informasi Akademik</title>
        <link rel="stylesheet" type="text/css" href="../../resources/style/home.css"/>
        <link rel="stylesheet" type="text/css" href="../../resources/style/home2.css"/>
        <link rel="stylesheet" type="text/css" href="../../resources/style/style.css"/>
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
            <h2 style="text-align: center; margin-left: 20px;">List Period</h2>
            <jsp:include page="filter.jsp" />
            <jsp:include page="privilage.jsp" />

            <table style="margin-top: 20px; margin-bottom: 100px;">
                <thead style="background-color: black; color: white;border: 1px dotted black">
                <th>Period Year</th>
                <th>Period Description</th>
                <th>Start FRS</th>
                <th>Start PRS</th>
                <th>Start Payment 1</th>
                <th>Start Payment 2</th>
                <th>Finish FRS</th>
                <th>Finish PRS</th>
                <th>Finish Payment 1</th>
                <th>Finish Payment 2</th>
                <th>Start Semester</th>
                <th>Finish Semester</th>
                <th>Opsi</th>
                </thead>
                <%
                    int noHlm;
                    List<Periods> listPeriod;
                    Session sess2 = HibernateUtil.getSessionFactory().openSession();
                    if (request.getParameter("page") == null) {
                        Query q = sess2.createQuery("from Periods");
                        q.setMaxResults(15);
                        listPeriod = q.list();
                        noHlm = 1;
                    } else {
                        int hlm = Integer.parseInt(request.getParameter("page"));
                        int startId = ((hlm - 1) * 15) + 2000;
                        noHlm = hlm;
                        Query q = sess2.createQuery("from Periods where periodYear>" + startId);
                        q.setMaxResults(15);
                        listPeriod = q.list();
                    }


                    if (request.getParameter("filter") != null) {
                        int filterBy = Integer.parseInt(request.getParameter("filter"));
                        String keyword = request.getParameter("keyword");

                        if (filterBy == 1) {
                            Session sess = HibernateUtil.getSessionFactory().openSession();
                            listPeriod = sess.createQuery("from Periods where year=" + keyword).list();
                        } 
                            
                        
                    } else {
                        Session sess = HibernateUtil.getSessionFactory().openSession();
                        listPeriod = sess.createQuery("from Periods").list();
                    }
                    for (Periods o : listPeriod) {
                %>
                <tr>
                    <td style="border-bottom: 1px dotted black;"><%= o.getYear()%></td>
                    <td style="border-bottom: 1px dotted black;"><%= o.getPeriodDescription() %></td>
                    <td style="border-bottom: 1px dotted black;"><%= o.getStartFrs().toString() %></td>
                    <td style="border-bottom: 1px dotted black;"><%= o.getStartPrs().toString() %></td>
                    <td style="border-bottom: 1px dotted black;"><%= o.getStartPayment1().toString() %></td>
                    <td style="border-bottom: 1px dotted black;"><%= o.getStartPayment2().toString() %></td>
                    <td style="border-bottom: 1px dotted black;"><%= o.getFinishFrs().toString() %></td>
                    <td style="border-bottom: 1px dotted black;"><%= o.getFinishPrs().toString() %></td>
                    <td style="border-bottom: 1px dotted black;"><%= o.getFinishPayment1().toString() %></td>
                    <td style="border-bottom: 1px dotted black;"><%= o.getFinishPayment2().toString() %></td>
                    <td style="border-bottom: 1px dotted black;"><%= o.getStartSemester().toString() %></td>
                    <td style="border-bottom: 1px dotted black;"><%= o.getFinishSemester().toString() %></td>
                    <td style="border-bottom: 1px dotted black;"><a href="update.jsp?period=<%= o.getPeriodYear() %>">Update</a></td>
                </tr>
                <%
                    }
                %>
            </table>
            <%
                if (request.getParameter("filterBy") == null) {
                    Session session3 = HibernateUtil.getSessionFactory().openSession();
                    List<Periods> listData = session3.createQuery("from Periods").list();
                    int totalData = listData.size();
                    String total = "Jumlah Data Sebanyak " + totalData;
            %>
            <p style="text-align: left; margin-left: 50px;"><b><%= total %></b></p>
            <% %>
            <p style="text-align: left; margin-left: 50px;">Page : </p>
            <%
                    int jmlHlm = totalData / 15;
                    for (int i = 1; i <= (jmlHlm + 1); i++) {
                        if (i == noHlm) {
                            out.println("<p style='text-align:left;margin-left: 50px;'><b>" + i + "| </b></p>");
                        } else {
                            out.println("<b><a href='list.jsp?page=" + i + "'>" + i + "| </a></b>");
                        }
                    }
                }

            %>
        </div>

        <div id="footer" style="background-color: black; height: 70px; width: 1000px; margin: auto; text-align: center;">
            <p style=" color: white; padding-top: 20px;">Copyright 2013 RPLL Kelompok 3</p>
        </div>

    </body>
</html>
