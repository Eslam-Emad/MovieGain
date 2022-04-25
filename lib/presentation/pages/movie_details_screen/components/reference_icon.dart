import 'package:flutter/material.dart';

class ReferenceIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const ReferenceIcon({Key? key, required this.icon, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.white)),
      child: Icon(icon, color: Colors.white),
    );
  }
}
