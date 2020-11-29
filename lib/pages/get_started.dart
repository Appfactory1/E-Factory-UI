import 'package:app_shoe_shop/widgets/Drawer.dart';
import 'package:app_shoe_shop/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class GetStarted extends StatefulWidget {
  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Talabgaar, Let’s donate!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text":
          "We help people donate the food \naround Pakistan to those who need it",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We also let you donate \nclothes and other such things",
      "image": "assets/images/splash_3.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        drawer: MyDrawer(),
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: splashData.length,
                    itemBuilder: (context, index) => SplashContent(
                      image: splashData[index]["image"],
                      text: splashData[index]['text'],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7),
                    child: Column(
                      children: <Widget>[
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            splashData.length,
                            (index) => buildDot(index: index),
                          ),
                        ),
                        Spacer(flex: 3),
                        DefaultButton(
                          text: "Continue",
                          press: () {
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => Something()));;
                          },
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? Color(0xFFFF7643) : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          "TALABGAAR",
          style: TextStyle(
            fontSize: 30,
            color: Colors.yellow,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 2),
        Image.asset(
          image,
          height: 240,
          width: 200,
        ),
      ],
    );
  }
}
