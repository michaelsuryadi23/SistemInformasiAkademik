<%-- 
    Document   : home
    Created on : Apr 8, 2013, 2:17:15 PM
    Author     : Michael
--%>

<%@page import="java.util.List"%>
<%@page import="com.rpll.model.Matkul"%>
<%@page import="com.rpll.util.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Matkul - Sistem Informasi Akademik</title>
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
        
        <div id="content">
            <jsp:include page="../sidemenu.jsp"/>
            <jsp:include page="privilage.jsp" />
            <%
                int id = Integer.parseInt(request.getParameter("matID"));
                Session sess = HibernateUtil.getSessionFactory().openSession();
                List<Matkul> matkul = sess.createQuery("from Matkul where matID="+id).list();
                Matkul mat = matkul.get(0);
                %>
            <h2 style="text-align: center; margin-left: 20px; padding-top: 10px;">Input Pengumuman</h2>
            <form name='f' action="MatkulServlet?mode=1" method='POST'>
                <div id="content-left" style="margin-left: 300px; width: 400px;">
                    <fieldset>
                        <table>
                            <tr><td><label for="username">Matkul ID : </label></td>
                                <td><input type="text" name="matkulID" style="height: 20px; width: 200px" readonly="readonly" value="<%= mat.getMatkulId() %>"></td>
                            </tr>
                            <tr>
                                <td> <label for="username">Matkul Name : </label></td>
                                <td><input type="text" name="matkulName" style="height: 20px; width: 200px" value="<%= mat.getMatkulName() %>"></td>
                            </tr>
                            <tr>
                                <td> <label for="username">Matkul Type : </label></td>
                                <td><input type="text" name="matkulType" style="height: 20px; width: 200px" value="<%= mat.getMatkulType() %>"></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><input type="submit" value="Update" style="height: 30px; width: 200px;"/></td>
                            </tr>
                            
                        <br/>
                        </table>
                    </fieldset>
                </div>
            </form>
        </div>

    

<jsp:include page="../footer.jsp"/>

</body>
</html>
