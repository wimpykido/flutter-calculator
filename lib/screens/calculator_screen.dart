import 'package:calculator/logic/calculator_bloc.dart';
import 'package:calculator/logic/calculator_event.dart';
import 'package:calculator/widgets/button.dart';
import 'package:calculator/widgets/input.dart';
import 'package:calculator/widgets/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
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
                    child: GridView.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  children: [
                    CalculatorButton(
                      color: const Color(0xFF4E4F5F),
                      title: 'C',
                      isOperator: true,
                      onPressed: () => BlocProvider.of<CalculatorBloc>(context)
                          .add(ClearEvent()),
                    ),
                    CalculatorButton(
                      color: const Color(0xFF4E4F5F),
                      icon: const Icon(
                        Icons.backspace,
                        color: Colors.white,
                      ),
                      isOperator: true,
                      onPressed: () {
                        BlocProvider.of<CalculatorBloc>(context)
                            .add(BackspaceEvent());
                      },
                    ),
                    CalculatorButton(
                      title: '%',
                      color: const Color(0xFF4E4F5F),
                      isOperator: true,
                      onPressed: () {
                        BlocProvider.of<CalculatorBloc>(context)
                            .add(PercentageEvent());
                      },
                    ),
                    CalculatorButton(
                      title: '÷',
                      color: const Color(0xFF4B5EFC),
                      isOperator: true,
                      onPressed: () {
                        BlocProvider.of<CalculatorBloc>(context)
                            .add(DivisionEvent());
                      },
                    ),
                    CalculatorButton(
                      title: '7',
                      onPressed: () => BlocProvider.of<CalculatorBloc>(context)
                          .add(NumberPressedEvent('7')),
                    ),
                    CalculatorButton(
                      title: '8',
                      onPressed: () => BlocProvider.of<CalculatorBloc>(context)
                          .add(NumberPressedEvent('8')),
                    ),
                    CalculatorButton(
                      title: '9',
                      onPressed: () => BlocProvider.of<CalculatorBloc>(context)
                          .add(NumberPressedEvent('9')),
                    ),
                    CalculatorButton(
                      title: '×',
                      color: const Color(0xFF4B5EFC),
                      isOperator: true,
                      onPressed: () {
                        BlocProvider.of<CalculatorBloc>(context)
                            .add(MultiplicationEvent());
                      },
                    ),
                    CalculatorButton(
                      title: '4',
                      onPressed: () => BlocProvider.of<CalculatorBloc>(context)
                          .add(NumberPressedEvent('4')),
                    ),
                    CalculatorButton(
                      title: '5',
                      onPressed: () => BlocProvider.of<CalculatorBloc>(context)
                          .add(NumberPressedEvent('5')),
                    ),
                    CalculatorButton(
                      title: '6',
                      onPressed: () => BlocProvider.of<CalculatorBloc>(context)
                          .add(NumberPressedEvent('6')),
                    ),
                    CalculatorButton(
                      title: '-',
                      color: const Color(0xFF4B5EFC),
                      isOperator: true,
                      onPressed: () {
                        BlocProvider.of<CalculatorBloc>(context)
                            .add(SubtractionEvent());
                      },
                    ),
                    CalculatorButton(
                      title: '1',
                      onPressed: () => BlocProvider.of<CalculatorBloc>(context)
                          .add(NumberPressedEvent('1')),
                    ),
                    CalculatorButton(
                      title: '2',
                      onPressed: () => BlocProvider.of<CalculatorBloc>(context)
                          .add(NumberPressedEvent('2')),
                    ),
                    CalculatorButton(
                      title: '3',
                      onPressed: () => BlocProvider.of<CalculatorBloc>(context)
                          .add(NumberPressedEvent('3')),
                    ),
                    CalculatorButton(
                      title: '+',
                      color: const Color(0xFF4B5EFC),
                      isOperator: true,
                      onPressed: () {
                        BlocProvider.of<CalculatorBloc>(context)
                            .add(AdditionEvent());
                      },
                    ),
                    const CalculatorButton(
                      icon: Icon(
                        IconData(0x00B1, fontFamily: 'MaterialIcons'),
                      ),
                      color: Color(0xFF4E4F5F),
                    ),
                    CalculatorButton(
                      title: '0',
                      onPressed: () => BlocProvider.of<CalculatorBloc>(context)
                          .add(NumberPressedEvent('0')),
                    ),
                    CalculatorButton(
                      title: '.',
                      onPressed: () => BlocProvider.of<CalculatorBloc>(context)
                          .add(DecimalEvent()),
                    ),
                    CalculatorButton(
                      title: '=',
                      color: const Color(0xFF4B5EFC),
                      isOperator: true,
                      onPressed: () {
                        BlocProvider.of<CalculatorBloc>(context)
                            .add(EqualEvent());
                      },
                    ),
                  ],
                ))
              ]),
        ));
  }
}
