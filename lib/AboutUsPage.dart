import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(170, 206, 144, 1),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'About Us',
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
        body: SingleChildScrollView(
          child:Container(
            color: Color(0xFF98C379), // Background color
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/AboutUs.png',
                        height: 200,
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text:'welcome to A',
                              style: GoogleFonts.poppins(color: Colors.green.shade900),
                            ),
                            TextSpan(
                              text: 'fflicart',
                              style: GoogleFonts.poppins(color: Colors.black),
                            ),
                            TextSpan(
                              text:
                              'Z, your go-to destination for exclusive cashback offers on your favorite online purchases.',
                              style: GoogleFonts.poppins(color: Colors.green.shade900),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Our Mission',
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color:  Colors.green.shade900,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'At AfflicartZ, we are dedicated to making online shopping more rewarding for students. Our mission is to provide a seamless platform where students can earn cashback on every purchase they make through our partnered websites.',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'What sets us apart',
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color:  Colors.green.shade900,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Unlike traditional cashback platforms, we prioritize the needs and preferences of students. Our user-friendly interface, curated selection of partner websites, and exclusive cashback offers are tailored to enhance the student shopping experience.',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Why choose us',
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color:  Colors.green.shade900,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Student-Focused: We understand the unique challenges students face, which is why we’ve designed our platform to cater specifically to their needs.\n\nTransparency: We believe in transparency and honesty. You can trust us to provide accurate information and fair cashback rewards.\n\nData Security: Your privacy and security are our top priorities. We adhere to stringent data protection standards to ensure that your personal information is safe and secure.',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Get in touch',
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color:  Colors.green.shade900,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'We love hearing from our users! If you have any questions, feedback, or suggestions, please don’t hesitate to contact us at afflicartz@gmail.com.',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text:'Thank you for choosing A',
                              style: GoogleFonts.poppins(color: Colors.green.shade900),
                            ),
                            TextSpan(
                              text: 'fflicart',
                              style: GoogleFonts.poppins(color: Colors.black),
                            ),
                            TextSpan(
                              text:
                              'Z for all your cashback needs!',
                              style: GoogleFonts.poppins(color: Colors.green.shade900),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30,)
                  ],
                ),
              ),
            ),
          ),)
    );
  }
}