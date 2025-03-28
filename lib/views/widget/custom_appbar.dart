import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        textAlign: TextAlign.center,
          text: TextSpan(
        text: 'Wallpaper',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),
          children: [
              TextSpan(text: ' Api',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600)),
              ]
          ),



      ),
    );
  }
}
