import 'package:calculator/logic/calculator_bloc.dart';
import 'package:calculator/logic/calculator_event.dart';
import 'package:calculator/widgets/button.dart';
import 'package:calculator/widgets/input.dart';
import 'package:calculator/widgets/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorScreen extends StatelessWidget {
  CalculatorScreen({super.key});

  final Map<String, Function(BuildContext)> buttonActions = {
    'C': (context) => BlocProvider.of<CalculatorBloc>(context).add(ClearEvent()),
    '⌫': (context) => BlocProvider.of<CalculatorBloc>(context).add(BackspaceEvent()),
    '%': (context) => BlocProvider.of<CalculatorBloc>(context).add(PercentageEvent()),
    '÷': (context) => BlocProvider.of<CalculatorBloc>(context).add(DivisionEvent()),
    '7': (context) => BlocProvider.of<CalculatorBloc>(context).add(NumberPressedEvent('7')),
    '8': (context) => BlocProvider.of<CalculatorBloc>(context).add(NumberPressedEvent('8')),
    '9': (context) => BlocProvider.of<CalculatorBloc>(context).add(NumberPressedEvent('9')),
    '×': (context) => BlocProvider.of<CalculatorBloc>(context).add(MultiplicationEvent()),
    '4': (context) => BlocProvider.of<CalculatorBloc>(context).add(NumberPressedEvent('4')),
    '5': (context) => BlocProvider.of<CalculatorBloc>(context).add(NumberPressedEvent('5')),
    '6': (context) => BlocProvider.of<CalculatorBloc>(context).add(NumberPressedEvent('6')),
    '-': (context) => BlocProvider.of<CalculatorBloc>(context).add(SubtractionEvent()),
    '1': (context) => BlocProvider.of<CalculatorBloc>(context).add(NumberPressedEvent('1')),
    '2': (context) => BlocProvider.of<CalculatorBloc>(context).add(NumberPressedEvent('2')),
    '3': (context) => BlocProvider.of<CalculatorBloc>(context).add(NumberPressedEvent('3')),
    '+': (context) => BlocProvider.of<CalculatorBloc>(context).add(AdditionEvent()),
    '±': (context) => () {},
    '0': (context) => BlocProvider.of<CalculatorBloc>(context).add(NumberPressedEvent('0')),
    '.': (context) => BlocProvider.of<CalculatorBloc>(context).add(DecimalEvent()),
    '=': (context) => BlocProvider.of<CalculatorBloc>(context).add(EqualEvent()),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF17171C),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Expanded(flex: 1, child: CalculatorInput()),
            const CalculatorOutput(),
            Expanded(
              flex: 2,
              child: GridView.builder(
                itemCount: buttonActions.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  final entry = buttonActions.entries.elementAt(index);
                  final String title = entry.key;
                  final Function(BuildContext) onPressed = entry.value;

                  Color? buttonColor;
                  if (['C', '⌫', '%', '±'].contains(title)) {
                    buttonColor = const Color(0xFF4E4F5F);
                  } else if (['×', '-', '+', '=', '÷'].contains(title)) {
                    buttonColor = const Color(0xFF4B5EFC);
                  }

                  return CalculatorButton(
                    color: buttonColor,
                    title: title,
                    onPressed: () => onPressed(context),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
