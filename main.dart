import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/providers/manhwa_provider.dart';
import 'package:state_management_provider/screens/home_screen.dart';

void main() {
  runApp(ChangeNotifierProvider<ManhwaProvider>(
    child: const MyApp(),
    create: (_) => ManhwaProvider(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Annisa Day 21',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomeScreen(),
    );
  }
}
