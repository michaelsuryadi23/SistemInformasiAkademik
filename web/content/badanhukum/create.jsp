<%-- 
    Document   : home
    Created on : Apr 8, 2013, 2:17:15 PM
    Author     : Michael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Badan Hukum - Sistem Informasi Akademik</title>
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
            <jsp:include page="privilage.jsp"/>
            <h2 style="text-align: center; margin-left: 20px; padding-top: 10px;">Input Badan Hukum</h2>
            <form name='f' action="BadanHukumServlet?mode=1" method='POST'>
                <div id="content-left" style="margin-left: 300px; width: 400px;">
                    <fieldset>
                        <table>
                            <tr><td><label for="username">Univ ID : </label></td>
                                <td><input type="text" name="univId" style="height: 20px; width: 200px"></td>
                            </tr>
                            <tr>
                                <td> <label for="username">Univ Name : </label></td>
                                <td><input type="text" name="univName" style="height: 20px; width: 200px"></td>
                            </tr>
                            <tr>
                                <td> <label for="username">Univ Address : </label></td>
                                <td><input type="text" name="univAddress" style="height: 20px; width: 200px"></td>
                            </tr>
                            <tr>
                                <td> <label for="username">Univ Telp : </label></td>
                                <td><input type="text" name="univTelp" style="height: 20px; width: 200px"></td>
                            </tr>
                            <tr>
                                <td> <label for="username">Univ Email : </label></td>
                                <td><input type="text" name="univEmail" style="height: 20px; width: 200px"></td>
                            </tr>
                            <tr>
                                <td> <label for="username">Univ Homepage : </label></td>
                                <td><input type="text" name="univHomepage" style="height: 20px; width: 200px"></td>
                            </tr>
                            <tr>
                                <td> <label for="username">No Akreditasi : </label></td>
                                <td><input type="text" name="univNoAkreditasi" style="height: 20px; width: 200px"></td>
                            </tr>
                            <tr>
                                <td> <label for="username">Akreditasi : </label></td>
                                <td><input type="text" name="univAkreditasi" style="height: 20px; width: 200px"></td>
                            </tr>
                            <tr>
                                <td> <label for="username">Found Date :</label></td>
                                <td><input type="text" name="univFound" style="height: 20px; width: 200px"></td>
                            </tr>
                            <tr>
                                <td> <label for="username">Nama Rektor :</label></td>
                                <td><input type="text" name="univRector" style="height: 20px; width: 200px"></td>
                            </tr>
                            
                            <tr>
                                <td></td>
                                <td><input type="submit" value="Simpan" style="height: 30px; width: 200px;"/></td>
                            </tr>
                            
                        <br/>
                        </table>
                    </fieldset>
                </div>
            </form>
        </div>

    </div>
</div>

<jsp:include page="../footer.jsp"/>

</body>
</html>
