<%
    if(session.getAttribute("jabatan")!=null){
        String jabatan = session.getAttribute("jabatan").toString();
        if(jabatan.equals("Keuangan")){
            response.sendRedirect("homekeuangan.jsp");
        }
        else {
            if(jabatan.equals("student")) {
                response.sendRedirect("homestudent.jsp");
            }
            else {
                if(jabatan.equals("dosen")) {
                    response.sendRedirect("homedosen.jsp");
                }
            }
        }
    }
%>
