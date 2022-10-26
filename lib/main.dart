import 'package:fitness_time/screens/crono_page.dart';
import 'package:fitness_time/widgets/inherited_profile.dart';
import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InheritedProfiles(
      child: MaterialApp(
        title: 'Fitness App',
        theme: ThemeData(
            textTheme:
                GoogleFonts.montserratAlternatesTextTheme(textTheme).copyWith(
              bodyMedium:
                  GoogleFonts.montserrat(textStyle: textTheme.bodyMedium),
            ),
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: Colors.pinkAccent,
                  secondary: Colors.black,
                  tertiary: Colors.grey,
                )),
        home: const HomePage(
            title: 'Fitness time',
        ),
      ),
    );
  }
}
