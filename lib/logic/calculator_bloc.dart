import 'package:calculator/logic/calculator_event.dart';
import 'package:calculator/logic/calculator_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorInitialState()) {
    on<NumberPressedEvent>((event, emit) => emit(_mapNumberPressedToState(event)));
    on<AdditionEvent>((event, emit) => emit(_mapOperationPressedToState(event)));
    on<SubtractionEvent>((event, emit) => emit(_mapOperationPressedToState(event)));
    on<MultiplicationEvent>((event, emit) => emit(_mapOperationPressedToState(event)));
    on<DivisionEvent>((event, emit) => emit(_mapOperationPressedToState(event)));
    on<PercentageEvent>((event, emit) => emit(_mapOperationPressedToState(event)));
    on<EqualEvent>((event, emit) => emit(_mapEqualPressedToState()));
    on<ClearEvent>((event, emit) => emit(CalculatorInitialState()));
    on<BackspaceEvent>((event, emit) => emit(_mapOperationPressedToState(event)));
    on<DecimalEvent>((event, emit) => emit(_mapOperationPressedToState(event)));
  }

  CalculatorState _mapNumberPressedToState(NumberPressedEvent event) {
    final currentState = state;
    if (currentState is CalculatorInitialState || currentState is CalculatorErrorState) {
      return CalculatorResultState(event.number);
    } else if (currentState is CalculatorResultState) {
      return CalculatorResultState(currentState.result + event.number);
    }
    return currentState;
  }

  CalculatorState _mapOperationPressedToState(CalculatorEvent event) {
    final currentState = state;
    if (currentState is CalculatorResultState) {
      if (event is AdditionEvent) {
        return CalculatorResultState('${currentState.result}+');
      } else if (event is SubtractionEvent) {
        return CalculatorResultState('${currentState.result}-');
      } else if (event is MultiplicationEvent) {
        return CalculatorResultState('${currentState.result}*');
      } else if (event is DivisionEvent) {
        return CalculatorResultState('${currentState.result}/');
      } else if (event is PercentageEvent) {
        return CalculatorResultState('${currentState.result}%');
      } else if (event is DecimalEvent) {
        return CalculatorResultState('${currentState.result}.');
      } else if (event is BackspaceEvent) {
        final String result = currentState.result.substring(0, currentState.result.length - 1);
        return CalculatorResultState(result);
      }
    }
    return currentState;
  }

  CalculatorState _mapEqualPressedToState() {
    final currentState = state;
    if (currentState is CalculatorResultState) {
      try {
        Parser p = Parser();
        Expression exp = p.parse(currentState.result);
        ContextModel cm = ContextModel();
        double eval = exp.evaluate(EvaluationType.REAL, cm);

        return CalculatorResultState((eval % 1 == 0) ? eval.toInt().toString() : eval.toString());
      } catch (e) {
        return const CalculatorErrorState('Error');
      }
    }
    return currentState;
  }
}
