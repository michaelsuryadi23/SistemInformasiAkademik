<%
    if(session.getAttribute("jabatan")!=null){
        String jabatan = session.getAttribute("jabatan").toString();
        if(jabatan.equals("Keuangan")){
            out.print("<script>"
                    + "window.location='homekeuangan.jsp';</script>");
        }
        else {
            if(jabatan.equals("student")) {
                out.print("<script>"
                    + "window.location='homestudent.jsp';</script>");
            }
            else {
                if(jabatan.equals("dosen")) {
                    out.print("<script>"
                    + "window.location='homedosen.jsp';</script>");
                }
            }
        }
    }
%>
