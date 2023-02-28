import 'package:flutter/material.dart';
import 'package:mvvm_clean_arc/features/post/view/post_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home:PostView(),
    );
  }
}