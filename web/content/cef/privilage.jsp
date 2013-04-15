<%-- 
    Document   : privilage
    Created on : Apr 15, 2013, 11:06:48 AM
    Author     : Acer
--%>

<%
    if(session.getAttribute("jabatan")!=null){
        String jabatan = session.getAttribute("jabatan").toString();
        
        if(jabatan.equals("keuangan")||jabatan.equals("BAAK")){
            out.print("<script>alert('Anda Tidak bisa masuk ke modul ini');</script>");
            response.sendRedirect("../../index.jsp");
        }
    }
%>
