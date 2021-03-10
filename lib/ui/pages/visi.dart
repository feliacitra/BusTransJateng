import 'package:flutter/material.dart';

class VisiMisi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Visi & Misi', style: TextStyle(color: Colors.white)),
          backgroundColor: Color(0xFFff0000),
        ),
        body: ListView(
          children: [
            Center(
              child: Container(
                height: 150,
                width: 200,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/1jateng.png'),
                )),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "VISI & MISI",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Text(
                "BALAI TRANSPORTASI JAWA TENGAH",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: Text(
                "VISI BALAI TRANSPORTASI JAWA TENGAH",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
              child: Text(
                "Visi Balai Transportasi Jawa Tengah adalah gambaran arah pembangunan atau kondisi masa depan yang ingin dicapai dalam kurun waktu 5 (lima) tahun. Visi Balai Transportasi Jawa Tengah disusun berdasarkan visi Dinas Perhubungan Provinsi Jawa Tengah tahun 2018-2023. Jika terjadi perubahan visi Pemerintah Provinsi Jawa Tengah yang dalam hal ini diterjemahkan oleh Dinas Perhubungan Provinsi Jawa Tengah, maka visi Balai Transportasi Jawa Tengah juga akan dilakukan revisi sesuai dengan perubahan tersebut. Visi Balai Transportasi Jawa Tengah Tahun 2018-2023 dalam pengolahan Transjateng : “Menuju Transportasi Massal Handal dan Terpercaya” Menuju transportasi massal handal dan terpercaya yang di maksud adalah Balai Transportasi Jawa Tengah Menjadi Penyelenggara transportasi massal yang aman, nyaman, murah, dan tepat waktu bagi mobilitas masyarakat jawa tengah serta pelayanan penunjang lainnya. Visi Balai Transportasi Jawa Tengah memiliki keterkaitan dengan visi Dinas Perhubungan Provinsi Jawa Tengah dan Pemerintah Provinsi Jawa Tengah yaitu : Menuju Jawa Tengah Sejahtera dan Berdikari 'Tetep Mboten Korupsi Mboten Ngapusi'. Balai Transportasi Jawa Tengah mendukung visi Dinas Perhubungan Provinsi Jawa Tengah dan Pemerintah Provinsi Jawa Tengah dengan meningkatkan kualitas pelayanan transportasi yaitu transportasi massal handal dan terpercaya demi kesejahteraan masyarakat Provinsi Jawa Tengah. Visi Balai Transportasi Jawa Tengah sejalan dengan 10 program unggulan Pemerintah Provinsi Jawa Tengah yaitu pengembangan transportasi massal yang berkualitas sehingga masyarakat dapat menerima dan menggunakan pelayanan sebagai kebutuhan yaitu menunjang mobilitas dalam beraktivitas. Kehidupan masyarakat lebih baik dan terdorong untuk berperan aktif dan mandiri untuk menggunakan transportasi massal.",
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: Text(
                "MISI BALAI TRANSPORTASI JAWA TENGAH",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
              child: Text(
                "Misi Balai Transportasi Jawa Tengah adalah langkah-langkah yang akan diambil untuk mewujudkan visi Balai Transportasi Jawa Tengah. Adapun misi untuk mencapai visi Balai Transportasi Jawa Tengah adalah:",
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                "1. Memberikan solusi dalam pelayanan transportasi massal bagi masyarakat di Jawa Tengah serta pelayanan penunjang lainnya;",
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                "2. Membangun insan yang professional peduli dan penuh integritas dengan semangat pelayanan dan kerjasama yang kuat;",
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                  " 3. Melayani pelanggan dengan 5S (senyum, sapa, sopan, santun, sabar);",
                  textAlign: TextAlign.justify),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                  "4. Menerapkan budaya kerja yang mengutamakan keandalan pelayanan dan kepuasan pelanggan.",
                  textAlign: TextAlign.justify),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 5),
              child: Text(
                "Agar dapat memberikan pelayanan yang berkualitas maka, Balai Transportasi Jawa Tengah membuat perencanaan pengembangan rute, peningkatan sarana prasarana dan peningkatan kualitas sumber daya manusia melalui rencana strategis Balai Transportasi Jawa Tengah. Monitoring dan evaluasi kegiatan Balai Transportasi Jawa Tengah dilaksanakan melalui penilaian kinerja Balai Transportasi Jawa Tengah. Menciptakan transportasi massal yang handal dan terpercaya dapat dicapai dengan mengoptimalkan kegiatan monitoring dan evaluasi serta meningkatkan kerjasama lintas program dan lintas sektor.",
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ));
  }
}
