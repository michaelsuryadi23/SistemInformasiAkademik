<%-- 
    Document   : home
    Created on : Apr 8, 2013, 2:17:15 PM
    Author     : Michael
--%>

<%@page import="org.hibernate.Query"%>
<%@page import="com.rpll.model.Staff"%>
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
        <link rel="stylesheet" type="text/css" href="../../resources/style/staff.css"/>
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
            


           
                <h2 style="text-align: center; margin-left: 20px;">View Data Staff</h2>
                <jsp:include page="filter.jsp" />
                <table style="margin-left: 150px; width: 700px; margin-top: 30px;">
                    <thead style="background-color: black; color: white;border: 1px dotted black">
                        <th>NIK</th>
                        <th>Nama</th>
                        <th>Alamat</th>
                        <th>Telp</th>
                        <th>Opsi</th>
                    </thead>
                <%
                    Session sess = HibernateUtil.getSessionFactory().openSession();
                    
                    
                    int noHlm;
                    List<Staff> listStaff;
                    Session sess2 = HibernateUtil.getSessionFactory().openSession();
                    if (request.getParameter("page") == null) {
                        Query q = sess2.createQuery("from Staff");
                        q.setMaxResults(15);
                        listStaff = q.list();
                        noHlm = 1;
                    } else {
                        int hlm = Integer.parseInt(request.getParameter("page"));
                        int startId = ((hlm - 1) * 15) + 2000;
                        noHlm = hlm;
                        Query q = sess2.createQuery("from Periods where periodYear>" + startId);
                        q.setMaxResults(15);
                        listStaff = q.list();
                    }


                    if (request.getParameter("filter") != null) {
                        int filterBy = Integer.parseInt(request.getParameter("filter"));
                        String keyword = request.getParameter("keyword");

                        if (filterBy == 1) {
                            Session sess3 = HibernateUtil.getSessionFactory().openSession();
                            listStaff = sess3.createQuery("from Staff where staffId=" + keyword).list();
                        } 
                            
                        
                    } else {
                        Session sess4 = HibernateUtil.getSessionFactory().openSession();
                        listStaff = sess.createQuery("from Staff").list();
                    }
                    
                    for(Staff o :listStaff){
                %>
                <tr>
                    <td style="border-bottom: 1px dotted black;"><%= o.getStaffId()%></td>
                    <td style="border-bottom: 1px dotted black;"><%= o.getStaffName() %></td>
                    <td style="border-bottom: 1px dotted black;"><%= o.getStaffAddress() %></td>
                    <td style="border-bottom: 1px dotted black;"><%= o.getStaffTelp() %></td>
                    <td style="border-bottom: 1px dotted black;"><a href="findstaff.jsp?nik=<%= o.getStaffId() %>">Update</a></td>
                </tr>
                <%
                    }
                %>
                </table>
                            <%
                if (request.getParameter("filterBy") == null) {
                    Session session3 = HibernateUtil.getSessionFactory().openSession();
                    List<Staff> listData = session3.createQuery("from Staff").list();
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

<jsp:include page="../footer.jsp"/>

    </body>
</html>
