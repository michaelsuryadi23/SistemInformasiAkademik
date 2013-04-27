<%-- 
    Document   : home
    Created on : Apr 8, 2013, 2:17:15 PM
    Author     : Michael
--%>

<%@page import="com.rpll.model.Periods"%>
<%@page import="com.rpll.model.Bobot"%>
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

            <% 
                int id = Integer.parseInt(session.getAttribute("username").toString());
                Session sess = HibernateUtil.getSessionFactory().openSession();
                Periods idPeriod = (Periods) sess.createQuery("from Periods where status=1").list().get(0);
                List<TeachPeriod> listTeach = sess.createQuery("from TeachPeriod where id.lectureId="+id+" and id.periodId="+idPeriod.getPeriodYear()).list();
            %>
            <form action="view.jsp?mode=1" method="post">
            Pilih Matakuliah : 
            <select name="matkul">
                <% for(TeachPeriod t : listTeach){
                    %>
                    <option value="<%= t.getMatkul().getMatkulId() %>"><%= t.getMatkul().getMatkulId() %>-<%= t.getMatkul().getMatkulName() %></option>
                    <%
                }
                %>
            </select>
            <br/>
            <input type="submit" value="Proses"/>
            </form>
            
            <%
                if(request.getParameter("mode")!=null){
                    Session sess2 = HibernateUtil.getSessionFactory().openSession();
                    int matkulId = Integer.parseInt(request.getParameter("matkul"));
                    List<Bobot> listBobot = sess2.createQuery("from Bobot where id.matkulId="+matkulId+" and id.periodId="+idPeriod.getPeriodYear()).list();
                
            %>
                
                <h2 style="text-align: center; margin-left: 20px;">Bobot Penilaian</h2>
                
                <table>
                    <tr>
                        <td>Bobot Nilai 1 : </td>
                        <td><input type="text" name="nilai1" value="<%= listBobot.get(0).getNilai1()*100 %>"/>%</td>
                    </tr>
                    <tr>
                        <td>Bobot Nilai 2 : </td>
                        <td><input type="text" name="nilai2" value="<%= listBobot.get(0).getNilai2()*100 %>"/>%</td>
                    </tr>
                    <tr>
                        <td>Bobot Nilai 3 : </td>
                        <td><input type="text" name="nilai3" value="<%= listBobot.get(0).getNilai3()*100 %>"/>%</td>
                    </tr>
                    <tr>
                        <td>Bobot Nilai 4 : </td>
                        <td><input type="text" name="nilai4" value="<%= listBobot.get(0).getNilai4()*100 %>"/>%</td>
                    </tr>
                    <tr>
                        <td>Bobot Nilai 5 : </td>
                        <td><input type="text" name="nilai5" value="<%= listBobot.get(0).getNilai5()*100 %>"/>%</td>
                    </tr>
                    <tr>
                        <td>Bobot Nilai UAS : </td>
                        <td><input type="text" name="uas" value="<%= listBobot.get(0).getUas()*100%>"/>%</td>
                    </tr>
                    
                </table>
                
                
                
                <%
                }
                %>
                
                

        </div>

        <div id="footer" style="background-color: black; height: 70px; width: 1000px; margin: auto; text-align: center;">
            <p style=" color: white; padding-top: 20px;">Copyright 2013 RPLL Kelompok 3</p>
        </div>

    </body>
</html>
