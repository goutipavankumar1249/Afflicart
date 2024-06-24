import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:project/BankDetailsPage.dart';
import 'package:project/MyEarningsPage.dart';
import 'package:project/UserState.dart';

class BankAccountPage extends StatelessWidget {
  BankAccountPage({super.key});

  final TextEditingController accountHolderNameController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController ifscCodeController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  Future<void> _saveBankDetails(BuildContext context) async {
    String userId = Provider.of<UserState>(context, listen: false).userId;

    DatabaseReference database = FirebaseDatabase.instance.ref();
    await database.child('users').child(userId).child('bankDetails').update({
      'accountHolderName': accountHolderNameController.text.trim(),
      'accountNumber': accountNumberController.text.trim(),
      'ifscCode': ifscCodeController.text.trim(),
      'phoneNumber': phoneNumberController.text.trim(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(170, 206, 144, 1),
        title: Center(
          child: Text(
            'Edit Bank Details',
            style: GoogleFonts.poppins(
              color: Colors.green.shade900,
              fontStyle: FontStyle.italic,
              fontSize: 35,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(170, 206, 144, 1),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 40),
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
                    SizedBox(height: 5),
                    Text(
                      'Fill Bank Details',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.green.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    _buildTextField('Account Holder Name', accountHolderNameController),
                    SizedBox(height: 10),
                    _buildTextField('Account Number', accountNumberController),
                    SizedBox(height: 10),
                    _buildTextField('IFSC Code', ifscCodeController),
                    SizedBox(height: 10),
                    _buildTextField('Phone Number', phoneNumberController),
                    SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          await _saveBankDetails(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BankDetailsPage(),
                            ),
                          );
                        },
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
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyEarningsPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Skip Now',
                            style: GoogleFonts.poppins(
                              color: Colors.green.shade900,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool obscureText = false}) {
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
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.transparent,
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
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
}
