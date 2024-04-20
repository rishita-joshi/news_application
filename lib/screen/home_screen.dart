import 'package:flutter/material.dart';
import 'package:news_app/components/news_data_screen.dart';
import 'package:news_app/provider/basic_provider.dart';
import 'package:news_app/screen/bookmark_screen.dart';
import 'package:news_app/screen/settings_screem.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    NBAllNewsComponent(),
    Text("Search here"),
    BookMarkScreen(),
    SettingFragment(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<BasicProvider>(builder: (context, providerObj, child) {
      return Scaffold(
          backgroundColor: providerObj.isdark ? Colors.grey[900] : Colors.white,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            type: BottomNavigationBarType.fixed,
            onTap: _onItemTapped,
            backgroundColor: providerObj.isdark ? Colors.grey[900] : Colors.white,
            selectedItemColor: Colors.orangeAccent.shade700,
            //Theme.of(context).primaryColor,
            unselectedItemColor: Colors.grey,
            // selectedIconTheme: IconThemeData(color: Theme.of(context).primaryColor),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                //  activeIcon: Icon(Icons.abc , color: Theme.of(context).primaryColor,),
                icon: Icon(Icons.search_outlined),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: 'BookMark',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Profile',
              ),
            ],
          ),
          key: _scaffoldKey,
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ));
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
