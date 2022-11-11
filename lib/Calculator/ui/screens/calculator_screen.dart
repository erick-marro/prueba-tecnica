import 'package:fibonacci/Calculator/services/MatrixService.dart';
import 'package:fibonacci/Calculator/ui/widgets/fibonacci_form.dart';
import 'package:fibonacci/Calculator/ui/widgets/fibonacci_table.dart';
import 'package:fibonacci/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final matrixService = Provider.of<MatrixService>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "Matriz de Fibonacci",
          style: TextStyle(
            color: Colors.black
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FibonacciTable(),
                const FibonacciForm(),
                CustomButton(
                  text: "Rotar a la derecha", 
                  disabled: !matrixService.generated, 
                  onPressed: () => matrixService.rotateMatrix(),),
                CustomButton(
                  text: "Limpiar Matriz", 
                  disabled: !matrixService.generated, 
                  onPressed: () => matrixService.generateCleanMatrix(),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}