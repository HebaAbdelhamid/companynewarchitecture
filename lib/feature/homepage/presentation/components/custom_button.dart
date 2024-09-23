import 'package:companynewarchitecture/core/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  Color ?bgColor = AppStyle.primaryColor;
  Color textColor;
  final Function() function;

  CustomButton(
      {super.key,
      required this.title,
      required this.function,
       this.bgColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return
      Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height*.046,
      padding: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(3),
      ),
      child: MaterialButton(

          onPressed: function,
          child: Text(
            title,
            style: TextStyle(color: textColor, fontSize: 16),
          )),
    );
  }
}
