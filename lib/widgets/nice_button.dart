import 'package:flutter/material.dart';
import 'package:nice_button/NiceButton.dart';

class NiceButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  var icons;
  NiceButtonWidget({this.onPressed, this.text, this.icons});

  @override
  Widget build(BuildContext context) {
    return NiceButton(
      icon: icons ,
      width: 272.2,
      elevation: 8.0,
      radius: 52.0,
      text: text,
      mini: false,
      gradientColors: [Color(0xff36d1dc),  Color(0xff5b86e5)],
      onPressed: onPressed,
      background: null,
    );
  }

}