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
        body: const Align(
            alignment: Alignment.topCenter,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                      child: Text("Sobremesas",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 44,
                            fontWeight: FontWeight.bold,
                          ))),
                  Text('''
Torta de Maça
Mousse de Chomolate
Pudin de Leite Condensado
''',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                      )),
                  Center(
                      child: Text("Pratos Principais",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 44,
                            fontWeight: FontWeight.bold,
                          ))),
                  Text('''
Torta de maçã
Mousse de Chomolate
Pudin de Leite Condensado
''',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                      )),
                  Center(
                      child: Text("Aperitivos",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 44,
                            fontWeight: FontWeight.bold,
                          ))),
                  Text('''
Bolinhos de Queijo
Brusquetta de Tomate e Manjericão
Canappés de Salmão com Cream Chease
''',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                      )),
                ])),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }

  
}
