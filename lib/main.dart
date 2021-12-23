import 'package:flutter/material.dart';

import 'appbody.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.grey.shade700),
        iconTheme: IconThemeData(color: Colors.white),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.white12)),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exam Test"),
        centerTitle: true,
      ),
      body: AppBody(),
      backgroundColor: Colors.grey.shade600,
      floatingActionButton: FloatingActionButton(
        hoverColor: Colors.red,
        onPressed: () {},
        child: Icon(Icons.upload_file),
      ),
    );
  }
}
