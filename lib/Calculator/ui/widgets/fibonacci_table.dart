import 'package:fibonacci/Calculator/services/MatrixService.dart';
import 'package:fibonacci/Calculator/ui/widgets/fibonacci_number.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FibonacciTable extends StatelessWidget {
  const FibonacciTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final matrixService = Provider.of<MatrixService>(context);

    return Container(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: matrixService.matrix.column1.map((e) => FibonacciNumber(e: e)).toList(),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: matrixService.matrix.column2.map((e) => FibonacciNumber(e: e)).toList(),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: matrixService.matrix.column3.map((e) => FibonacciNumber(e: e)).toList(),
            )
          ),
          SizedBox(height: 50,)
        ],
      ),
    );
  }
}
