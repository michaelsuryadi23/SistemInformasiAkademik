<%-- 
    Document   : home
    Created on : Apr 8, 2013, 2:17:15 PM
    Author     : Michael
--%>

<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>
<%@page import="com.rpll.model.Marks"%>
<%@page import="com.rpll.util.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
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
        <jsp:include page="privilage.jsp"/>


        <div id="content">
            <jsp:include page="../sidemenu.jsp" />
            <h2 style="text-align: center; margin-left: 20px;">View Kartu Hasil Studi</h2>
            <%
                int nim = Integer.parseInt(session.getAttribute("username").toString());
                Session sess = HibernateUtil.getSessionFactory().openSession();
                Query q = sess.createQuery("from Marks where id.studentId=" + nim);
                q.setMaxResults(1);
                List<Marks> marks = q.list();

                Marks mark = marks.get(0);
            %>
            <form action="viewkhs.jsp?show=true" method="post" style="margin-left: 350px;">
                <table>
                    <tr>
                        <td>NIM : </td>
                        <td><input type="text" disabled="disabled" value="<%= mark.getStudents().getStudentId()%>"/></td>
                    </tr>
                    <tr>
                        <td>Nama : </td>
                        <td><input type="text" disabled="disabled" value="<%= mark.getStudents().getStudentName()%> "/></td>
                    </tr>
                    <tr>
                        <td>Pilih Period :</td>
                        <td>
                            <select name="period">
                                <option value="0">--Pilih--</option>
                                <% for (Marks mrk : marks) {
                                %>
                                <option value="<%= mrk.getPeriods().getPeriodYear()%>">
                                    <%
                                      int per = mrk.getPeriods().getPeriodYear() % 10;

                                      if (per == 0) {
                                          out.print((mrk.getPeriods().getPeriodYear() - 1) / 10 + " - Ganjil ");
                                      } else {
                                          out.print((mrk.getPeriods().getPeriodYear()) / 10 + " - Genap");
                                      }%></option>
                                    <%

                                        }
                                    %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Proses"/></td>
                    </tr>
                </table>
            </form>
            <%
                  if(request.getParameter("show")!=null) {
                      int period = Integer.parseInt(request.getParameter("period"));
                      
                      Session sess2 = HibernateUtil.getSessionFactory().openSession();
                      List<Marks> marks2 = sess2.createQuery("from Marks where id.studentId="+nim+" and id.periodId="+period).list();   
                      int no =1;
            %>
            
            <h3>Kartu Hasil Studi</h3>
            <%
                      out.print((marks2.get(0).getPeriods().getPeriodYear() - 1) / 10 + " - Genap ");
            %>
            <table style="margin-left: 100px; width: 800px; border: 1px dotted black;">
                <thead style="font-weight: bold">
                    <th>No</th>
                    <th>Nama Matkul</th>
                    <th>Nilai 1</th>
                    <th>Nilai 2</th>
                    <th>Nilai 3</th>
                    <th>Nilai 4</th>
                    <th>Nilai 5</th>
                    <th>UAS</th>
                    <th>Grade</th>
                </thead>
                
                <% for(Marks mrk2 : marks2) {
                    %>
                    <tr>
                        <td><%= no %></td>
                        <td><%= mrk2.getMatkul().getMatkulName() %></td>
                        <td><%= mrk2.getNilai1() %></td>
                        <td><%= mrk2.getNilai2() %></td>
                        <td><%= mrk2.getNilai3() %></td>
                        <td><%= mrk2.getNilai4() %></td>
                        <td><%= mrk2.getNilai5() %></td>
                        <td><%= mrk2.getUas() %></td>
                        <td></td>
                    </tr>
                    <%
                    no++;
                }
                  }
                %>
            </table>
        </div>

        <div id="footer" style="background-color: black; height: 70px; width: 1000px; margin: auto; text-align: center;">
            <p style=" color: white; padding-top: 20px;">Copyright 2013 RPLL Kelompok 3</p>
        </div>

    </body>
</html>
