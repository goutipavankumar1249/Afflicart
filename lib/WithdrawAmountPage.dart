import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';
import 'MyEarningsPage.dart';
import 'UserState.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WithdrawAmountPage extends StatefulWidget {
  @override
  _WithdrawAmountPageState createState() => _WithdrawAmountPageState();
}

class _WithdrawAmountPageState extends State<WithdrawAmountPage> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _beneIdController = TextEditingController();
  final TextEditingController _transferIdController = TextEditingController();

  void _saveTransferDetails(BuildContext context) async {
    String amount = _amountController.text;
    String beneId = _beneIdController.text;
    String transferId = _transferIdController.text;

    if (amount.isEmpty || beneId.isEmpty || transferId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill all the fields'),
        ),
      );
      return;
    }

    try {
      // // Access userId from the UserState using Provider
      String userId = Provider.of<UserState>(context, listen: false).userId;
      print('User ID: $userId'); // Debugging statement

      DatabaseReference database = FirebaseDatabase.instance.ref().child('users').child(userId);

      await database.update({
        'amount': amount,
        'beneId': beneId,
        'transferId': transferId,
      });

      showToast('Details saved successfully');

      // Navigate to MyEarningsPage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyEarningsPage()),
      );

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update account details: $e'),
        ),
      );
    }
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 249, 249, 1.0),
      appBar: AppBar(
        title: Text('Withdraw Amount'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const SizedBox(height: 30.0),
                  Container(
                    height: 150,
                    width: 150,
                    child: Image.asset('assets/images/Logo.png'),
                  ),
                  Text(
                    "Enter Your transfer details",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  )
                ],
              ),
              SizedBox(height: 20),
              Column(
                children: <Widget>[
                  TextField(
                    controller: _amountController,
                    decoration: InputDecoration(
                      hintText: "Enter amount",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.green.withOpacity(0.1),
                      filled: true,
                      prefixIcon: Icon(Icons.account_circle),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _beneIdController,
                    decoration: InputDecoration(
                      hintText: "Enter beneId",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.green.withOpacity(0.1),
                      filled: true,
                      prefixIcon: Icon(Icons.account_balance),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _transferIdController,
                    decoration: InputDecoration(
                      hintText: "Enter unique transferId",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.green.withOpacity(0.1),
                      filled: true,
                      prefixIcon: Icon(Icons.account_balance),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _saveTransferDetails(context),
                child: Text(
                  "Save details",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
