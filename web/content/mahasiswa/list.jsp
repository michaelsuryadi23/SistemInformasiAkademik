<%-- 
    Document   : home
    Created on : Apr 8, 2013, 2:17:15 PM
    Author     : Michael
--%>

<%@page import="com.rpll.model.StudentAngkatan"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.rpll.model.Department"%>
<%@page import="java.util.List"%>
<%@page import="com.rpll.model.Students"%>
<%@page import="com.rpll.util.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Mahasiswa - Sistem Informasi Akademik</title>
        <link rel="stylesheet" type="text/css" href="../../resources/style/home.css"/>
        <link rel="stylesheet" type="text/css" href="../../resources/style/mahasiswa.css"/>
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

            <h2 style="text-align: center; margin-left: 20px;">List Mahasiswa</h2>
            <jsp:include page="filter.jsp"/>
            <table style="margin-left:150px; width: 700px; margin-top: 20px; margin-bottom: 50px">
                <thead style="background-color: black; color: white;border: 1px dotted black">
                <th>NIM</th>
                <th>Nama</th>
                <th>Alamat</th>
                <th>Telp</th>
                <th>Jurusan</th>
                <th>Angkatan</th>
                <th>Opsi</th>
                </thead>
                <%
                    int noHlm;
                    Session sess = HibernateUtil.getSessionFactory().openSession();
                    List<StudentAngkatan> listStudents;
                    if (request.getParameter("page") == null) {
                        Query q = sess.createQuery("from StudentAngkatan");
                        q.setMaxResults(15);
                        listStudents = q.list();
                        noHlm = 1;
                    } else {
                        int hlm = Integer.parseInt(request.getParameter("page"));
                        int startId = ((hlm - 1) * 15) + 10000;
                        noHlm = hlm;
                        Query q = sess.createQuery("from StudentAngkatan where id.studentId>" + startId);
                        q.setMaxResults(15);
                        listStudents = q.list();
                    }
                    
                     if (request.getParameter("filter") != null) {
                        int filterBy = Integer.parseInt(request.getParameter("filter"));
                        String keyword = request.getParameter("keyword");

                        if (filterBy == 1) {
                            Session sess2 = HibernateUtil.getSessionFactory().openSession();
                            listStudents = sess2.createQuery("from StudentAngkatan where id.studentId=" + keyword).list();
                        }
                     }
                    
                    for (StudentAngkatan o : listStudents) {
                %>
                <tr>
                    <td style="border-bottom: 1px dotted black;"><%= o.getStudents().getStudentId() %></td>
                    <td style="border-bottom: 1px dotted black;"><%= o.getStudents().getStudentName() %></td>
                    <td style="border-bottom: 1px dotted black;"><%= o.getStudents().getStudentAddress() %></td>
                    <td style="border-bottom: 1px dotted black;"><%= o.getStudents().getStudentTelp()%></td>
                    <td style="border-bottom: 1px dotted black;"><%= o.getDepartment().getDepartmentName() %></td>
                    <td style="border-bottom: 1px dotted black;"><%= o.getAngkatan().getAngkatanDesc() %></td>
                    <td style="border-bottom: 1px dotted black;"><a href="update.jsp?nim=<%= o.getStudents().getStudentId()%>">Update</a></td>
                </tr>
                <%
                    }
                %>
            </table>
            <%
                if (request.getParameter("filterBy") == null) {
                    Session session3 = HibernateUtil.getSessionFactory().openSession();
                    List<StudentAngkatan> listData = session3.createQuery("from StudentAngkatan").list();
                    int totalData = listData.size();
                    String total = "Jumlah Data Sebanyak " + totalData;
            %>
            <p style="text-align: left; margin-left: 50px;"><b><%= total%></b></p>
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

        <jsp:include page="../footer.jsp"/>

    </body>
</html>
