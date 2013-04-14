<%
    if(session.getAttribute("jabatan")!=null){
        String jabatan = session.getAttribute("jabatan").toString();
        
        if(jabatan.equals("keuangan")||jabatan.equals("BAAK")||jabatan.equals("dosen")){
            out.print("<script>alert('Anda Tidak bisa masuk ke modul ini');"
                    + "window.location='../../index.jsp';</script>");
        }
    }
%>