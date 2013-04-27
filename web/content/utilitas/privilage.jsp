<%
    if (session.getAttribute("jabatan").toString().equals(" ")) {
        out.print("<script>alert('Anda harus login dahulu');window.location='../../index.jsp';</script>");
    }
    else {
        if(session.getAttribute("jabatan").toString().equals(" ")){
            out.print("<script>alert('Anda harus login dahulu');window.location='../../index.jsp';</script>");
        }
    }
%>