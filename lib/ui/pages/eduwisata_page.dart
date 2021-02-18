import 'package:flutter/material.dart';

// class Eduwisata extends StatefulWidget {
//   @override
//   _EduwisataState createState() => _EduwisataState();
// }

// class _EduwisataState extends State<Eduwisata> {
//   var titleList = [
//     "Kebun Buah Bogar",
//     "Terminal Bukateja",
//     "Taman Gringsing",
//     "Terminal Purbalingga",
//     "Taman Lalu Lintas Terminal Bulupitu",
//     "Taman Andhang Pangrenan",
//     "Rita Supemall",
//     "Alun-Alun Purwokerto",
//     "Masjid Agung Purwokerto",
//     "Museum Bank BRI",
//     "Pasar Modern Pasar Manis",
//     "Taman Usman Janatin",
//     "RTH Bojong"
//   ];
//   var descList = [
//     "Agrowisata hortikultura Botania Garden (Bogar) di rintisan Desa Wisata Karangcengis,  Kecamatan Bukateja, bisa jadi alternatif wisata yang sangat dikeromendasikan untuk para traveller. Dengan luas tanah 183 hektare kebun buah milik petani terhampar. Wisatawan diajak memetik buah jambu citra, jambu biji kristal, jambu biji merah, jeruk, klengkeng dan belimbing dari pohonnya langsung. Selain itu rindangnya pepohonan membuat area ini sejuk sepanjang hari.",
//     "Terminal bus bukateja Purbalingga merupakan terminal yang melayani transportasi bus umum jenis bus AKDP (Antar Kota Dalam Provinsi) dan Angkutan Pedesaan.",
//     "Objek wisata Curug Gringsing lokasinya tak jauh dari pusat kota dan pusat pemerintahan Kabupaten Purbalingga. Bagi wisatawan yang datang ke tempat ini dapat sekaligus mampir dan berswafoto ke alun-alun dan masjid agung Purbalingga karena lokasinya yang tak begitu jauh dari tempat wisata ini.",
//     "Tidak lengkap rasanya kalau ke Purbalingga jika tidak mengunjungi terminal Purbalingga yang satu ini, terminal ini merupakan salah satu terminal angkutan umum yang berada di wilayah Kabupaten Purbalingga Provinsi Jawa Tengah. ",
//     "Taman Edukasi Keselamatan Jalan atau dikenal dengan Taman Lalu Lintas yang ada di Terminal Bulupitu Purwokerto, merupakan tempat edukasi lalu lintas dengan media pembelajaran yang sangat asyik untuk masyarakat. Masyarakat dapat bermain dan belajar di tempat ini. Terlebih saat ini, taman lalu lintas yang dikelola Dinas Perhubungan (Dinhub) Kabupaten Banyumas, sudah dilengkapi dengan pohon rambu dan traffic light.",
//     "Taman Andhang Pangrenan merupakan fasilitas umum dan tempat rekreasi yang multifungsi. Merupakan ruang terbuka hijau di sisi selatan Kota Purwokerto, dengan fasilitas yang cukup lengkap dan bisa di manfaatkan untuk berbagai keperluan oleh masyarakat umum. Taman Andhang Pangrenan ini cukup rindang dengan berbagai jenis pepohonan dan tanaman bunga, dan juga ada berbagai mainan anak. ",
//     "Rita Supermall merupakan mall pertama di Kota Purwokerto. Terletak di tengah kota tepat di depan alun-alun yang berada didepan Pendopo Kabupaten. Didalamnya terdapat macam-macam gallery yang dapat memenuhi segala kebutuhan masyaraka, diantaranya :  Area makan, Bioskop CGV Cinemas, Area Pakaian, Area belanja bahan pokok, Area bermain, dan masih banyak lagi lainnya.",
//     "Selain menjadi pusat kota, alun-alun yang satu ini sudah menjadi icon tersendiri bagi masyarakat Kota Purwokerto. Alun-alun Purwokerto ini dapat dijadikan tempat bermain yang sangat menarik, anda dapat mengambil foto di tempat ini dikarenakan tempat ini sangat instagramable.",
//     "Untuk tempat ibadah, anda tidak perlu khawatir ketika bermain di Alun-alun Purwokerto karena disamping Alun-alun Purwokerto ini terdapat masjid yang sangat luas, megah  dan nyaman yaitu Masjid Agung Baitussalam Purwokerto.",
//     "Purwokerto merupakan kota tempat berdirinya cikal-bakal Bank BRI (Bank Rakyat Indonesia) yang didirikan oleh Raden Bei Aria Wirjaatmadja pada tanggal 16 Desember 1895, merupakan Bank terbesar milik Pemerintah. Nah gedung lama dan pertama Bank BRI tersebut kini menjadi satu-satunya Museum BRI dan tempatnya kini dapat anda kunjungi di Purwokerto. Didalam museum ini terdiri dari tiga monumen yaitu Gedung Replika, Patung Raden Aria Wirjaatmadja, Gedung Museum BRI.",
//     "Pasar tradisional biasanya identik dengan lingkungan kotor, becek, tidak rapi, bahkan jorok. Namun berbeda dengan Pasar Manis Purwokerto, Kabupaten Banyumas. Pasar tradisional ini bersih, rapi, dan pengunjung bisa menggunakan troli belanja layaknya di supermarket. Lebih menariknya lagi, Di pasar ini para pengunjung tidak perlu bingung ketika mencari bahan kebutuhan. Papan penunjuk jenis dagangan terpampang di titik-titik pasar. Barang dagangan sengaja dikelompokkan sesuai dengan jenisnya untuk memudahkan pengunjung Pasar Manis.",
//     "Taman Usman Janatin City Park (UJCP) atau biasa disebut Usman Janatin menjadi taman kota sekaligus wahana wisata baru yang murah.taman ini didirikan untuk mengenang sosok pahlawan nasional asal Desa Jatisaba, Kecamatan Purbalingga, yang bernama Usman Janatin  yang gantung di Singapura pada 17 Oktober 1968, Pemkab Purbalingga mengabadikannya sebagai nama taman kota.  Selain taman ini dihias oleh pepohonan, taman seluas 16.000 meter persegi ini dilengkapi wahana permainan, di antaranya, worm coaster, istana balon, sepeda roda tiga dan kereta mini.",
//     "Ruang Terbuka Hijau Bojong yang dibangun oleh Pemkab Purbalingga ini sangat pas untuk anda yang ingin melepas lelah dan bersantai dengan keluarga. RTH ini dapat dijadikan sebagai tempat refreshing yang nyaman, khususnya bagi masyarakat dan pelajar yang membutuhkan ketenangan tempat  untuk belajar dan santai.",
//   ];
//   var imgList = [
//     "assets/bogar.jpg",
//     "assets/bukateja.jpg",
//     "assets/gringsing.jpg",
//     "assets/terminalpurbalingga.jpg",
//     "assets/bulupitu.jpg",
//     "assets/andhang.jpg",
//     "assets/ritamall.jpg",
//     "assets/purwokerto.jpg",
//     "assets/masjid-agung-purwokerto.jpg",
//     "assets/museum-bri.jpg",
//     "assets/pasar-manis.jpg",
//     "assets/usman-janatin.jpg",
//     "assets/rth-bojong.jpg"
//   ];
//   var alamatList = [
//     "Karangcengis, Bukateja, Purbalingga, Jawa Tengah",
//     "Jl. Argandaru, Dusun 3, Bukateja, Kec. Bukateja, Kabupaten Purbalingga, Jawa Tengah",
//     "Purbalingga Kidul,Kec. Purbalingga, Kabupaten Purbalingga, Jawa Tengah",
//     "JL. Jendral Ahmad Yani No.4, Karangpoh Kulon, Kalikabong, Kec. Kalimanah, Kabupaten Purbalingga, Jawa Tengah",
//     "Karanggayam, Teluk, Purwokerto Selatan, Kabupaten Banyumas, Jawa Tengah",
//     "Jalan Gerilya Purwokerto Selatan, Windusara, Karangklesem, Kec. Banyumas, Kabupaten Banyumas, Jawa Tengah",
//     "Jl. Jend. Soedirman No.296, Pereng, Sokanegara, Kec. Purwokerto Tim., Kabupaten Banyumas, Jawa Tengah",
//     "JL. Jend. Sudirman, Purwokerto Lor,  Kec. Purwokerto Timur, Kabupaten Banyumas, Jawa Tengah",
//     "JL. Jend. Sudirman, Purwokerto Lor,  Kec. Purwokerto Timur, Kabupaten Banyumas, Jawa Tengah",
//     "Jl. Jend. Soedirman No.57, Pesayangan, Kedungwuluh, Kec. Purwokerto Barat, Kabupaten Banyumas, Jawa Tengah",
//     "Pesayangan, Pasar manis, Purwokerto Barat, Kabupaten Banyumas, Jawa Tengah",
//     "Jl. Komisaris Noto Sumarsono No.21, Purbalingga Kidul, Kec. Purbalingga, Kabupaten Purbalingga, Jawa Tengah",
//     "Bojong, Purbalingga, Kabupaten Purbalingga, Jawa Tengah"
//   ];
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width * 0.6;
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             height: size.height * .45,
//             decoration: BoxDecoration(
//               color: Color(0xFFFF0000),
//             ),
//           ),
//           Column(
//             children: [
//               Text(
//                 "Happy With Us",
//                 style: Theme.of(context)
//                     .textTheme
//                     .display1
//                     .copyWith(fontWeight: FontWeight.w900),
//               ),
//             ],
//           ),
//           Expanded(
//             child: GridView.builder(
//                 itemCount: imgList.length,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                 ),
//                 itemBuilder: (BuildContext context, int index) {
//                   return GestureDetector(
//                     onTap: () {
//                       showDialogFunc(context, imgList[index], titleList[index],
//                           descList[index]);
//                     },
//                     child: Card(
//                         child: Row(
//                       children: [
//                         Container(
//                           width: 100,
//                           height: 100,
//                           child: Image.asset(imgList[index]),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(10),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 titleList[index],
//                                 style: TextStyle(
//                                   fontSize: 13,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Container(
//                                 width: width,
//                                 child: Text(
//                                   alamatList[index],
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     color: Colors.grey[500],
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     )),
//                   );
//                 }),
//           ),
//         ],
//       ),
//     );
//   }
// }
class Eduwisata extends StatefulWidget {
  @override
  _EduwisataState createState() => _EduwisataState();
}

