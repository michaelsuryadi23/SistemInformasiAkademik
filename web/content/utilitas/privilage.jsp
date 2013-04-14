<%
    if (session.getAttribute("jabatan") == null) {
        out.print("<script>alert('Anda harus login dahulu');window.location='../../index.jsp';</script>");
    }
%>