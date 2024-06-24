import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KnowMorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(170, 206, 144, 1),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Know More',
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
      backgroundColor: const Color.fromRGBO(170, 206, 144, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'How it works?',
                    style: GoogleFonts.poppins(
                      color: Colors.green.shade900,
                      fontStyle: FontStyle.italic,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  Image.asset(
                    'assets/images/SignUp.png',
                    width: 300,
                  ),
                  SizedBox(height: 10),
                  Image.asset(
                    'assets/images/Shop.png',
                    width: 300,
                  ),
                  SizedBox(height: 20),
                  Image.asset(
                    'assets/images/EarnCashback.png',
                    width: 300,
                  ),
              SizedBox(height: 30),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
