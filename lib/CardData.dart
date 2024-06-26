import 'package:flutter/material.dart';
class CardData {
  static final List<Map<String, dynamic>> cards = [
    {
      "title": ["Clothing", "Mobiles", "Electronics", "Groceries", "Furniture","Others"],
      "image": ["Amazon_Clothing.png","Amazon_Mobiles.png","Amazon_Electronics.png","Amazon_Groceries.png","Amazon_Furniture.png", "Amazon.png"],
      "number": [3, 5, 7, 2, 4,1],
      "url": "https://www.amazon.com",
      "numberOfCards": 6,
      "color":Color.fromARGB(255, 255, 245, 214),
      "btnclr":[const Color.fromARGB(255, 255, 165, 0), const Color.fromARGB(255, 255, 218, 143)],
      "perColor":Color.fromARGB(255, 255,168 ,9 ),
      "pageColor":Color.fromARGB(255, 255,251,243),
    },
    {
      "title": ["Groceries", "Mobiles", "Fashion", "Electronics", "Home & Furniture","Others"],
      "image": ["Flipkart_Groceries.png","Flipkart_Mobiles.png","Flipkart_Fashion.png","Flipkart_Electronics.png","Flipkart_Home.png", "Flipkart.png"],
      "number": [2, 6, 4, 7, 8, 4,1],
      "url": "https://www.flipkart.com",
      "numberOfCards": 6,
      "color":Color.fromARGB(255, 235, 243, 248),
      "btnclr":[const Color.fromARGB(255, 48, 76, 166), const Color.fromARGB(255, 119,205,241)],
      "perColor":Color.fromARGB(255, 64,121,252),
      "pageColor":Color.fromARGB(255, 247,254,255),
    },
    {
      "title": ["Men Fashion", "Women Fashion", "Kids Fashion", "Home & Living", "Beauty Products","Others"],
      "image": ["Myntra_Men.png","Myntra_Women.png","Myntra_Kids.png","Myntra_Home.png", "Myntra_Beauty.png","Myntra.png"],
      "number": [4, 7, 8, 3, 5,1],
      "url": "https://www.myntra.com",
      "numberOfCards": 6,
      "color":Color.fromARGB(255, 255, 235, 227),
      "btnclr":[const Color.fromARGB(255,255,125,70 ), const Color.fromARGB(255, 253,192,208)],
      "perColor":Color.fromARGB(255, 255,127,74),"pageColor":Color.fromARGB(255, 255,242,238),
    },
    {
      "title": ["MakeUp Products","Skin Products","Hair Products","Naturals","Fragrance","Others"],
      "image": ["Nykaa_Makeup.png", "Nykaa_Skin.png","Nykaa_Hair.png","Nykaa_Naturals.png","Nykaa_Fragrance.png","Nykaa.png"],
      "number": [5, 7, 8,3,2,1],
      "url": "https://www.nykaa.com",
      "numberOfCards": 6,
      "color":Color.fromARGB(255, 255, 229, 243),
      "btnclr":[const Color.fromARGB(255, 255,63,192), const Color.fromARGB(255, 253,163,212)],
      "perColor":Color.fromARGB(255, 204,33,147),
      "pageColor":Color.fromARGB(255, 255,243,250),
    },
    {
      "title": ["Men Fashion","Women Fashion","Kids Fashion","Beauty products","Home & Kitchen","Others"],
      "image": ["AJIO_Men.png", "AJIO_Women.png","AJIO_Kids.png","AJIO_Beauty.png","AJIO_Home.png","AJIO.png"],
      "number": [6, 2, 3,4,8,1],
      "url": "https://www.ajio.com",
      "numberOfCards": 6,
      "color":Color.fromARGB(255, 241,240 ,240 ),
      "btnclr":[const Color.fromARGB(255, 165,165,165), const Color.fromARGB(255, 201,201,201)],
      "perColor":Color.fromARGB(255, 141,141,141),
      "pageColor":Color.fromARGB(255, 241,241,241),
    },
    {
      "title": ["Hair Products","Face Products","Body Products","MakeUp Products","Baby Products","Others"],
      "image": ["Mamaearth_Hair.png", "Mamaearth_Face.png","Mamaearth_Body.png","Mamaearth_Makeup.png","Mamaearth_Baby.png","Mamaearth.png"],
      "number": [7, 100, 2, 8,3,1],
      "url": "https://www.mamaearth.com",
      "numberOfCards": 6,
      "color":Color.fromARGB(255, 237, 255, 206),
      "btnclr":[const Color.fromARGB(255, 56,195,2), const Color.fromARGB(255, 196,249,92)],
      "perColor":Color.fromARGB(255, 59,196,4),
      "pageColor":Color.fromARGB(255, 247,255,231),
    },

  ];
}