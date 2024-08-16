import 'package:flutter/material.dart';
import 'package:note/feature/home_screen/manager/provider_note.dart';
import 'package:note/feature/home_screen/views/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProviderNote>(
      create: (context) => ProviderNote(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );

  }
}