import 'package:flutter/material.dart';
import 'screens/coffee_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

 

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Roboto',
      ),
      home: const CoffeeListScreen(), // langsung ke CoffeeListScreen
    );
  }
}
