<%-- 
    Document   : home
    Created on : Apr 8, 2013, 2:17:15 PM
    Author     : Michael
--%>

<%@page import="com.rpll.model.Lectures"%>
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
        <title>Penilaian - Sistem Informasi Akademik</title>
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


        <div id="content" style="height: 1000px;">
            <jsp:include page="../sidemenu.jsp" />
            <h2 style="text-align: center; margin-left: 20px;">Input Nilai Ujian Reguler</h2>
            
            <%
                if(request.getParameter("stat")!=null){
                    out.println("<script>alert('Data telah Tersimpan');</script>");
                }
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
            
            <input type="submit" value="Proses"/>
            </form>
            
            <%
                if(request.getParameter("mode")!=null){
                    Session sess2 = HibernateUtil.getSessionFactory().openSession();
                    int matkulId = Integer.parseInt(request.getParameter("matkul"));
                    List<Bobot> listBobot = sess2.createQuery("from Bobot where id.matkulId="+matkulId+" and id.periodId="+idPeriod.getPeriodYear()).list();
                    List<Lectures> listLecture= sess2.createQuery("from Lectures where lectureId="+id).list();
                    Matkul matkul = (Matkul) sess2.createQuery("from Matkul where matkulId="+matkulId).list().get(0);
                    %>      
                
                <h2 style="text-align: center; margin-left: 20px;">Data Penilaian</h2>
                    <div id="nilai-right" style="width: 500px; height: 200px; float: left;">
                        <table style="margin-left: 50px; text-align: left;">
                            <tr>
                                <td>Id Matkul : </td>
                                <td><input type="text" disabled="disabled" value="<%= matkulId %>" /></td>
                            </tr>
                            <tr>
                                <td>Nama Matkul : </td>
                                <td><input type="text" disabled="disabled" value="<%= matkul.getMatkulName() %>" /></td>
                            </tr>
                            <tr>
                                <td>Nama Dosen :</td>
                                <td><input type="text" disabled="disabled" value="<%= listLecture.get(0).getLectureName() %>"/></td>
                            </tr>
                        </table>
                    </div>
                <div id="nilai-left" style="width: 500px; height: 200px; float: left;">
                    <form action="../../BobotNilaiServlet" method="post">
                    <table style="margin-left: 100px; text-align: left;">
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
                    <input type="hidden" name="period" value="<%= idPeriod.getPeriodYear() %>"/>
                    <input type="hidden" name="matkul" value="<%= matkulId %>"/>
                    <input type="hidden" name="lecture" value="<%= listLecture.get(0).getLectureId() %>"/>
                    

                    <tr>
                        <td></td>
                        <td><input type="submit" value="Simpan"/></td>
                    </tr>
                    
                </table>
                    </form>
                    
                    
                    
                </div>
                    <form action="../../PenilaianServlet" method="post"> 
                <h3 style="text-align: center; margin-left: 20px;">List Mahasiswa</h3>
                
                <%
                    List<Marks> marks = sess2.createQuery("from Marks where id.periodId="+idPeriod.getPeriodYear()+" and id.matkulId="+matkulId).list();
                    int no = 1;
                %>
                    <table style="width:900px; margin-left: 40px;">
                    <thead style="background-color: black; color: white;">
                    <th style="width: 50px;">No</th>
                    <th style="width: 100px;">NIM</th>
                    <th style="width: 200px;">Nama</th>
                    <th style="width: 50px;">Nilai 1</th>
                    <th style="width: 50px;">Nilai 2</th>
                    <th style="width: 50px;">Nilai 3</th>
                    <th style="width: 50px;">Nilai 4</th>
                    <th style="width: 50px;">Nilai 5</th>
                    <th style="width: 50px;">Nilai UAS</th>
                    <th style="width: 50px;">Nilai Akhir</th>
                    <th style="width: 50px;">Grade</th>
                    </thead>
                    
                    <%
                    for(Marks m : marks) {
                      %>
                      <tr>
                          <input type="hidden" name="idstu-<%= no %>" value="<%= m.getStudents().getStudentId() %>" />
                          <td><%= no %></td>
                          <td><%= m.getStudents().getStudentId() %></td>
                          <td><%= m.getStudents().getStudentName() %></td>
                          <td><input type="text" name="nilai1-<%= no %>" value="<%= m.getNilai1() %>" style="width: 50px;"/></td>
                          <td><input type="text" name="nilai2-<%= no %>" value="<%= m.getNilai2() %>" style="width: 50px;"/></td>
                          <td><input type="text" name="nilai3-<%= no %>" value="<%= m.getNilai3() %>" style="width: 50px;"/></td>
                          <td><input type="text" name="nilai4-<%= no %>" value="<%= m.getNilai4() %>" style="width: 50px;"/></td>
                          <td><input type="text" name="nilai5-<%= no %>" value="<%= m.getNilai5() %>" style="width: 50px;"/></td>
                          <td><input type="text" name="uas-<%= no %>" value="<%= m.getUas()%>" style="width: 50px;" /></td>
                          <%
                            double nilaiAkhir = m.getNilai1()*listBobot.get(0).getNilai1()+m.getNilai2()*listBobot.get(0).getNilai2()+m.getNilai3()*listBobot.get(0).getNilai3()+m.getNilai4()*listBobot.get(0).getNilai4()+m.getNilai5()*listBobot.get(0).getNilai5()+m.getUas()*listBobot.get(0).getUas();
                            nilaiAkhir= Math.round(nilaiAkhir);
                            String grade = "";
                            
                            if(nilaiAkhir>=80){
                                grade="A";
                            }
                            else {
                                if(nilaiAkhir>=73){
                                    grade="B+";
                                }
                                else {
                                    if(nilaiAkhir>=67){
                                        grade="B";
                                    }
                                    else {
                                        if(nilaiAkhir>=61){
                                            grade="C+";
                                        }
                                        else {
                                            if(nilaiAkhir>=55){
                                                grade="C";
                                            }
                                            else{
                                                if(nilaiAkhir>=41){
                                                    grade="D";
                                                }
                                                else {
                                                    grade="E";
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            
                          %>  
                          
                          <td><%= nilaiAkhir %></td>
                            <td><%= grade %></td>
                      </tr>
                      <%
                        no++;
                    }
                    %>
                </table>
                <br/>
                <input type="hidden" name="counter" value="<%= no %>"/>
                <input type="hidden" name="period" value="<%= idPeriod.getPeriodYear() %>"/>
                <input type="hidden" name="matkul" value="<%= matkulId %>"/>
                
                <input type="submit" value="Simpan" style="width: 150px; height: 30px;"/>
                    </form>
                
                    
                    
                <%
                }
                %>
                
                

        </div>

        <div id="footer" style="background-color: black; height: 70px; width: 1000px; margin: auto; text-align: center;">
            <p style=" color: white; padding-top: 20px;">Copyright 2013 RPLL Kelompok 3</p>
        </div>

    </body>
</html>
