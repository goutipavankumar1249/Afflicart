import 'package:flutter/material.dart';
import 'package:project/SignupPage.dart';
import 'package:google_fonts/google_fonts.dart';

class UPIpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 249, 249, 1.0),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 15,right: 15,top: 50),
            child: Card(
              color: Color(0xFFD9F1C4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/Logo.png', height: 100),
                    SizedBox(height: 15),
                    _buildTextField('UPI ID'),
                    SizedBox(height: 5),
                    _buildTextField('College Name'),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Continue',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.green.shade900,
                              fontStyle:FontStyle.italic,
                              fontWeight:FontWeight.w600
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height:10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Continue with",
                          style: GoogleFonts.poppins(
                            color: Color(0xFF82C341),
                            fontSize:12,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage()),
                            );
                          },
                          child: Text(
                            'Account Details',
                            style: GoogleFonts.poppins(
                              color: Colors.green.shade900,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                          onPressed: () {
                            
                          },
                        child: const Text("Skip now", style: TextStyle(color: Color.fromARGB(255, 141, 141, 141)  )
                        )
                    )
                  ],
                )
                ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
Widget _buildTextField(String label, {bool obscureText = false}) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              color: Color(0xFF82C341),
              fontSize: 12,
            ),
          ),
          SizedBox(height: 2),
          TextField(
            obscureText: obscureText,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.transparent,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: Colors.green.shade700),
              ),
            ),
            style: GoogleFonts.poppins(color: Colors.black),
          ),
        ],
      ),
    );
  }







