import 'package:flutter/material.dart';

class submitBtn extends StatelessWidget {
  final String btnText;
  final GestureTapCallback onClick;

  const submitBtn({super.key, required this.btnText, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Column(
        children: [
          Container(
            padding:  EdgeInsets.symmetric(vertical: 10.0,horizontal: 50.0),
            decoration: BoxDecoration(
              color:  Colors.black,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(btnText,style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
