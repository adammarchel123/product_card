import 'package:belajar_card/home_page.dart';
import 'package:belajar_card/product_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<ProductState>(
          create: (context) => ProductState(), child: HomePage()),
    );
  }
}
