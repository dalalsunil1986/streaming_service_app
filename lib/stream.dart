import 'package:flutter/material.dart';
import 'stream.dart';

class StreamPage extends StatefulWidget {
  @override
  _StreamPageState createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            StreamScreenTopPart(),
            StreamScreenBottomPart(),
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

class StreamScreenTopPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420.0,
      child: Stack(
        children: <Widget>[
          Container(
            height: 370.0,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, 10.0),
                  blurRadius: 10.0
                ),
              ]
            ),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  "assets/images/punisher.jpg",
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Positioned(
                  top: 40.0, left: 25.0,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(
                        width: 60.0,
                      ),
                      Text(
                        "Marvel's The Punisher",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontFamily: "SF-Pro-Display-Bold"
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0x00000000),
                        const Color(0xd9333333)
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
                          "S2:E1",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "SF-Pro-Display-Bold",
                            fontSize: 15.0
                          ),
                        ),
                        Text(
                          "Redhouse Blues",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "SF-Pro-Display-Bold",
                            fontSize: 45.0
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 120, left: 170.0,
                  child: Icon(
                    Icons.play_circle_outline,
                    color: Colors.white,
                    size: 60.0,
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

class StreamScreenBottomPart extends StatelessWidget {


  List<String> images = [
    "assets/images/punisher.jpg",
    "assets/images/s2e2.jpg",
    "assets/images/s2e3.jpg",
    "assets/images/s2e4.jpg",
    "assets/images/s2e5.jpg",
  ];

  List<String> episode = ["S2:E1", "S2:E2", "S2:E3", "S2:E4", "S2:E5"];
  List<String> titles = ["Roadhouse blues", "Fight or Flight", "Trouble the Water", "Scar Tissues", "One-Eyed Jacks"];

  List<Widget> episodes() {
    List<Widget> episodeList = new List();
    for (int i = 0; i < 5; i++) {
      var episodeItem = Padding(
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
                  episode[i],
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: "SF-Pro-Display-Bold"
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(titles[i]),
              ),
            ],
          ),
        ),
      );
      episodeList.add(episodeItem);
    }
    return episodeList;
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          child: Padding(
            padding: EdgeInsets.only(left: 95.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Episode info",
                style: TextStyle(
                  fontSize: 22.0,
                  fontFamily: "SF-Pro-Display-Bold"
                )
              ),
            ),
          ),
        ),
        SizedBox(height: 20.0,),
        SizedBox(
          child: Padding(
            padding: EdgeInsets.only(left: 95.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "While driving through Michigan, Frank stops\nfor a beer at a roadside bar. But staying out of \ntrouble has never been his strong suit.",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13.0,
                  fontFamily: "SF-Pro-Display-Bold"
                )
              ),
            ),
          ),
        ),
        SizedBox(height: 40.0),
        SizedBox(
          child: Padding(
            padding: EdgeInsets.only(left: 95.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "More episodes",
                style: TextStyle(
                  fontSize: 22.0,
                  fontFamily: "SF-Pro-Display-Bold"
                )
              ),
            ),
          ),
        ),
        Container(
          height: 250.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: episodes(),
          ),
        ),
      ],
    );
  }
}