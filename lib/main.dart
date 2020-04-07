import 'package:flutter/material.dart';
import 'stream.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Streaming Service App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HomeScreenTopPart(),
            HomeScreenBottomPart(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, color: Color(0xffe52020)), 
            title: Text("Home", style: TextStyle(color: Color(0xffe52020)),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search,),
            title: Text('')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border,),
            title: Text('')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline,),
            title: Text('')
          ),          
        ]
      ),
    );
  }
}

class HomeScreenTopPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: Mclipper(),
            child: Container(
              height: 370.0,
              decoration: BoxDecoration(
                color: Colors.white, 
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, 10.0),
                    blurRadius: 10.0
                  )
                ]
              ),
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    "assets/images/banner.png",
                    fit: BoxFit.cover,
                    width: double.infinity
                  ),
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0x00000000),
                          const Color(0xD9333333)
                        ],
                        stops: [
                          0.0,
                          0.9
                        ],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(0.0, 1.0)
                      )
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 120.0, left: 95.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "WATCH BEFORE EVERYONE",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontFamily: "SF-Pro-Display-Bold"
                            ),
                          ),
                          Text(
                            "The Punisher: Season 2",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40.0,
                              fontFamily: "SF-Pro-Display-Bold"
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 370.0,
            right: -20,
            child: FractionalTranslation(
              translation: Offset(0.0, -0.5),
              child: Row(
                children: <Widget>[
                  FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () {},
                    child: Icon(
                      Icons.add,
                      color: Color(0xffe52020),
                    ),
                  ),
                  SizedBox(width: 12.0,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => StreamPage())
                        );
                      },
                      color: Color(0xffe52020),
                      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 80),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Watch Now",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontFamily: "SF-Pro-Display-Bold"
                            ),
                          ),
                          SizedBox(width: 5.0,),
                          RotatedBox(
                            quarterTurns: 2,
                            child: Icon(CustomIcons.back_icon, size: 25.0, color: Colors.white,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeScreenBottomPart extends StatelessWidget {

  List<String> images = [
    "assets/images/runaways.jpg",
    "assets/images/avengers.jpg",
    "assets/images/blackpanther.jpg",
  ];

  List<String> titles = ["Runaways", "Avengers: infinity war", "Black Panther"];

  List<Widget> movies() {
    List<Widget> movieList = new List();
    for (int i = 0; i < 3; i++) {
      var movieItem = Padding(
        padding: EdgeInsets.symmetric(
          vertical: 25.0, horizontal: 12.0
        ),
        child: Container(
          height: 220.0,
          width: 135.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                offset: Offset(0.0,10.0)
              )
            ]
          ),
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0)
                ),
                child: Image.asset(
                  images[i],
                  width: double.infinity,
                  height: 130.0,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4.0, left: 8.0, right: 8.0),
                child: Text(
                  titles[i],
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: "SF-Pro-Display-Bold"
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(i == 0 ? "Season 2" : ""),
              ),
            ],
          ),
        ),
      );
      movieList.add(movieItem);
    }
    return movieList;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360.0,
      margin: EdgeInsets.only(left: 65.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Watch Now",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontFamily: "SF-Pro-Display-Bold"
                  ),
                ),
                FlatButton(
                  child: Text(
                    "View more"
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Container(
            height: 250.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: movies(),
            ),
          )
        ],
      )
    );
  }
}

class CustomIcons {
  static const IconData menu = const IconData(0xe901, fontFamily: "CustomFont");
  static const IconData back_icon = const IconData(0xe900, fontFamily: "back_icon");
}

class Mclipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 100.0);
    var controlpoint = Offset(35.0, size.height);
    var endpoint = Offset(size.width/2, size.height);

    path.quadraticBezierTo(controlpoint.dx, controlpoint.dy, endpoint.dx, endpoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
