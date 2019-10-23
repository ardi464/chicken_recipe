import 'package:bubblebar/page/about.dart';
import 'package:bubblebar/page/beranda.dart';
import 'package:bubblebar/page/favorit.dart';
// import 'package:bubblebar/page/recipe.dart';
// import 'package:bubblebar/page/recipe.dart';
import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bubber Bar",
      theme: ThemeData(primaryColor: Colors.red, accentColor: Colors.yellow),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    Beranda(),
    Favorit(),
    About()
  ]; // Our first view in viewport

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        hasInk: true, //new, gives a cute ink effect
        inkColor: Colors.black12, //optional, uses theme color if not specified
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
            backgroundColor: Colors.red,
            icon: Icon(
              Icons.fastfood,
              color: Colors.grey
            ),
            activeIcon: Icon(
              Icons.fastfood,
              color: Colors.red,
            ),
            title: Text("Recipe"),
          ),
          BubbleBottomBarItem(
            backgroundColor: Colors.deepPurple,
            icon: Icon(
              Icons.favorite,
              color: Colors.grey,
            ),
            activeIcon: Icon(
              Icons.favorite,
              color: Colors.deepPurple,
            ),
            title: Text("Favorite"),
          ),
          BubbleBottomBarItem(
            backgroundColor: Colors.green,
            icon: Icon(
              Icons.people,
              color: Colors.grey,
            ),
            activeIcon: Icon(
              Icons.people,
              color: Colors.green
            ),
            title: Text("About"),
          ),
        ],
      ),
    );
  }
}