class _EduwisataState extends State<Eduwisata> {
  var titleList = [
    "Kebun Buah Bogar",
    "Terminal Bukateja",
    "Taman Gringsing",
    "Terminal Purbalingga",
    "Taman Lalu Lintas Terminal Bulupitu",
    "Taman Andhang Pangrenan",
    "Rita Supemall",
    "Alun-Alun Purwokerto",
    "Masjid Agung Purwokerto",
    "Museum Bank BRI",
    "Pasar Modern Pasar Manis",
    "Taman Usman Janatin",
    "RTH Bojong"
  ];
  var descList = [
    "Agrowisata hortikultura Botania Garden (Bogar) di rintisan Desa Wisata Karangcengis,  Kecamatan Bukateja, bisa jadi alternatif wisata yang sangat dikeromendasikan untuk para traveller. Dengan luas tanah 183 hektare kebun buah milik petani terhampar. Wisatawan diajak memetik buah jambu citra, jambu biji kristal, jambu biji merah, jeruk, klengkeng dan belimbing dari pohonnya langsung. Selain itu rindangnya pepohonan membuat area ini sejuk sepanjang hari.",
    "Terminal bus bukateja Purbalingga merupakan terminal yang melayani transportasi bus umum jenis bus AKDP (Antar Kota Dalam Provinsi) dan Angkutan Pedesaan.",
    "Objek wisata Curug Gringsing lokasinya tak jauh dari pusat kota dan pusat pemerintahan Kabupaten Purbalingga. Bagi wisatawan yang datang ke tempat ini dapat sekaligus mampir dan berswafoto ke alun-alun dan masjid agung Purbalingga karena lokasinya yang tak begitu jauh dari tempat wisata ini.",
    "Tidak lengkap rasanya kalau ke Purbalingga jika tidak mengunjungi terminal Purbalingga yang satu ini, terminal ini merupakan salah satu terminal angkutan umum yang berada di wilayah Kabupaten Purbalingga Provinsi Jawa Tengah. ",
    "Taman Edukasi Keselamatan Jalan atau dikenal dengan Taman Lalu Lintas yang ada di Terminal Bulupitu Purwokerto, merupakan tempat edukasi lalu lintas dengan media pembelajaran yang sangat asyik untuk masyarakat. Masyarakat dapat bermain dan belajar di tempat ini. Terlebih saat ini, taman lalu lintas yang dikelola Dinas Perhubungan (Dinhub) Kabupaten Banyumas, sudah dilengkapi dengan pohon rambu dan traffic light.",
    "Taman Andhang Pangrenan merupakan fasilitas umum dan tempat rekreasi yang multifungsi. Merupakan ruang terbuka hijau di sisi selatan Kota Purwokerto, dengan fasilitas yang cukup lengkap dan bisa di manfaatkan untuk berbagai keperluan oleh masyarakat umum. Taman Andhang Pangrenan ini cukup rindang dengan berbagai jenis pepohonan dan tanaman bunga, dan juga ada berbagai mainan anak. ",
    "Rita Supermall merupakan mall pertama di Kota Purwokerto. Terletak di tengah kota tepat di depan alun-alun yang berada didepan Pendopo Kabupaten. Didalamnya terdapat macam-macam gallery yang dapat memenuhi segala kebutuhan masyaraka, diantaranya :  Area makan, Bioskop CGV Cinemas, Area Pakaian, Area belanja bahan pokok, Area bermain, dan masih banyak lagi lainnya.",
    "Selain menjadi pusat kota, alun-alun yang satu ini sudah menjadi icon tersendiri bagi masyarakat Kota Purwokerto. Alun-alun Purwokerto ini dapat dijadikan tempat bermain yang sangat menarik, anda dapat mengambil foto di tempat ini dikarenakan tempat ini sangat instagramable.",
    "Untuk tempat ibadah, anda tidak perlu khawatir ketika bermain di Alun-alun Purwokerto karena disamping Alun-alun Purwokerto ini terdapat masjid yang sangat luas, megah  dan nyaman yaitu Masjid Agung Baitussalam Purwokerto.",
    "Purwokerto merupakan kota tempat berdirinya cikal-bakal Bank BRI (Bank Rakyat Indonesia) yang didirikan oleh Raden Bei Aria Wirjaatmadja pada tanggal 16 Desember 1895, merupakan Bank terbesar milik Pemerintah. Nah gedung lama dan pertama Bank BRI tersebut kini menjadi satu-satunya Museum BRI dan tempatnya kini dapat anda kunjungi di Purwokerto. Didalam museum ini terdiri dari tiga monumen yaitu Gedung Replika, Patung Raden Aria Wirjaatmadja, Gedung Museum BRI.",
    "Pasar tradisional biasanya identik dengan lingkungan kotor, becek, tidak rapi, bahkan jorok. Namun berbeda dengan Pasar Manis Purwokerto, Kabupaten Banyumas. Pasar tradisional ini bersih, rapi, dan pengunjung bisa menggunakan troli belanja layaknya di supermarket. Lebih menariknya lagi, Di pasar ini para pengunjung tidak perlu bingung ketika mencari bahan kebutuhan. Papan penunjuk jenis dagangan terpampang di titik-titik pasar. Barang dagangan sengaja dikelompokkan sesuai dengan jenisnya untuk memudahkan pengunjung Pasar Manis.",
    "Taman Usman Janatin City Park (UJCP) atau biasa disebut Usman Janatin menjadi taman kota sekaligus wahana wisata baru yang murah.taman ini didirikan untuk mengenang sosok pahlawan nasional asal Desa Jatisaba, Kecamatan Purbalingga, yang bernama Usman Janatin  yang gantung di Singapura pada 17 Oktober 1968, Pemkab Purbalingga mengabadikannya sebagai nama taman kota.  Selain taman ini dihias oleh pepohonan, taman seluas 16.000 meter persegi ini dilengkapi wahana permainan, di antaranya, worm coaster, istana balon, sepeda roda tiga dan kereta mini.",
    "Ruang Terbuka Hijau Bojong yang dibangun oleh Pemkab Purbalingga ini sangat pas untuk anda yang ingin melepas lelah dan bersantai dengan keluarga. RTH ini dapat dijadikan sebagai tempat refreshing yang nyaman, khususnya bagi masyarakat dan pelajar yang membutuhkan ketenangan tempat  untuk belajar dan santai.",
  ];
  var imgList = [
    "assets/bogar.jpg",
    "assets/bukateja.jpg",
    "assets/gringsing.jpg",
    "assets/terminalpurbalingga.jpg",
    "assets/bulupitu.jpg",
    "assets/andhang.jpg",
    "assets/ritamall.jpg",
    "assets/purwokerto.jpg",
    "assets/masjid-agung-purwokerto.jpg",
    "assets/museum-bri.jpg",
    "assets/pasar-manis.jpg",
    "assets/usman-janatin.jpg",
    "assets/rth-bojong.jpg"
  ];
  var alamatList = [
    "Karangcengis, Bukateja, Purbalingga, Jawa Tengah",
    "Jl. Argandaru, Dusun 3, Bukateja, Kec. Bukateja, Kabupaten Purbalingga, Jawa Tengah",
    "Purbalingga Kidul,Kec. Purbalingga, Kabupaten Purbalingga, Jawa Tengah",
    "JL. Jendral Ahmad Yani No.4, Karangpoh Kulon, Kalikabong, Kec. Kalimanah, Kabupaten Purbalingga, Jawa Tengah",
    "Karanggayam, Teluk, Purwokerto Selatan, Kabupaten Banyumas, Jawa Tengah",
    "Jalan Gerilya Purwokerto Selatan, Windusara, Karangklesem, Kec. Banyumas, Kabupaten Banyumas, Jawa Tengah",
    "Jl. Jend. Soedirman No.296, Pereng, Sokanegara, Kec. Purwokerto Tim., Kabupaten Banyumas, Jawa Tengah",
    "JL. Jend. Sudirman, Purwokerto Lor,  Kec. Purwokerto Timur, Kabupaten Banyumas, Jawa Tengah",
    "JL. Jend. Sudirman, Purwokerto Lor,  Kec. Purwokerto Timur, Kabupaten Banyumas, Jawa Tengah",
    "Jl. Jend. Soedirman No.57, Pesayangan, Kedungwuluh, Kec. Purwokerto Barat, Kabupaten Banyumas, Jawa Tengah",
    "Pesayangan, Pasar manis, Purwokerto Barat, Kabupaten Banyumas, Jawa Tengah",
    "Jl. Komisaris Noto Sumarsono No.21, Purbalingga Kidul, Kec. Purbalingga, Kabupaten Purbalingga, Jawa Tengah",
    "Bojong, Purbalingga, Kabupaten Purbalingga, Jawa Tengah"
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: AppBar(
        title: Text('Eduwisata Trans Jateng',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFFff0000),
      ),
      body: ListView.builder(
          itemCount: imgList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                showDialogFunc(
                    context, imgList[index], titleList[index], descList[index]);
              },
              child: Card(
                  child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.asset(imgList[index]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          titleList[index],
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: width,
                          child: Text(
                            alamatList[index],
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[500],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )),
            );
          }),
    );
  }
}

showDialogFunc(context, img, title, desc) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.8,
              height: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    //tmpilin gambar popup
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      img,
                      width: 300,
                      height: 200,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ), //kasih jarak dari huruf ke gambar
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    desc,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
