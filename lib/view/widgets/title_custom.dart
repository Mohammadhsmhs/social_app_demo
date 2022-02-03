import 'package:flutter/material.dart';

class TitleCustom extends StatelessWidget {
  const TitleCustom({required this.ratio, required this.title, Key? key})
      : super(key: key);
  final String title;
  final double ratio;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title + ":",
        style: TextStyle(fontSize: ratio * 10),
      ),
    );
  }
}
