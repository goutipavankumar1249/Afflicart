import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/BankAccountPage.dart';
import 'package:project/DashboardPage.dart'; // Import your DashboardPage
import 'CardWithGradient.dart';

class MyEarningsPage extends StatefulWidget {
  @override
  _MyEarningsPageState createState() => _MyEarningsPageState();
}

class _MyEarningsPageState extends State<MyEarningsPage> {
  double earnings = 00.00;
  double withdrawlimit = 10;
  String selectedOption = "Option 1";
  bool isWidgetVisible = false;
  bool addedBank = false;
  bool _showOrders = false;

  List<String> recentOrders = [
    '3354985',
    '8393659',
    '849659',
    '87965896'
  ];

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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Earnings.png',
                  height: 250,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: [
                          CardWithGradient(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Total Earnings in Wallet',
                                        style: GoogleFonts.poppins(
                                          color: Colors.grey.shade700,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '\u20B9${earnings}',
                                            style: GoogleFonts.poppins(
                                              color: Colors.green.shade900,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 30,
                                            ),
                                          ),
                                        ],
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Withdraw Now",
                                              style: GoogleFonts.poppins(
                                                fontSize: 18,
                                                color: Colors.green[700],
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          shape: const StadiumBorder(),
                                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 18),
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Minimum Balance to Withdraw is \u20B9$withdrawlimit',
                                            style: GoogleFonts.poppins(fontSize: 12.0, fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => BankAccountPage()),
                                          );
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Edit Bank Account Details",
                                              style: GoogleFonts.poppins(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const Icon(
                                              Icons.add_circle_outline_sharp,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          shape: const StadiumBorder(),
                                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                                          backgroundColor: Colors.green[700],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            _showOrders = !_showOrders;
                                          });
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Recent Orders",
                                              style: GoogleFonts.poppins(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          shape: const StadiumBorder(),
                                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                                          backgroundColor: Colors.green[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          if (_showOrders)
                            CardWithGradient(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          "My Recent Orders",
                                          style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.green.shade900,
                                          ),
                                        ),
                                        ...recentOrders.map((order) => ListTile(
                                          title:Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children:[
                                                Text('Order ID',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.grey.shade700,
                                                  ),
                                                ),
                                                Text(order,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.green.shade900,
                                                  ),
                                                ),
                                              ]
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 70),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
