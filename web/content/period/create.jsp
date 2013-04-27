<%-- 
    Document   : home
    Created on : Apr 8, 2013, 2:17:15 PM
    Author     : Michael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Period - Sistem Informasi Akademik</title>
        <link rel="stylesheet" type="text/css" href="../../resources/style/home.css"/>
        <link rel="stylesheet" type="text/css" href="../../resources/style/home2.css"/>
        <link rel="stylesheet" type="text/css" href="../../resources/style/period.css"/>
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
            <h2 style="text-align: center; margin-left: 20px; padding-top: 10px;">Input Period</h2>
            <form name='f' action="../../PeriodServlet?mode=1" method='post'>
                <div id="content-left" style="margin-left: 300px; width: 400px;">
                    <fieldset>
                        <table>
                            <tr><td><label for="username">Period Year : </label></td>
                                <td><input type="text" name="periodYear" style="height: 20px; width: 200px"></td>
                            </tr>
                            <tr>
                                <td> <label for="username">Period Description : </label></td>
                                <td><input type="text" name="periodDes" style="height: 20px; width: 200px"></td>
                            </tr>
                            <tr>
                                <td> <label for="username">Start FRS : </label></td>
                                <td><input type="text" name="strFrs" style="height: 20px; width: 200px"></td>
                            </tr>
                            <tr>
                                <td> <label for="username">Start PRS : </label></td>
                                <td><input type="text" name="strPrs" style="height: 20px; width: 200px"></td>
                            </tr>
                            <tr>
                                <td> <label for="username">Start Payment 1 : </label></td>
                                <td><input type="text" name="strPay1" style="height: 20px; width: 200px"></td>
                            </tr>
                            <tr>
                                <td> <label for="username">Start Payment 2 : </label></td>
                                <td><input type="text" name="strPay2" style="height: 20px; width: 200px"></td>
                            </tr>
                            <tr>
                                <td> <label for="username">Finish FRS : </label></td>
                                <td><input type="text" name="finishFrs" style="height: 20px; width: 200px"></td>
                            </tr>
                            <tr>
                                <td> <label for="username">Finish PRS : </label></td>
                                <td><input type="text" name="finishPrs" style="height: 20px; width: 200px"></td>
                            </tr>
                            <tr>
                                <td> <label for="username">Finish Payment 1 :</label></td>
                                <td><input type="text" name="finishPay1" style="height: 20px; width: 200px"></td>
                            </tr>
                            <tr>
                                <td> <label for="username">Finish Payment 2 :</label></td>
                                <td><input type="text" name="finishPay2" style="height: 20px; width: 200px"></td>
                            </tr>               
                            <tr>
                                <td> <label for="username">Start Semester:</label></td>
                                <td><input type="text" name="strSmstr" style="height: 20px; width: 200px"></td>
                            </tr>
                            <tr>
                                <td> <label for="username">Finish Semester:</label></td>
                                <td><input type="text" name="finishSmstr" style="height: 20px; width: 200px"></td>
                            </tr>
                            
                            <tr>
                                <td></td>
                                <td><input type="submit" value="Simpan" style="height: 30px; width: 200px;"/></td>
                            </tr>
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
