import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness App',
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: Colors.pinkAccent,
          secondary: Colors.black,
          tertiary: Colors.grey,
        )
      ),
      home: const HomePage(title: 'Fitness time'),
    );
  }
}

