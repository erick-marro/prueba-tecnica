import 'package:flutter/material.dart';

class FibonacciNumber extends StatelessWidget {

  final int e;

  const FibonacciNumber({super.key, required this.e});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          e.toString(),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
