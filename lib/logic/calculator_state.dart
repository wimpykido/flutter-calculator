import 'package:equatable/equatable.dart';

abstract class CalculatorState extends Equatable {
  const CalculatorState();

  @override
  List<Object?> get props => [];
}

class CalculatorInitialState extends CalculatorState {
  @override
  List<Object?> get props => [];
}

class CalculatorResultState extends CalculatorState {
  final String result;

  const CalculatorResultState(this.result);

  @override
  List<Object?> get props => [result];
}

class CalculatorErrorState extends CalculatorState {
  final String error;

  const CalculatorErrorState(this.error);

  @override
  List<Object?> get props => [error];
}