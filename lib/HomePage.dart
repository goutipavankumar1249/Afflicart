import 'package:flutter/material.dart';
import 'package:project/CardDetailsPage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'CardData.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 249, 249, 1.0),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              CarouselSlider(
                items: [
                  buildCarouselItem('carousel.png'),
                ],
                options: CarouselOptions(
                  height: 200,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.9,
                  initialPage: 0,
                  autoPlay: false,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  pauseAutoPlayOnTouch: true,
                  enlargeCenterPage: true,
                ),
              ),
              SizedBox(height: 10),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                children: CardData.cards
                    .map((card) => buildCard(context, card))
                    .toList(),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCarouselItem(String imageName) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage('assets/images/$imageName'),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, Map<String, dynamic> cardData) {
    List<String> title = cardData['title'].cast<String>();
    List<String> image = cardData['image'].cast<String>();
    List<int> number = cardData['number'].cast<int>();
    String url = cardData['url'];
    int numberOfCards = cardData['numberOfCards'];
    Color color = cardData['color'];
    List<Color> btnclr = cardData['btnclr'];
    Color perColor = cardData['perColor'];
    Color pageColor = cardData['pageColor'];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CardDetailsPage(
              cardTitles: title,
              cardImages: image,
              cardNumbers: number,
              cardUrls: List.generate(numberOfCards, (index) => url),
              numberOfCards: numberOfCards,
              color: color,
              btnclr: btnclr,
              perColor: perColor,
              pageColor: pageColor,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Card(
          elevation: 5,
          child: Container(
            width: 120,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage('assets/images/${image[image.length - 1]}'),
                fit: BoxFit.contain,
              ),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}