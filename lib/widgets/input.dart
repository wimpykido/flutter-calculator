import 'package:calculator/logic/calculator_bloc.dart';
import 'package:calculator/logic/calculator_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorInput extends StatelessWidget {
  const CalculatorInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: SizedBox(
        child: BlocBuilder<CalculatorBloc, CalculatorState>(
          builder: (context, state) {
            String displayText = '0';

            if (state is CalculatorResultState) {
              // Display user input if available
              displayText = state.result;
            } else if (state is CalculatorInitialState) {
              // Display default "zero" for initial state
              displayText = '0';
            }

            return Text(
              displayText,
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.right,
            );
          },
        ),
      ),
    );
  }
}
