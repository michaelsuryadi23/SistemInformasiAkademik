<%
    if(session.getAttribute("jabatan")!=null){
        String jabatan = session.getAttribute("jabatan").toString();
        
        if(jabatan.equals("keuangan")||jabatan.equals("mahasiswa")){
            out.print("<script>alert('Anda Tidak bisa masuk ke modul ini');</script>");
            response.sendRedirect("../../index.jsp");
        }
    }
%>