import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/DashboardPage.dart'; // Import your DashboardPage

class FeaturedStoresPage extends StatefulWidget {
  @override
  _FeaturedStoresPageState createState() => _FeaturedStoresPageState();
}

class _FeaturedStoresPageState extends State<FeaturedStoresPage> {
  List<Map<String, dynamic>> allStores = []; // All stores data fetched from API
  List<Map<String, dynamic>> topStores = []; // Top stores data fetched from API
  List<Map<String, dynamic>> filteredStores = []; // Stores filtered by search query
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch data when the page initializes
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> fetchData() async {
    final url =
        'https://inrdeals.com/fetch/stores?token=561a5519e08733f380f223c95183d103b0ae49ba&id=esa574569153';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Parse the JSON response
        Map<String, dynamic> jsonData = jsonDecode(response.body);

        if (jsonData.containsKey('stores') && jsonData['stores'] is List) {
          // If 'stores' key exists and its value is a List, use it
          List<dynamic> data = jsonData['stores'];

          setState(() {
            // Filter the stores to include only those with an active status
            allStores = data
                .cast<Map<String, dynamic>>()
                .where((store) => store['status'] == 'active')
                .toList();

            // Example: Set top stores (you should implement your logic here)
            topStores = allStores.take(2).toList();// Example: Top 2 stores

            // Remove top stores from allStores to get remaining featured stores
            filteredStores = allStores.where((store) => !topStores.contains(store)).toList();
          });
        } else {
          throw Exception('Invalid data format');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  void onSearchTextChanged(String searchText) {
    searchText = searchText.toLowerCase();
    setState(() {
      filteredStores = allStores.where((store) =>
      store['merchant'].toLowerCase().contains(searchText) ||
          store['category'].toLowerCase().contains(searchText)).toList();
    });
  }

  Future<bool> _onWillPop() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Dashboard()), // Replace with your DashboardPage
    );
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(170, 206, 144, 1),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
              margin: EdgeInsets.only(left: 15, right: 15),
              height: 40,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 216, 215, 215),
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: searchController,
                style: GoogleFonts.poppins(color: Color.fromARGB(255, 255, 255, 255)),
                decoration: InputDecoration(
                  icon: Icon(Icons.search_rounded, color: Colors.white),
                  hintText: '',
                  hintStyle: GoogleFonts.poppins(color: Color.fromARGB(179, 255, 255, 255)),
                  border: InputBorder.none,
                ),
                onChanged: onSearchTextChanged,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Display Top Stores
                    if (topStores.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            child: Text(
                              'Top Stores',
                              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 10),
                          GridView.builder(
                            itemCount: topStores.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                            ),
                            itemBuilder: (context, index) {
                              return StoreCard(
                                store: topStores[index],
                                storeIndex: index,
                              );
                            },
                          ),
                        ],
                      ),
                    // Display Featured Stores
                    if (filteredStores.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            child: Text(
                              'Featured Stores',
                              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 10),
                          GridView.builder(
                            itemCount: filteredStores.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                            ),
                            itemBuilder: (context, index) {
                              return StoreCard(
                                store: filteredStores[index],
                                storeIndex: index,
                              );
                            },
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 70,)
          ],
        ),
      ),
    );
  }
}

class StoreCard extends StatelessWidget {
  final Map<String, dynamic> store;
  final int storeIndex;

  StoreCard({required this.store, required this.storeIndex});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey[300]!, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double imageWidth = constraints.maxWidth * 0.75;
            double imageHeight = imageWidth * 0.57;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                      store['logo'],
                      width: imageWidth,
                      height: imageHeight,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(5),
                  width: constraints.maxWidth,
                  child: ElevatedButton(
                    onPressed: () {
                      _launchURL(store['url']);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(40, 167, 69, 1),
                      padding: EdgeInsets.symmetric(horizontal: 1, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Shop on ${store['merchant']}',
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
              ],
            );
          },
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url+'&subid=${123456}');
    } else {
      throw 'Could not launch $url';
    }
  }
}
