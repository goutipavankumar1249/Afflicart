import 'package:flutter/material.dart';
import 'package:project/AboutUsPage.dart';
import 'package:project/ContactUsPage.dart';
import 'package:project/FeaturedStoresPage.dart';
import 'package:project/HomePage.dart';
import 'package:project/KnowMorePage.dart';
import 'package:project/UserProfile.dart';
import 'MyEarningsPage.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _bottomNavIndex = 0;
  int _sideDrawerIndex = 0;

  final List<Widget> _bottomNavPages = [
    HomePage(),
    MyEarningsPage(),
    FeaturedStoresPage(),
    UserProfile(),
    KnowMorePage()
  ];

  final List<Widget> _sideDrawerPages = [
    HomePage(),
    MyEarningsPage(),
    KnowMorePage(),
    ContactUsPage(),
    AboutUsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.1,
        shadowColor: Colors.black.withOpacity(0.9),
        title: Row(
          children: [
            Image.asset('assets/images/Logo.png', height: 60),
            Spacer(),
            Icon(Icons.notifications_active_outlined),
            SizedBox(
              width: 10,
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                _navigateToSideDrawerPage(0);
              },
              selected: _sideDrawerIndex == 0, // Check if this item is active
              selectedTileColor: Colors.green.shade800,
              selectedColor: Colors.black, // Set the color for the active item
              // Set the color for the active item
            ),
            ListTile(
              leading: Icon(Icons.attach_money_rounded),
              title: Text('Earnings'),
              onTap: () {
                _navigateToSideDrawerPage(1);
              },
              selected: _sideDrawerIndex == 1,
              selectedTileColor: Colors.green.shade800,
              selectedColor: Colors.black, // Set the color for the active item
// Set the color for the active item
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                _navigateToSideDrawerPage(2);
              },
              selected: _sideDrawerIndex == 2,
              selectedTileColor: Colors.green.shade800,
              selectedColor: Colors.black, // Set the color for the active item
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('About Us'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => AboutUsScreen()),
                // );
              },
              selectedTileColor: Colors.green.shade800,
              selectedColor: Colors.black, // Set the color for the active item
              // Set the color for the active item
            ),
            ListTile(
              leading: Icon(Icons.contact_page_outlined),
              title: Text('Contact Us'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => contactus()),
                // );
              },
              selectedTileColor: Colors.green.shade800,
              selectedColor: Colors.black, // Set the color for the active item
              // Set the color for the active item
            ),
          ],
        ),
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 99, 112, 100),
        items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.attach_money_rounded),
              label: 'Earnings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_rounded),
              label: 'Stores',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.help_outline_rounded),
              label: 'More',
            ),
          ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        unselectedLabelStyle: TextStyle(color: Colors.white),
        currentIndex: _bottomNavIndex,
        onTap: (index) {
          _navigateToBottomNavBarPage(index);
        },
      ),
    );
  }

  Widget _buildBody() {
    if (_bottomNavIndex >= 0 && _bottomNavIndex < _bottomNavPages.length) {
      return _bottomNavPages[_bottomNavIndex];
    } else {
      return Center(
        child: Text('Invalid Page Index $_bottomNavIndex'),
      );
    }
  }

  void _navigateToBottomNavBarPage(int index) {
    setState(() {
      if (index >= 0 && index < _bottomNavPages.length) {
        _bottomNavIndex = index;
        _sideDrawerIndex = index;
      }
    });
  }

  void _navigateToSideDrawerPage(int index) {
    setState(() {
      if (index >= 0 && index < _sideDrawerPages.length) {
        _bottomNavIndex = index;
        _sideDrawerIndex = index;
      }
    });
    Navigator.of(context).pop();
  }
}
