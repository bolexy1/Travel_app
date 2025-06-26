import 'package:flutter/material.dart';
import 'package:travel_app/ui/colors.dart';
import 'package:travel_app/widgets/apptext.dart';

class Appbuttons extends StatelessWidget {
  final Color color;
  final Color backgroundcolor;
  String ?text;
  IconData? icon;
  double size;
  final Color borderColor;
  bool? isIcon;
  
  
 Appbuttons({super.key, required this.color, this.isIcon=false,this.text,this.icon, required this.size,  required this.backgroundcolor, required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
                        
                        width: size,
                        height: size,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: borderColor,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(15),
                          color: backgroundcolor
                        ),
                        child: isIcon==false?Center(child: Apptext(text: text!, color: color,)):Center(child: Icon(icon, color: color,)),);
  }
}