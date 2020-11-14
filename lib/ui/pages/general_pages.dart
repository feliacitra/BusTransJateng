part of 'pages.dart';

class GeneralPage extends StatelessWidget {
  final String title;
  final Function onBackButtonPressed;
  final Widget child;
  final Color backColor;

  GeneralPage({
    this.title = "Bus Trans Jateng",
    this.onBackButtonPressed,
    this.child,
    this.backColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: "FAF9FE".toColor(),
          ),
          SafeArea(
            child: Container(
              color: backColor ?? "FAF9FE".toColor(),
            ),
          ),
          SafeArea(
              child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    height: 55,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        onBackButtonPressed != null
                            ? GestureDetector(
                                onTap: () {
                                  if (onBackButtonPressed != null) {
                                    onBackButtonPressed();
                                  }
                                },
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/arrow.png'),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                width: 20,
                                height: 20,
                              ),
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                        )
                      ],
                    ),
                  ),
                  child ?? SizedBox()
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }
}
