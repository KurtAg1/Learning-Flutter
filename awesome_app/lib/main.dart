import 'package:flutter/material.dart';

void main() {
  // WidgetsApp // MaterialApp // CupertinoApp
  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Awesome App"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8),
          width: 100,
          height: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [
                  Colors.pink,
                  Colors.yellow,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10,
                ),
              ]),
          child: Text(
            "I am a Box",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
