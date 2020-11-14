part of 'pages.dart';

class Radio extends StatelessWidget {
  double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;
  double getBigDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, //atur warna bg abu2
      body: Stack(
        children: [
          Positioned(
            right: -getSmallDiameter(context) / 3,
            top: -getSmallDiameter(context) / 3,
            child: Container(
              width: getSmallDiameter(context),
              height: getSmallDiameter(context),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    colors: [Color(0xFF4d0000), Color(0xFFff1a1a)],
                    end: Alignment.bottomCenter),
              ),
            ),
          ),
          Positioned(
            left: -getSmallDiameter(context) / 2.9,
            top: -getSmallDiameter(context) / 2.9,
            child: Container(
              width: getBigDiameter(context),
              height: getBigDiameter(context),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    colors: [Color(0xFF4d0000), Color(0xFFe60000)],
                    end: Alignment.bottomCenter),
              ),
            ),
          ),
          Positioned(
            //biar posisi lingkarannya bisa pindah
            right: -getBigDiameter(context) / 2,
            bottom: -getBigDiameter(context) / 2,
            child: Container(
              //container di refaktor wrap with wiget, berinama positioned
              width: getBigDiameter(context),
              height: getBigDiameter(context),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xFFffb3b3)),
            ),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 230, 20, 10),
                    child: Text(
                        "Hai, ingin tahu informasi update dari Bus Trans Jateng?",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFFff0000),
                          fontSize: 25,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 25, 20, 10),
                    child: Text("Yuk cari tahu dengan klik dibawah ini...",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFff0000),
                          fontSize: 17,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 78),
                    child: Row(
                      children: [
                        LaunchButton(() async {
                          await openUrl(
                              'https://instagram.com/radiotransjateng?igshid=wogl0h470wd3');
                        }),
                        Text(
                          '@radiotransjateng',
                          style: GoogleFonts.dmSans(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}

class LaunchButton extends StatelessWidget {
  final Function onTap;
  LaunchButton(this.onTap);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FloatingActionButton(
        onPressed: onTap,
        mini: true,
        elevation: 0,
        child: Image(
          image: AssetImage("assets/instagram.png"),
        ),
      ),
    );
  }
}

Future<void> openUrl(String url,
    {bool forceWebView = false, bool enableJavaScript = false}) async {
  await launch(url);
}
