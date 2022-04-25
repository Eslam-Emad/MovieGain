import 'package:flutter/material.dart';

class Rate extends StatelessWidget {
  const Rate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.star_rate, color: Colors.amber),
        Icon(Icons.star_rate, color: Colors.amber),
        Icon(Icons.star_rate, color: Colors.amber),
        Icon(Icons.star_rate, color: Colors.amber),
        Icon(Icons.star_rate, color: Colors.grey),
      ],
    );
  }
}
