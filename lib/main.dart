import 'package:blokal/ui/screens/start.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Berita Lokal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        primaryColor: Color(0xFF151515),
        accentColor: Color(0xFFFFBC02D),
        canvasColor: Color(0xFF212121),
        cardColor: Color(0xFF2C2C2C),
        dialogBackgroundColor: Color(0xFF2C2C2C),
        dividerColor: Color(0xFF616161),
        highlightColor: Color(0xFF424242),
      ),
      home: StartScreen(),
    );
  }
}
