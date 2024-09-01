import 'package:flutter/material.dart';

class OutLineButtonCustomer extends StatelessWidget{
   String text;
  Color backGroundColor;
  VoidCallback? onPressed;
   IconData? iconData;


  OutLineButtonCustomer({
    required this.text ,this.onPressed,
    required this.backGroundColor,
  this.iconData
  });

  @override
  Widget build(BuildContext context) {
    return
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backGroundColor,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            iconData != null ? Icon(iconData , size: 18,) :Container(),
            SizedBox(width: 10,),
            Text(text!),
          ],
        ),
        onPressed: onPressed

      );
    //   OutlinedButton.icon(
    //   style: OutlinedButton.styleFrom(
    //     side:  BorderSide(color: backGroundColor),
    //     backgroundColor: backGroundColor,
    //     foregroundColor: Colors.white,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(20.0),
    //     ),
    //   ),
    //   icon:  Icon(iconData),
    //   label:  Text(text),
    //   onPressed: () {},
    // );
  }
}
