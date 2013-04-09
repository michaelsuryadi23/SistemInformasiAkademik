<%-- 
    Document   : home
    Created on : Apr 8, 2013, 2:17:15 PM
    Author     : Michael
--%>

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
        <jsp:include page="../header.jsp"/>
        <div id="content">
            <jsp:include page="../sidemenu.jsp" />
            <div id="content-left">
            </div>

            <div id="content-mid" style="text-align: center;">
                <h2 style="text-align: center; margin-left: 20px;">Edit Data Mahasiswa</h2>
                <p>Masukkan nim mahasiswa : </p>
                <form action="../../MahasiswaServlet" method="get" style="margin-left: 180px;">
                    <table>
                        <tr>
                            <td>NIM :</td>
                            <td><input type="text" name="nim" value="<% if(request.getParameter("nim")!=null){ out.print(request.getParameter("nim"));} %>"/></td>
                            <td><a href="showmahasiswa.jsp?type=1">View List</a></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Proses" /></td>
                        </tr>
                    </table>
                    
                </form>

            </div>

            <div id="content-right">

            </div>
        </div>

        <div id="footer" style="background-color: black; height: 70px; width: 1000px; margin: auto; text-align: center;">

        </div>

    </body>
</html>
