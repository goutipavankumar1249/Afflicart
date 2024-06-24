import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/KnowMorePage.dart';

class LandingPage extends StatelessWidget {
  final VoidCallback onShopNow;

  LandingPage({required this.onShopNow});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(170, 206, 144, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Text(
                  'Earn Cashback',
                  style: GoogleFonts.poppins(
                    color: Colors.green.shade800,
                    fontStyle: FontStyle.italic,
                    fontSize: 35,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'on Every Purchase',
                  style: GoogleFonts.poppins(
                    color: Colors.grey.shade700,
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '“Shop at your favorite stores and get money back!”',
                  style: GoogleFonts.poppins(
                    color: Colors.green.shade800,
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Image.asset(
              'assets/images/cashback.png',
              height: 300,
              width: 600,
            ),
              ]  
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45.0),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: onShopNow,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(16, 92, 10, 1),
                        padding: EdgeInsets.symmetric(vertical: 25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        shadowColor: Colors.lightGreen,
                        elevation: 20,
                      ),
                      child: Text(
                        'Shop Now',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => KnowMorePage(),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 199, 238, 200),
                        side: BorderSide(
                          color: const Color.fromARGB(255, 199, 206, 199),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        shadowColor: Colors.lightGreen,
                        elevation: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Learn More',
                            style: GoogleFonts.poppins(
                              color: Color.fromRGBO(16, 92, 10, 1),
                              fontStyle: FontStyle.italic,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.arrow_forward,
                            color: const Color.fromRGBO(40, 167, 69, 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
