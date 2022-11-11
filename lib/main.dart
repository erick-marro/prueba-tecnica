import 'package:fibonacci/Calculator/services/MatrixService.dart';
import 'package:fibonacci/Calculator/ui/screens/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => MatrixService())
    ],
    child: MyApp()
  ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen()
    );
  }
}