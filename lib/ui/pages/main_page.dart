import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';
// import 'package:location/location.dart';
import 'package:bus_trans_jateng/ui/pages/bus_terdekat.dart';
import 'package:bus_trans_jateng/ui/pages/halteterdekat_page.dart';
import 'package:bus_trans_jateng/ui/pages/literasi_page.dart';
import 'package:bus_trans_jateng/ui/pages/about_us.dart';
import 'package:bus_trans_jateng/ui/pages/eduwisata_page.dart';
import 'package:bus_trans_jateng/ui/pages/rute_page.dart';
import 'package:bus_trans_jateng/ui/pages/radiotrans_page.dart';
import 'package:bus_trans_jateng/ui/pages/visi.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // final Location location = Location();

  // PermissionStatus _permissionGranted;
  // Future<void> _requestPermission() async {
  //   if (_permissionGranted != PermissionStatus.granted) {
  //     final PermissionStatus permissionRequestedResult =
  //         await location.requestPermission();
  //     setState(() {
  //       _permissionGranted = permissionRequestedResult;
  //     });
  //   }
  // }

  // void initSate() {
  //   _requestPermission();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Container(
          color: "FAF9FE".toColor(),
        ),
        SafeArea(
            child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(right: 50, left: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 61,
                  width: 233,
                  margin: EdgeInsets.only(top: 40),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/logo.png'),
                        fit: BoxFit.contain),
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Koridor 1 Purwokerto - Purbalingga',
                  style: GoogleFonts.dmSans(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                //container menu baris 1
                margin: EdgeInsets.only(top: 40),
                child: Row(
                  //tombol menu berupa baris
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Bus()));
                      },
                      child: Container(
                        //container bus terdekat
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                            //bikin kotak button bus terdekat
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: "585464".toColor().withOpacity(0.07),
                                  blurRadius: 16,
                                  offset: Offset(0.0, 4.0))
                            ]),
                        child: Column(
                          //kolom diisi icon dan tulisan
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              margin: EdgeInsets.only(
                                  bottom: 5), //kasih jarak buat tulisan
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/bus_icon.png'))),
                            ),
                            Text(
                              'Bus',
                              style: GoogleFonts.dmSans(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              'Terdekat',
                              style: GoogleFonts.dmSans(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      //Halte Tedekat
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Halte()));
                      },
                      child: Container(
                        //container halte terdekat
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: "585464".toColor().withOpacity(0.07),
                                  blurRadius: 16,
                                  offset: Offset(0.0, 4.0))
                            ]),
                        child: Column(
                          //kolom diisi icon dan tulisan
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              margin: EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/halte-red.png'))),
                            ),
                            Text(
                              'Halte',
                              style: GoogleFonts.dmSans(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              'Terdekat',
                              style: GoogleFonts.dmSans(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                //container buat menu baris 2
                margin: EdgeInsets.only(top: 40),
                child: Row(
                  //untuk menu baris 2
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Rute()));
                      },
                      child: Container(
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: "565464".toColor().withOpacity(0.07),
                                  blurRadius: 16,
                                  offset: Offset(0.0, 4.0))
                            ]),
                        child: Column(
                          //kolom diisi icon dan tulisan
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              margin:
                                  EdgeInsets.only(bottom: 5), //jarak dg tulisan
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/rute-red.png'))),
                            ),
                            Text(
                              'Rute Bus',
                              style: GoogleFonts.dmSans(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Eduwisata()));
                      },
                      child: Container(
                        //container eduwisata trans jateng
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: "585464".toColor().withOpacity(0.07),
                                  blurRadius: 16,
                                  offset: Offset(0.0, 4.0))
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              margin: EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/guide-red.png'))),
                            ),
                            Text(
                              'Eduwisata',
                              style: GoogleFonts.dmSans(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              'Trans Jateng',
                              style: GoogleFonts.dmSans(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                //container buat menu baris 3
                margin: EdgeInsets.only(top: 40),
                child: Row(
                  //untuk menu baris 3
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Literasi()));
                      },
                      child: Container(
                        //container Pogram Liteasi
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: "565464".toColor().withOpacity(0.07),
                                  blurRadius: 16,
                                  offset: Offset(0.0, 4.0))
                            ]),
                        child: Column(
                          //kolom diisi icon dan tulisan
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              margin:
                                  EdgeInsets.only(bottom: 5), //jarak dg tulisan
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/literasi-red.png'))),
                            ),
                            Text(
                              'Program',
                              style: GoogleFonts.dmSans(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              'Literasi',
                              style: GoogleFonts.dmSans(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      //radio trans jateng
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RadioTrans()));
                      },
                      child: Container(
                        //container Radio Trans Jateng
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: "585464".toColor().withOpacity(0.07),
                                  blurRadius: 16,
                                  offset: Offset(0.0, 4.0))
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              margin: EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/instagram-logo.png'))),
                            ),
                            Text(
                              'Radio',
                              style: GoogleFonts.dmSans(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              'Trans Jateng',
                              style: GoogleFonts.dmSans(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                //container buat menu baris 4
                margin: EdgeInsets.only(top: 40),
                child: Row(
                  //untuk menu baris 4
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VisiMisi()));
                      },
                      child: Container(
                        //container Pogram visi
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: "565464".toColor().withOpacity(0.07),
                                  blurRadius: 16,
                                  offset: Offset(0.0, 4.0))
                            ]),
                        child: Column(
                          //kolom diisi icon dan tulisan
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 55,
                              margin:
                                  EdgeInsets.only(bottom: 5), //jarak dg tulisan
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/target.PNG'))),
                            ),
                            Text(
                              'Visi Misi',
                              style: GoogleFonts.dmSans(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      //about us
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => About()));
                      },
                      child: Container(
                        //container about us
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: "585464".toColor().withOpacity(0.07),
                                  blurRadius: 16,
                                  offset: Offset(0.0, 4.0))
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              margin: EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/about-red.png'))),
                            ),
                            Text(
                              'Developer',
                              style: GoogleFonts.dmSans(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ))
      ],
    ));
  }
}

// showdialog(){

// }
