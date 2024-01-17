import 'package:flutter/material.dart';
import 'package:flutter_hive/home_screen.dart';
import 'package:flutter_hive/test_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

const myBox = 'myBox';
void main() async {
  // 초기화
  await Hive.initFlutter();
  // 박스를 열어준다.
  await Hive.openBox(myBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TestScreen(),
    );
  }
}
