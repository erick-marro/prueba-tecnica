
import 'package:flutter/material.dart';

import '../models/matrix_model.dart';

class MatrixService extends ChangeNotifier {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // when the matrix is generated the value change to true
  bool generated = false;

  // Matrix initial state
    Matrix matrix = Matrix(
      column1: [0,0,0], 
      column2: [0,0,0], 
      column3: [0,0,0]);

  // initial value of the range to calculate the series
  int start = 0;

  // final value of the range to calculate the series
  int end = 0;

  // global total of the array elements (count of the elements)
  int totalSerie = 0;

  // global sum of the array elements
  int globalAmount = 0;


  /// Validate the form
  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  /// Generate an empty matrix, it must be used as initializer of the matrix.
  /// Can also be used to clean the matrix.
  /// Returns an empty matrix
  /// No params required
  void generateCleanMatrix() {
    
    matrix = Matrix(
      column1: [0,0,0], 
      column2: [0,0,0], 
      column3: [0,0,0]);

    print(matrix);

    generated = false;

    notifyListeners();

  }

  /// Create a matrix filled with the fibonacci series
  /// Returns a matrix with data.
  void generateMatrix() {

    try {
    List<int> succesion = [];

    // Initialize first fibonacci numbers
    int n1=start,n2=end,n3 = 0;

    // Count of fibonacci numbers on a given range
    int result = 0;

    // Total amount of array elements
    int total = 0;

    // loop for calculate the series
    // can be also done with recursion creating another function
    for(int i = 0 ;i <= 9; i++){
      if (succesion.length == 1 && succesion.first == 0) n1 = 1;
      n3 = n1+n2;
      n1 = n2;
      n2 = n3;
      succesion.add(n3);
    }

    // Sum all the numbers in the array and save the value in total
    for (var i = 0; i < succesion.length; i++) {
      total += succesion[i];
    }

    // storing local values of counters in global scopes variables
    totalSerie = result;
    globalAmount = total;

    Matrix matrix = Matrix(
      column1: succesion.sublist(0,3), 
      column2: succesion.sublist(3,6), 
      column3: succesion.sublist(6,9));

    print(matrix.column1);
    print(matrix.column2);
    print(matrix.column3);

    this.matrix = matrix;

    generated = true;

    notifyListeners();

    } on RangeError catch (_) {
      print("Out of range");
      notifyListeners();
    }
  }

  /// Rotates the values of the matrix to the right.
  /// The last value of the matrix must be provided
  void rotateMatrix() {

    Matrix matrix = Matrix(
      column1: [this.matrix.column1[0], this.matrix.column2[0], this.matrix.column3[0]], 
      column2: [this.matrix.column1[1], this.matrix.column2[1], this.matrix.column3[1]], 
      column3: [this.matrix.column1[2], this.matrix.column2[2], this.matrix.column2[2]]);

    print(matrix.column1);
    print(matrix.column2);
    print(matrix.column3);

    this.matrix = matrix;

    notifyListeners();

  }

  

}