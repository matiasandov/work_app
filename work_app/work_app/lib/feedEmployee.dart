import 'package:flutter/material.dart';
import 'package:work_app/notificationsE.dart';
import 'categoriesFeedE.dart';

class feedEmployee extends StatefulWidget {
  const feedEmployee({Key? key}) : super(key: key);

  @override
  _feedEmployeeState createState() => _feedEmployeeState();
}

class _feedEmployeeState extends State<feedEmployee> {

  int _pageIndex = 0;
  late PageController _pageController;

  List<Widget> tabPages = [
    Screen1(),
    Screen2(),

  ];

  @override
  void initState(){
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
    this._pageController.animateToPage(index,duration: const Duration(milliseconds: 500),curve: Curves.easeInOut);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Jobs opportunities"),
      ),


      bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(0xFF004FEE),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withOpacity(.60),
            selectedFontSize: 14,
            unselectedFontSize: 14,
        onTap: onTabTapped,
            items: [
              BottomNavigationBarItem(
                title: Text('Feed'),
                icon: Icon(Icons.feed),
              ),
              BottomNavigationBarItem(
                title: Text('Requests and Offers'),
                icon: Icon(Icons.notifications),

              ),

            ],
          ),
      body: PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),

      );

  }


}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  categoriesFeed(userType:'employee');
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return notificationsE();

  }
}