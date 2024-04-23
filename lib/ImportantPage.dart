import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImportantPage extends StatefulWidget {
  @override
  _ImportantPageState createState() => _ImportantPageState();
}

class _ImportantPageState extends State<ImportantPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ShopPage(), // Placeholder for ShopPage
    ProfilePage(), // Placeholder for ProfilePage
    // SettingsPage(), // Placeholder for SettingsPage
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                // Handle sidebar navigation
              },
            ),
            SizedBox(width: 10),
            Image.asset('assets/images/Logo.png', height: 60),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              CarouselSlider(
                items: [
                  buildCarouselItem('Logo.png'),
                  // buildCarouselItem('CarouselImage2.png'),
                  // buildCarouselItem('CarouselImage3.png'),
                ],
                options: CarouselOptions(
                  height: 200,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  autoPlay: false,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  pauseAutoPlayOnTouch: true,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(height: 10),
              Wrap(
                alignment: WrapAlignment.center, // Align items in the center
                spacing: 10, // Space between items
                children: [
                  buildCard('Amazon.png', Colors.white), // Change color to red
                  buildCard('Flipkart.png', Colors.white), // Change color to blue
                  buildCard('Meesho.png', Colors.white), // Change color to green
                  buildCard('Myntra.png', Colors.white), // Change color to orange
                  buildCard('Nykaa.png', Colors.white), // Change color to purple
                  buildCard('AJIO.png', Colors.white), // Change color to teal
                  buildCard('Mamaearth.png', Colors.white), // Change color to yellow
                  buildCard('Amazon.png', Colors.white), // Change color to cyan
                  buildCard('Amazon.png', Colors.white), // Change color to indigo
                  buildCard('Amazon.png', Colors.white), // Change color to deep orange
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        selectedItemColor: Colors.black,
        unselectedLabelStyle: TextStyle(color: Colors.black),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget buildCarouselItem(String imageName) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage('assets/images/$imageName'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildCard(String imageName, Color color) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        elevation: 5,
        color: color, // Set card color
        child: Container(
          width: 150,
          height: 88,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage('assets/images/$imageName'),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Page'),
    );
  }
}

class ShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Shop Page'),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Page'),
    );
  }
}
