import 'dart:io';
import 'dart:async';

class ChainCalculator {
  double _accumulator = 0.0;

  ChainCalculator(double initVal) {
    this._accumulator = initVal;
  }

  ChainCalculator add(double val) {
    this._accumulator += val;
    return this;
  }

  ChainCalculator subtract(double val) {
    this._accumulator -= val;
    return this;
  }

  double result() {
    return this._accumulator;
  }
}

class Calculator {
  double _accumulator = 0;

  Calculator(double startValue) {
    this._accumulator = startValue;
  }

double add(double val) {
  this._accumulator += val;
  return this._accumulator;
}

double subtract(double val) {
  this._accumulator -= val;
  return this._accumulator;
}

  double result() {
    return this._accumulator;
  }
}

void main() {


Calculator calculator = Calculator(0.0)
    ..add(12.0)
    ..subtract(10.0)
    ..add(5.0)..subtract(8.0);

print("Result: " + calculator.result().toString());
}
