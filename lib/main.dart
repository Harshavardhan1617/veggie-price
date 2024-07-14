import 'package:flutter/material.dart';
import 'veg_list.dart';
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
      backgroundColor: Colors.red,
      body: ListView.builder(
        itemCount: veggies.length, // Get the number of items from the map
        itemBuilder: (context, index) {
          final vegetableName =
              veggies.keys.toList()[index]; // Get vegetable name
          final vegetableData =
              veggies[vegetableName]; // Get data for the vegetable
          return PriceCard(
            name: vegetableName,
            price: vegetableData?['price'] ?? '',
            img: vegetableData?['imageUrl'] ?? '',
          );
        },
      ),
    );
  }
}
