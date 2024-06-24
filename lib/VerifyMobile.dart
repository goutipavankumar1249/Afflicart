import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/DashboardPage.dart';
import 'package:project/fire_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';
import 'package:project/OTPVerificationPage.dart';
import 'package:project/UserState.dart';

class VerifyMobile extends StatefulWidget {
  @override
  _VerifyMobileState createState() => _VerifyMobileState();
}

class _VerifyMobileState extends State<VerifyMobile> {
  String selectedState = 'Select state';
  String selectedCollege = 'Select college';
  TextEditingController phoneController = TextEditingController();
  final FireServices _fireServices = FireServices();

  @override
  void initState() {
    super.initState();
    _fireServices.checkGooglePlayServices(context);
  }

  Widget _buildTextField(
      String label, {
        bool obscureText = false,
        List<String>? dropdownItems,
        String? selectedItem,
        void Function(String?)? onChanged,
        String? placeholder,
      }) {
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
          if (dropdownItems == null)
            TextField(
              controller: phoneController,
              obscureText: obscureText,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                prefixText: '+91 ',
                hintText: placeholder,
                hintStyle: GoogleFonts.poppins(color: Colors.grey),
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
            )
          else
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                hintText: placeholder,
                hintStyle: GoogleFonts.poppins(color: Colors.grey),
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
              value: selectedItem,
              items: dropdownItems.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: GoogleFonts.poppins()),
                );
              }).toList(),
              onChanged: onChanged,
            ),
        ],
      ),
    );
  }

  Future<void> _saveUserDetails() async {
    String userId = Provider.of<UserState>(context, listen: false).userId;

    DatabaseReference database = FirebaseDatabase.instance.ref();
    await database.child('users').child(userId).update({
      'phone': phoneController.text.trim(),
      'state': selectedState,
      'college': selectedCollege,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(170, 206, 144, 1),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
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
                    Text(
                      'Welcome Back',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Fill the details',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.green.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    _buildTextField(
                      'State',
                      dropdownItems: ['Telangana', 'Andhra Pradesh'],
                      selectedItem: selectedState == 'Select state' ? null : selectedState,
                      onChanged: (newValue) {
                        setState(() {
                          selectedState = newValue ?? 'Select state';
                        });
                      },
                      placeholder: 'Select state',
                    ),
                    SizedBox(height: 20),
                    _buildTextField(
                      'Phone number',
                    ),
                    SizedBox(height: 20),
                    _buildTextField(
                      'College name',
                      dropdownItems: ['RGUKT Basar', 'RGUKT Nuzvid', 'RGUKT RK Valley'],
                      selectedItem: selectedCollege == 'Select college' ? null : selectedCollege,
                      onChanged: (newValue) {
                        setState(() {
                          selectedCollege = newValue ?? 'Select college';
                        });
                      },
                      placeholder: 'Select college',
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          await _saveUserDetails();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Dashboard(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          iconColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Proceed',
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
