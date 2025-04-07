import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, this.weight, this.feet});

  final int height;
  final double? weight;
  final double? feet;
  double? _bmi;
  double? feetConvert;

  String? calculateBMI() {
    _bmi = (weight! / pow(height / 100, 2));
    return _bmi?.toStringAsFixed(1);
  }

  String? calculateFeet() {
    feetConvert = (feet! * 30.40);
    _bmi = (weight! / pow(feetConvert! / 100, 2));
    return _bmi?.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi! < 16) {
      return 'Very Severely Underweight';
    } else if (_bmi! < 16.9) {
      return 'Severely Underweight';
    } else if (_bmi! < 18.4) {
      return 'Underweight';
    } else if (_bmi! < 24.9) {
      return 'Normal';
    } else if (_bmi! < 29.9) {
      return 'OverWeight';
    } else if (_bmi! < 34.5) {
      return 'Obese';
    } else {
      return 'Extremely Obese';
    }
  }

  String getInterpretation() {
    if (_bmi! < 16) {
      return 'You are Very Severely Underweight. You can eat a little more.';
    } else if (_bmi! < 16.9) {
      return 'You are Severely Underweight. You can eat a little more';
    } else if (_bmi! < 18.4) {
      return 'You are Severely Underweight. You can eat a little more';
    } else if (_bmi! < 24.9) {
      return 'You have a healthy body weight. Good job!';
    } else if (_bmi! < 29.9) {
      return 'You have a higher than normal body weight. Try to exercise.!';
    } else if (_bmi! < 34.5) {
      return 'Your result suggests you are obese!';
    } else {
      return 'Your result suggests you are Extremely Obese!.';
    }
  }
}
