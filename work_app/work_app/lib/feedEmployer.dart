import 'package:flutter/material.dart';

import 'categoriesFeedE.dart';
import 'notificationsR.dart';

class feedEmployer extends StatefulWidget {
  const feedEmployer({Key? key}) : super(key: key);

  @override
  _feedEmployerState createState() => _feedEmployerState();
}

class _feedEmployerState extends State<feedEmployer> {
  int _pageIndex = 0;
  late PageController _pageController;

  List<Widget> tabPages = [
    Screen1(),
    Screen2(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Find employees"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.cyan,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          onTap: onTabTapped,
          items: [
            BottomNavigationBarItem(
              label: 'Feed',
              icon: Icon(Icons.feed),
            ),
            BottomNavigationBarItem(
              label: 'Requests and Offers',
              icon: Icon(Icons.notifications),
            ),
          ],
        ),
        body: PageView(
          children: tabPages,
          onPageChanged: onPageChanged,
          controller: _pageController,
        ),
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return categoriesFeed(userType: 'employer');
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return notificationsScreenR();
  }
}
