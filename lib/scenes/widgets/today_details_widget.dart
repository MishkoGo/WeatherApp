import 'package:flutter/material.dart';

class TodayDetailsWidget extends StatelessWidget {
  const TodayDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
