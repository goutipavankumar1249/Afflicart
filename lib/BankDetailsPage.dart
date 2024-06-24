import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:project/BankAccountPage.dart';
import 'package:project/UserState.dart';
import 'CardWithGradient.dart';

class BankDetailsPage extends StatefulWidget {
  @override
  _MyBankDetailsPageState createState() => _MyBankDetailsPageState();
}

class _MyBankDetailsPageState extends State<BankDetailsPage> {
  String accountHolder = "Loading...";
  String accountNumber = "Loading...";
  String IFSCcode = "Loading...";
  String phoneNumber = "Loading...";

  @override
  void initState() {
    super.initState();
    _fetchBankDetails();
  }

  Future<void> _fetchBankDetails() async {
    String userId = Provider.of<UserState>(context, listen: false).userId;
    DatabaseReference database = FirebaseDatabase.instance.ref().child('users').child(userId).child('bankDetails');

    DataSnapshot snapshot = await database.get();

    if (snapshot.exists) {
      setState(() {
        accountHolder = snapshot.child('accountHolderName').value as String? ?? "Not available";
        accountNumber = snapshot.child('accountNumber').value as String? ?? "Not available";
        IFSCcode = snapshot.child('ifscCode').value as String? ?? "Not available";
        phoneNumber = snapshot.child('phoneNumber').value as String? ?? "Not available";
      });
    }
  }

  Future<void> _updateBankDetails(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BankAccountPage()),
    ).then((_) => _fetchBankDetails()); // Refresh details after updating
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(170, 206, 144, 1),
        title: Center(
          child: Text(
            'Bank Details',
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 200,
                child: Center(
                  child: Image.asset('assets/images/BankDetails.png'), // Replace with your image asset
                ),
              ),
              SizedBox(height: 20),
              CardWithGradient(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _table('Account Holder', accountHolder),
                          _table('Account Number', accountNumber),
                          _table('IFSC Code', IFSCcode),
                          _table('Phone Number', phoneNumber),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _updateBankDetails(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Update Bank Details",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Icon(
                      Icons.edit_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  backgroundColor: Colors.green[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _table(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              color: Colors.grey.shade700,
              fontStyle: FontStyle.italic,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.green.shade700,
              fontStyle: FontStyle.italic,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
