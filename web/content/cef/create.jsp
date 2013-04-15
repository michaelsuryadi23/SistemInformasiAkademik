<%-- 
    Document   : create
    Created on : Apr 15, 2013, 11:05:24 AM
    Author     : Acer
--%>

<%@page import="com.rpll.model.Periods"%>
<%@page import="javax.persistence.criteria.CriteriaBuilder.In"%>
<%@page import="com.rpll.model.TakeMatkulPeriod"%>
<%@page import="java.util.List"%>
<%@page import="com.rpll.util.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home - Sistem Informasi Akademik</title>
        <link rel="stylesheet" type="text/css" href="../../resources/style/home.css"/>
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
            <jsp:include page="../sidemenu.jsp" />
            <div id="content-left">
            </div>

            <div id="content-mid">
                <h2 style="text-align: center; margin-left: 20px;">CEF</h2>
                <form action="create.jsp" method="get">Period
                    <%
                        Session ses = HibernateUtil.getSessionFactory().openSession();
                        int nim = Integer.parseInt(session.getAttribute("username").toString());
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
                    <table style="margin-left: 70px; " border="1">
                        <th>Matakuliah</th>
                        <th>Saran</th>
                        <th> </th>
                        <%
                            int period = Integer.parseInt(request.getParameter("period"));
                            List<TakeMatkulPeriod> listMatkul = ses.createQuery("from TakeMatkulPeriod where students.studentId = " + nim + " and periods.periodYear= " + period).list();
                            for (TakeMatkulPeriod t : listMatkul) {
                        %>
                        <tr>
                            <td><%= t.getMatkul().getMatkulName()%></td>
                            <td><%= t.getMatkulCef()%></td>
                            <td><a href="update.jsp?matkul=<%= t.getMatkul().getMatkulId()%>&&nmatkul=<%= t.getMatkul().getMatkulName()%>"/>Update</td>
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
