import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color color;
  final String text;

  const Button({Key? key, required this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.09,
      width: size.width,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical:10),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: color,
                blurRadius: 7,
                spreadRadius: 1,
                offset: const Offset(1, 3))
          ]),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
