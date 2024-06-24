
import 'package:flutter/material.dart';

class CardWithGradient extends StatelessWidget {
  final Widget child;

  CardWithGradient({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        gradient: LinearGradient(
          colors: [const Color.fromRGBO(255, 255, 255, 0.3), const Color.fromRGBO(255, 255, 255, 0.12)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Card(
        color: Colors.transparent,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: child,
      ),
    );
  }
}