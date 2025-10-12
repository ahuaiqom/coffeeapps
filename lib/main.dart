import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/home_controller.dart';
import 'screens/home_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => HomeController()..init(),
      child: const CoffeeApp(),
    ),
  );
}

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee',
      theme: AppTheme.light,        
      darkTheme: AppTheme.dark,     
      themeMode: ThemeMode.light,   
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
