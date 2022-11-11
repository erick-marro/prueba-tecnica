import 'package:fibonacci/Calculator/services/MatrixService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TotalMatrix extends StatelessWidget {
  const TotalMatrix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final matrixService = Provider.of<MatrixService>(context);

    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Suma de matriz: ${matrixService.globalAmount}')
        ],
      ),
    );
  }
}