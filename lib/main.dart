import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/input_service.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => InputService(),
      child: MaterialApp(
        title: 'Dynamic Terabox App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
