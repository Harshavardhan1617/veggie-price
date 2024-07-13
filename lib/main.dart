import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Market Prices',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          PriceCard(),
          PriceCard(),
        ],
      ),
    );
  }
}

class PriceCard extends StatelessWidget {
  const PriceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
      height: 110.0,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0), color: Colors.white),
    );
  }
}
