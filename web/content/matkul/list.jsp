<%-- 
    Document   : home
    Created on : Apr 8, 2013, 2:17:15 PM
    Author     : Michael
--%>

<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.rpll.util.HibernateUtil"%>
<%@page import="com.rpll.model.Matkul"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Mata Kuliah - Sistem Informasi Akademik</title>
        <link rel="stylesheet" type="text/css" href="../../resources/style/home.css"/>
        <link rel="stylesheet" type="text/css" href="../../resources/style/home2.css"/>
        <link rel="stylesheet" type="text/css" href="../../resources/style/matkul.css"/>
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
            <h2 style="text-align: center; margin-left: 20px;">List Mata Kuliah</h2>
            <jsp:include page="filter.jsp" />
            <jsp:include page="privilage.jsp" />

            <table style="margin-left: 50px; width: 900px; margin-top: 10px;">
                <thead style="background-color: black; color: white;border: 1px dotted black">
                <th>Matkul ID</th>
                <th>Matkul Name</th>
                <th>Matkul Type</th>
                <th>Opsi</th>
                </thead>
                <%
                    int noHlm;
                    List<Matkul> listMatkul;
                    Session sess2 = HibernateUtil.getSessionFactory().openSession();
                    if (request.getParameter("page") == null) {
                        Query q = sess2.createQuery("from Matkul");
                        q.setMaxResults(15);
                        listMatkul = q.list();
                        noHlm = 1;
                    } else {
                        int hlm = Integer.parseInt(request.getParameter("page"));
                        int startId = ((hlm - 1) * 15) + 10000;
                        noHlm = hlm;
                        Query q = sess2.createQuery("from Matkul where matkulId>" + startId);
                        q.setMaxResults(15);
                        listMatkul = q.list();
                    }


                    if (request.getParameter("filter") != null) {
                        int filterBy = Integer.parseInt(request.getParameter("filter"));
                        String keyword = request.getParameter("keyword");

                        if (filterBy == 1) {
                            Session sess = HibernateUtil.getSessionFactory().openSession();
                            listMatkul = sess.createQuery("from Matkul where matkulId=" + keyword).list();
                        } else if (filterBy == 2) {
                                Session sess = HibernateUtil.getSessionFactory().openSession();
                                listMatkul = sess.createQuery("from Matkul where matkulName="+ keyword).list();
                           //     listMatkul = sess.createQuery("from Matkul where department.departmentId='" + keyword + "'").list();
                            } else{
                                Session sess = HibernateUtil.getSessionFactory().openSession();
                                listMatkul = sess.createQuery("from Matkul where matkulType.matkulType='" + keyword + "'").list();
                        }
                    } else {
                        Session sess = HibernateUtil.getSessionFactory().openSession();
                        listMatkul = sess.createQuery("from Matkul").list();
                    }
                    for (Matkul o : listMatkul) {
                %>
                <tr>
                    <td style="border-bottom: 1px dotted black;"><%= o.getMatkulId() %></td>
                    <td style="border-bottom: 1px dotted black;"><%= o.getMatkulName() %> </td>
                    <td style="border-bottom: 1px dotted black;"><%= o.getMatkulType().getTypeName() %></td>
                    
                    <td style="border-bottom: 1px dotted black;"><a href="update.jsp?univId=<%= o.getMatkulId() %>">Update</a></td>
                </tr>
                <%
                    }
                %>
            </table>
            <%
                if (request.getParameter("filterBy") == null) {
                    Session session3 = HibernateUtil.getSessionFactory().openSession();
                    List<Matkul> listData = session3.createQuery("from Matkul").list();
                    int totalData = listData.size();
                    String total = "Jumlah Data Sebanyak " + totalData;
            %>
            <p style="text-align: left; margin-left: 50px;"><b><%= total %></b></p>
            <% %>
            <p style="text-align: left; margin-left: 50px;">Page : </p>
            <%
                    int jmlHlm = totalData / 20;
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
