import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'CardWithGradient.dart';

class CardDetailsPage extends StatelessWidget {
  final List<String> cardTitles;
  final List<String> cardImages;
  final List<int> cardNumbers;
  final List<String> cardUrls;
  final int numberOfCards;
  final Color color;
  final List<Color> btnclr;
  final Color perColor;
  final Color pageColor;

  CardDetailsPage({
    required this.cardTitles,
    required this.cardImages,
    required this.cardNumbers,
    required this.cardUrls,
    required this.numberOfCards,
    required this.color,
    required this.btnclr,
    required this.perColor,
    required this.pageColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageColor,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('assets/images/${cardImages[cardImages.length - 1]}'),
                    fit: BoxFit.contain,
                  ),
                ),
                width: 320,
                height: 100,
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: numberOfCards,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      buildCard(
                        context,
                        cardTitles[index],
                        cardImages[index],
                        cardNumbers[index],
                        cardUrls[0],  // Using the single URL
                        color,
                        btnclr,
                        perColor,
                      ),
                      SizedBox(height: 10), // Add space between cards
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, String title, String image, int number,
      String url, Color color, List<Color> btnclr, Color perColor) {
    return GestureDetector(
      onTap: () {
        // You can add any onTap functionality here if needed
      },
      child: Padding(
        padding: EdgeInsets.all(1),
        child: CardWithGradient(
          child: Container(
            width: 320,
            height: 280,
            padding: EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
                      image: DecorationImage(
                        image: AssetImage('assets/images/$image'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 1),
                Expanded(
                  flex: 0,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                Text(
                                  'On ',
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  '$title',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8, bottom: 40),
                            child: Text(
                              'Get Cashback Upto ',
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '${number}%',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: perColor,
                              shadows: [
                                Shadow(
                                  color: Color.fromARGB(64, 0, 0, 0),
                                  blurRadius: 4,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: btnclr,
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                _launchUrl(url);
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.shopping_cart,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 8.0),
                                  Text(
                                    'Shop Now',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      throw 'Could not launch $url';
    }
  }
}
