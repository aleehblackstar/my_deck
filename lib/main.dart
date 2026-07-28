import 'package:fase_4/models/deck.model.dart';
import 'package:fase_4/models/question.model.dart';
import 'package:fase_4/repositories/deck.repository.dart';
import 'package:fase_4/repositories/question.repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

import 'pages/decks/decks.page.dart';



void initServiceLocator() {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FlashCard App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: DecksPage(),
    );
  }
}
