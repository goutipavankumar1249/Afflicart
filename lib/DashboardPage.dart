import 'package:flutter/material.dart';
import 'package:project/AboutUsPage.dart';
import 'package:project/CashBackPage.dart';
import 'package:project/ContactUsPage.dart';
import 'package:project/FeaturedStoresPage.dart';
import 'package:project/KnowMorePage.dart';
import 'package:project/LandingPage.dart';
import 'package:project/LoginPage.dart';
import 'package:project/MyEarningsPage.dart';
import 'package:project/UserProfile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  final PageController _pageController = PageController();

  final List<Widget> _pages = [
  SafeArea(
    child: LandingPage(onShopNow: () => _changePage(2)),
  ),
  SafeArea(
    child: MyEarningsPage(),
  ),
  SafeArea(
    child: FeaturedStoresPage(),
  ),
  SafeArea(
    child: UserProfile(),
  ),
  SafeArea(
    child: CashbackPage(),
  ),
];

  final List<String> _titles = [
    '',
    'My Earnings',
    'Stores',
    'User Profile',
    'Help',
  ];

  static _DashboardState? _instance;

  _DashboardState() {
    _instance = this;
  }

  static void _changePage(int index) {
    _instance?.setState(() {
      _instance!._selectedIndex = index;
    });
    _instance?._pageController.jumpToPage(index);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  void _onDrawerItemTapped(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(170, 206, 144, 1),
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _titles[_selectedIndex],
                style: GoogleFonts.poppins(
                  color: Colors.green[700],
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 45), 
            ],
          ),
          titleSpacing: 0,
          toolbarHeight: 55,
        ),
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              children: _pages,
            ),
            Positioned(
              left: 15,
              right: 15,
              bottom: 12,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    currentIndex: _selectedIndex,
                    selectedItemColor: Colors.green,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    onTap: _onItemTapped,
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.attach_money),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.shopping_cart),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.help_outline),
                        label: '',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        drawer: Drawer(
          child: Container(
            color: const Color.fromRGBO(170, 206, 144, 1),
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                
                ListTile(
                  leading: Icon(Icons.info, color: Colors.white),
                  title: Text('About Us', style: GoogleFonts.poppins(color: Colors.white)),
                  onTap: () {
                    _onDrawerItemTapped(AboutUsPage());
                  },
                ),
                ListTile(
                  leading: Icon(Icons.contact_page, color: Colors.white),
                  title: Text('Contact Us', style: GoogleFonts.poppins(color: Colors.white)),
                  onTap: () {
                    _onDrawerItemTapped(ContactUsPage());
                  },
                ),
                ListTile(
                  leading: Icon(Icons.person, color: Colors.white),
                  title: Text('Know More', style: GoogleFonts.poppins(color: Colors.white)),
                  onTap: () {
                    _onDrawerItemTapped(KnowMorePage());
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.white),
                  title: Text('Log Out', style: GoogleFonts.poppins(color: Colors.white)),
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
