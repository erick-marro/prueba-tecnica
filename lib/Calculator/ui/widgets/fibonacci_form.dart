import 'package:fibonacci/Calculator/services/MatrixService.dart';
import 'package:fibonacci/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class FibonacciForm extends StatelessWidget {
  const FibonacciForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final matrixService = Provider.of<MatrixService>(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Form(
        key: matrixService.formKey,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: <Widget>[
            TextFormField(
              autocorrect: false,
              enabled: !matrixService.generated,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text('Elemento incial')
              ),
              onChanged: (value) { 
                if(value.isEmpty) {
                  return;
                }
                if (value != '0') {
                  matrixService.start = int.parse(value);
                }
                print('0');
                return;
              }
            ),
            TextFormField(
              enabled: !matrixService.generated,
              autocorrect: false,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text('Elemento final')
              ),
              onChanged: (value) {
                if(value.isEmpty) {
                  return;
                }
                matrixService.end = int.parse(value);
              },
            ),
            CustomButton(
              text: 'Generar Matriz', 
              disabled: false, 
              onPressed: ()  {

                // Do nothing if the form is invalid
                if (!matrixService.isValidForm()) return;

                // Generate the matrix

                matrixService.generateMatrix();

                matrixService.end = 0;
                matrixService.start = 0;
              })
          ],
        ),
      ),
    );
  }
}