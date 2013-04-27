<%
    if (session.getAttribute("jabatan").equals("BAAK")) {
%>

<div class="menu">
    <ul> 
        <li>
            <a href="../home/home.jsp">Home</a>
        </li>
        <li>
            <a href="#">Mahasiswa<span class="arrow"></span></a>
            <ul>
                <li><a href="../mahasiswa/list.jsp">View List Data Mahasiswa</a></li>
                <li><a href="../mahasiswa/create.jsp">Input Data Mahasiswa Baru</a></li>
            </ul>
        </li>
        <li>
            <a href="#">Staffs<span class="arrow"></span></a>
            <ul>
                <li><a href="../staff/view.jsp">View List Data Staff</a></li>
                <li><a href="../staff/create.jsp">Input Data Staff Baru</a></li>
            </ul>
        </li>
        <li>
            <a href="#">Dosen<span class="arrow"></span></a>
            <ul>
                <li><a href="../dosen/list.jsp">View List Data Dosen</a></li>
                <li><a href="../dosen/create.jsp">Input Data Dosen Baru</a></li>
            </ul>
        </li>

        <li>
            <a href="#">Akademik<span class="arrow"></span></a>
            <ul>
                <%
                    if (session.getAttribute("jabatan") != "keuangan") {
                %>
                <li><a href="../assigndosen/kurikulum.jsp">Assign Dosen Matakuliah</a></li>
                <li><a href="../bagikelas/edit.jsp">Edit Pembagian Kelas Mahasiswa</a></li>
                <li><a href="../kurikulum/kurikulum.jsp">Edit Kurikulum Departemen</a></li>
                <li><a href="../pengumuman/list.jsp">Input Pengumuman</a></li>
                <li><a href="../matkul/list.jsp">Input Master Data Matkul</a></li>
                <li><a href="../rooms/list.jsp">Data Rooms</a></li>
                

                <%                    }
                %>
                
            </ul>
        </li>
        <li>
            <a href="#">Badan Hukum<span class="arrow"></span></a>
            <ul>
                <li><a href="../badanhukum/create.jsp">Create Badan Hukum</a></li>
                <li><a href="../badanhukum/list.jsp">View & Edit Badan Hukum</a></li>                
            </ul>
        </li>
        <li>
            <a href="#">Utilitas<span class="arrow"></span></a>
            <ul>
                <li><a href="#">Bantuan</a></li>
                <li><a href="../utilitas/gantipassstaff.jsp">Ganti Password</a></li>           
            </ul>
        </li>
        <li>
            <a href="../../index.jsp?logout=true">Sign Out</a>
        </li>

    </ul>
</div>

<%
} else {
    if (session.getAttribute("jabatan").equals("student")) {
%>
<div class="menu">
    <ul>
        <li>
            <a href="../home/homestudent.jsp">Home</a>
        </li>
        <li>
            <a href="../profil/view.jsp">Edit Profil</a>

        </li>
        <li>
            <a href="#">Akademik<span class="arrow"></span></a>
            <ul>
                <li><a href="../krs/inputkrs.jsp">Input Kartu Rencana Studi</a></li>
                <li><a href="../krs/inputcetakkrs.jsp">View dan Cetak Kartu Rencana Studi</a></li>
                <li><a href="../staff/view.jsp">Input PRS</a></li>
                <li><a href="../cef/create.jsp">Input CEF Matakuliah</a></li>
                <li><a href="../staff/create.jsp">Input Kotak Saran</a></li>
            </ul>
        </li>
        <li>
            <a href="#">Laporan<span class="arrow"></span></a>
            <ul>
                <li><a href="../dosen/update.jsp">Transkrip Nilai 1</a></li>
                <li><a href="../dosen/list.jsp">Transkrip Nilai 2</a></li>
                <li><a href="../khs/viewkhs.jsp">Kartu Hasil Studi</a></li>
                <li><a href="../dosen/create.jsp">Rekap Absensi</a></li>
            </ul>
        </li>
        <li>
            <a href="#">Utilitas<span class="arrow"></span></a>
            <ul>
                <li><a href="#">Bantuan</a></li>
                <li><a href="../utilitas/gantipassstudent.jsp">Ganti Password</a></li>           
            </ul>
        </li>
        <li>
            <a href="../../index.jsp?logout=1">Sign Out</a>
        </li>
    </ul>
</div>
<%                    } else {
    if (session.getAttribute("jabatan").equals("keuangan")) {
%>
<ul>
        <li>
            <a href="../home/home.jsp">Home</a>
        </li>
        <li>
            <a href="#">Akademik<span class="arrow"></span></a>
            <ul>
                <li><a href="../staff/findstaff.jsp">Post Laporan Keuangan</a></li>
                <li><a href="../staff/view.jsp">Blocking Absensi Mahasiswa</a></li>
                <li><a href="../staff/create.jsp">Input CEF Matakuliah</a></li>
                <li><a href="../staff/create.jsp">Input Kotak Saran</a></li>
            </ul>
        </li>
        <li>
            <a href="#">Laporan<span class="arrow"></span></a>
            <ul>
                <li><a href="../dosen/update.jsp">View Laporan Keuangan Mahasiswa</a></li>
            </ul>
        </li>
        <li>
            <a href="#">Utilitas<span class="arrow"></span></a>
            <ul>
                <li><a href="#">Bantuan</a></li>
                <li><a href="../utilitas/gantipassstaff.jsp">Ganti Password</a></li>                 
            </ul>
        </li>
        <li>
            <a href="../../index.jsp?logout=1">Sign Out</a>
        </li>
    </ul>
<%                                }
    else {
        if (session.getAttribute("jabatan").equals("dosen")) 
        {
            %>
            <div class="menu">
            <ul>
        <li>
            <a href="../home/homedosen.jsp">Home</a>
        </li>
        <li>
            <a href="#">Perkuliahan<span class="arrow"></span></a>
            <ul>
                <li><a href="../staff/findstaff.jsp">Mulai Perkuliahan</a></li>
                <li><a href="../staff/view.jsp">Edit Absensi Matakuliah</a></li>
            </ul>
        </li>
        <li>
            <a href="#">Akademik<span class="arrow"></span></a>
            <ul>
                <li><a href="../bobotpenilaian/view.jsp">Input Bobot Penilaian</a></li>
                <li><a href="../penilaian/view.jsp">Input Nilai Ujian Reguler</a></li>
                <li><a href="../staff/create.jsp">View CEF dari Mahasiswa</a></li>
            </ul>
        </li>
        <li>
            <a href="#">Utilitas<span class="arrow"></span></a>
            <ul>
                <li><a href="#">Bantuan</a></li>
                <li><a href="../utilitas/gantipassstaff.jsp">Ganti Password</a></li>                 
            </ul>
        </li>
        <li>
            <a href="../../index.jsp?stat=1">Sign Out</a>
        </li>
    </ul>
            </div>
            <%
        }
    }
    
        }
    }

%>
