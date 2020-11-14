part of 'pages.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      //tampilan awal keseluruhan
      title: 'Developer',
      backColor: "white".toColor(),
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: [
          Center(
            child: Text(
              'Tentang Developer',
              style: GoogleFonts.dmSans(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Container(
              height: 200,
              width: 233,
              margin: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/hai.PNG'),
              )),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Aplikasi ini dibuat untuk menyelesaikan Tugas Akhir / Skripsi guna mendapatkan gelar Sarjana Komputer",
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Apabila ada saran mengenai aplikasi ini, silahkan hubungi :",
              textAlign: TextAlign.center,
            ),
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
                                color: "585464".toColor().withOpacity(0.5),
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
                                    image: AssetImage('assets/email.PNG'))),
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
                        '     feliacitra28@gmail.com',
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
          Container(
            //untuk telpone
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
                                color: "585464".toColor().withOpacity(0.5),
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
                              image: AssetImage('assets/phone.PNG'),
                              fit: BoxFit.contain,
                            )),
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
                        '     +6282326080937           ',
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
    );
  }
}
