import 'package:flutter/material.dart';

import 'price_card.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
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
      backgroundColor: Colors.red[400],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PriceCard(
            name: 'Tomato',
            price: '70',
            img:
                'https://cdn.pixabay.com/photo/2022/09/05/09/50/tomatoes-7433786_1280.jpg',
          ),
        ],
      ),
    );
  }
}
