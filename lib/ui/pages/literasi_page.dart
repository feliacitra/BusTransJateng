import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';

class Literasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Program Literasi', style: TextStyle(color: Colors.white)),
      //   backgroundColor: Color(0xFFff0000),
      // ),
      body: Stack(
        children: [
          Container(
            color: "FAF9FE".toColor(),
          ),
          Column(
            children: [
              Container(
                height: 160,
                width: 500,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/literasi-brt.PNG'),
                      fit: BoxFit.cover),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 140, 20, 10),
                  child: Text(
                      "BRT Trans Jateng membuka lebar bagi masyarakat yang ingin mencari sumber infromasi mengenai Bus Trans Jateng, diantaranya : ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFe6005c),
                        fontSize: 17,
                      )),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage('assets/ceklis.png'),
                              fit: BoxFit.contain,
                            )),
                          ),
                        ],
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              '     Magang             ',
                              style: GoogleFonts.dmSans(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage('assets/ceklis.png'),
                              fit: BoxFit.contain,
                            )),
                          ),
                        ],
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              '     PKL                     ',
                              style: GoogleFonts.dmSans(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage('assets/ceklis.png'),
                              fit: BoxFit.contain,
                            )),
                          ),
                        ],
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              '     Penelitian        ',
                              style: GoogleFonts.dmSans(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage('assets/ceklis.png'),
                              fit: BoxFit.contain,
                            )),
                          ),
                        ],
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              '     Skripsi               ',
                              style: GoogleFonts.dmSans(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage('assets/ceklis.png'),
                              fit: BoxFit.contain,
                            )),
                          ),
                        ],
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              '     Pasca Sarjana',
                              style: GoogleFonts.dmSans(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage('assets/ceklis.png'),
                              fit: BoxFit.contain,
                            )),
                          ),
                        ],
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              '     Vlog                   ',
                              style: GoogleFonts.dmSans(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage('assets/ceklis.png'),
                              fit: BoxFit.contain,
                            )),
                          ),
                        ],
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              '     Dokumentasi  ',
                              style: GoogleFonts.dmSans(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                      "- LEARNING KNOWLEDGE - EXPERIENCE SKILL - COMPETENCE ABILITY - TRAINING GROWTH -",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFe6005c),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(35, 10, 20, 10),
                  child: Text("Contact us :",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      )),
                ),
                Container(
                  //untuk email
                  margin: EdgeInsets.fromLTRB(10, 10, 50, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color:
                                          "585464".toColor().withOpacity(0.5),
                                      blurRadius: 10,
                                      offset: Offset(0.0, 4.0))
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              AssetImage('assets/phone.PNG'))),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              '     M. Nur : +6285726474342',
                              style: GoogleFonts.dmSans(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
