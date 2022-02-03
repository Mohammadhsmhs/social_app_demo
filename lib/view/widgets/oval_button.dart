import 'package:flutter/material.dart';

class OvalButton extends StatelessWidget {
  const OvalButton({
    required this.size,
    required this.title,
    required this.ratio,
    required this.color,
    required this.func,
    Key? key,
  }) : super(key: key);
  final double ratio;
  final String title;
  final double size;
  final VoidCallback func;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: func,
        child: ClipOval(
          child: Container(
            color: color,
            height: ratio * 10 * size,
            width: ratio * 50,
            child: Center(
                child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white, fontSize: 24),
              textAlign: TextAlign.center,
            )),
          ),
        ));
  }
}
