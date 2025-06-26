import 'package:flutter/material.dart';

class Apptext extends StatelessWidget {
  double size;
final String text;
final Color color;

   Apptext({super.key,  this.size =16, required this.text, this.color =  Colors.black38});

  @override
  Widget build(BuildContext context) {
    return Text(
      text, style: TextStyle(
        color: color,
        fontSize: size,        
      ),
    );
  }
}