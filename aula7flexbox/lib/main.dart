import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Minhas receitas")),
        body: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.50,
            width: MediaQuery.of(context).size.width * 0.50,
            child: Container(
              color: const Color.fromARGB(255, 238, 239, 239),
              
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}
