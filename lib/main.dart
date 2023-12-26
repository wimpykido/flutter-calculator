import 'package:calculator/logic/calculator_bloc.dart';
import 'package:calculator/screens/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => CalculatorBloc(),
        child: const CalculatorScreen(),
      ),
    );
  }
}
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'calculator',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF17171C)),
//         useMaterial3: true,
//       ),
//       home: BlocProvider(
//         create: (context) => CalculatorBloc(),
//         child: CalculatorScreen(),
//       ),
//     );
//   }
// }
