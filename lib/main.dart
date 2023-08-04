import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Tela(),
    ),
  );
}

class Tela extends StatefulWidget {
  const Tela({super.key});

  @override
  State<Tela> createState() => _TelaState();
}

class _TelaState extends State<Tela> {
  String busca = '';

  @override
  Widget build(BuildContext context) {
    List<String> categorias = [
      'Sobremesas',
      'Pratos principais',
      'Aperitivos',
    ];
    List<String> nomesPratos = [
      'Prato A',
      'Prato B',
      'Prato C',
    ];
    nomesPratos =
        nomesPratos.where((nomePrato) => nomePrato.contains(busca)).toList();

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              initialValue: busca,
              onChanged: (valor) {
                setState(() {
                  busca = valor;
                });
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Buscar prato',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          for (String categoria in categorias)
            Padding(
              padding: const EdgeInsets.all(10),
              child: Secao(
                titulo: categoria,
                nomesPratos: nomesPratos,
              ),
            ),
        ],
      ),
    );
  }
}

class Secao extends StatelessWidget {
  final String titulo;
  final List<String> nomesPratos;

  const Secao({
    super.key,
    required this.titulo,
    required this.nomesPratos,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      
       crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          
          child: Text(
            titulo,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
             crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (String nomePrato in nomesPratos)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
        
                  child:  Expanded(
                    child:  SizedBox(                
                    width: 400,
                    height: 200,
                    child: Card(
              
                      margin: EdgeInsets.all(10),
                      color: Colors.blue,
                   
                      child: CardPrato(
                        nome:  nomePrato, 
                        
                        icone: const Icon(Icons.restaurant, size: 40, color: Colors.white, ),
                      ),
                    ),
                  ),)
                  
                  
                 
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class CardPrato extends StatelessWidget {
  final String nome;
  final Icon icone;

  const CardPrato({
    super.key,
    required this.nome,
    required this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        bool? resultado = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => TelaDescricao(
              nomePrato: nome,
            ),
          ),
        );
        if (resultado == null) {
          print('Usuário apenas visualizou.');
        } else {
          print('Usuário selecionou: $resultado');
        }
      },

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icone,
          Text(nome, style: TextStyle(fontSize: 20),),
        ],
      ),
    );
  }
}

class TelaDescricao extends StatelessWidget {
  final String nomePrato;

  const TelaDescricao({super.key, required this.nomePrato});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(nomePrato)),
      body: Column(
        children: [
          const Text('Olá, mundo!'),
          TextButton(
            child: const Text('fazer pedido'),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
          TextButton(
            child: const Text('cancelar pedido'),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
          TextButton(
            child: const Text('voltar'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
