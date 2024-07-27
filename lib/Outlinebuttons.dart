import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget{
  final String text;
  final Color bordercolor;
  final bool isselected;
  final VoidCallback onpressed;

  CustomOutlinedButton({
    required this.text,
    required this.bordercolor,
    required this.isselected,
    required this.onpressed,
});


  @override
  Widget build(BuildContext context) {
      return OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: bordercolor),
         // shadowColor: isselected? bordercolor : Colors.transparent,
          elevation: isselected ? 5.0 : 0.0,
          backgroundColor : isselected? bordercolor.withOpacity(0.2) : Colors.transparent,
        ),
          onPressed: onpressed,
          child: Text(
            text, style: TextStyle(
            color: isselected? bordercolor : Colors.black,
          ),
          ));
  }

}