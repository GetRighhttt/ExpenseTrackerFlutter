import 'package:flutter/material.dart';
import 'pages/expense_page.dart';

// defining a color scheme for theming using fromSeed which defines colors that
// automatically work with the color defined by Flutter
var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.blue);
var kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark, seedColor: Colors.blue.shade900);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// working with theming and figuring out how it works
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          elevation: 10,
          margin: const EdgeInsets.all(10),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              bodyLarge: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: kDarkColorScheme.onPrimaryContainer,
              ),
              bodyMedium: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: kDarkColorScheme.onPrimaryContainer,
              ),
              titleMedium: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: kDarkColorScheme.onPrimaryContainer,
              ),
              titleLarge: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: kDarkColorScheme.onPrimaryContainer,
              ),
            ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          elevation: 10,
          margin: const EdgeInsets.all(10),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Theme.of(context).primaryColorLight,
              ),
            ),
      ),
      themeMode: ThemeMode.system, // default theme
      home: const ExpenseTrackerPage(),
    );
  }
}
