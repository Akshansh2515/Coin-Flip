import 'package:flutter/material.dart';
import 'package:coinflip/fliper.dart'; // Assuming CoinFlipper widget is in a separate file named coin_flipper.dart

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(
            123, 105, 175, 250), // Background color set to aqua
        appBar: AppBar(
          title: const Text('Coin Flipper'),
          backgroundColor: Colors.deepOrange, // App bar color set to blue
        ),
        body: const Center(
          child: CoinFlipper(), // CoinFlipper widget as the main content
        ),
      ),
    ),
  );
}
