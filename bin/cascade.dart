import 'dart:io';

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
  double _accumulator = 0.0;

  Calculator(double initVal) {
    this._accumulator = initVal;
  }

  void add(double val) {
    this._accumulator += val;
  }

  void subtract(double val) {
    this._accumulator -= val;
  }

  double result() {
    return this._accumulator;
  }
}

void main() {
  ChainCalculator chainCalculator = ChainCalculator(0.0)
                                      .add(2.0)
                                      .subtract(1.0)
                                      .add(10.0)
                                      .subtract(2.0);
  print("[ChainCalculator] Result = " + chainCalculator.result().toString());

  Calculator calculator = Calculator(0.0)
                            ..add(2.0)
                            ..subtract(1.0)
                            ..add(10.0)
                            ..subtract(2.0);

  print("[Calculator] Result = " + calculator.result().toString());
}