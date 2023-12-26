abstract class CalculatorEvent {}

class AddEvent extends CalculatorEvent {
  final double operand;

  AddEvent(this.operand);
}

class InputChangedEvent extends CalculatorEvent {
  final String input;

  InputChangedEvent(this.input);

  @override
  List<Object?> get props => [input];
}

class ClearEvent extends CalculatorEvent {}
class BackspaceEvent extends CalculatorEvent {}
class PercentageEvent extends CalculatorEvent {}
class AdditionEvent extends CalculatorEvent {}
class SubtractionEvent extends CalculatorEvent {}
class MultiplicationEvent extends CalculatorEvent {}
class DivisionEvent extends CalculatorEvent {}
class EqualEvent extends CalculatorEvent {}
class DecimalEvent extends CalculatorEvent {}

class NumberPressedEvent extends CalculatorEvent {
  final String number;

  NumberPressedEvent(this.number);

  @override
  List<Object?> get props => [number];
}