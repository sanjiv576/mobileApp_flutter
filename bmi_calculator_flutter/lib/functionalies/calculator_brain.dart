import 'dart:math';

class CalculatorBrain {
  double? _bmi;
  int? height;
  int? weight;

  CalculatorBrain({required this.height, required this.weight});

  String calculateBMI() {
    _bmi = weight! / pow(height! / 100, 2);
    // store upto only one decimal point e.g 12.5, 32.2
    return _bmi!.toStringAsFixed(1);
  }

  String getResultStatus() {
    if (_bmi! >= 25) {
      return 'overweight';
    } else if (_bmi! > 18.5) {
      return 'normal';
    } else {
      return 'underweight';
    }
  }

  String getInterpretation() {
    if (_bmi! >= 25) {
      return 'You have a higher BMI. Try to exercise.';
    } else if (_bmi! >= 18.5) {
      return 'You have a normal BMI.';
    } else {
      return 'You have a low BMI. Eat more nutrious food.';
    }
  }
}
