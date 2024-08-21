import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note/core/helper_hive.dart';
import 'package:note/feature/home_screen/data/models/note_model.dart';
import 'package:note/feature/home_screen/manager/provider_note.dart';
import 'package:note/feature/home_screen/views/home_screen.dart';
import 'package:provider/provider.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(HelperHive.noteBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProviderNote>(
      create: (context) => ProviderNote()..get(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );

  }
}