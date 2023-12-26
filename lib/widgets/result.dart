import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:calculator/logic/calculator_bloc.dart';
import 'package:calculator/logic/calculator_state.dart';

class CalculatorOutput extends StatelessWidget {
  const CalculatorOutput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        if (state is CalculatorResultState) {
          final result = state.result;
          if (result.isNotEmpty) {
            return Text(
              result,
              style: const TextStyle(fontSize: 28, color: Colors.white),
            );
          } else {
            return Container();
          }
        } else if (state is CalculatorErrorState) {
          return Text(
            state.error,
            style: const TextStyle(fontSize: 28, color: Colors.red),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
