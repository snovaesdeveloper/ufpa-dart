import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      
      home: Scaffold(
          appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Gerenciamento Estado / Ciclo'),
        ),
        body: 
        Container(
          child: Tela(),
          
        ),
        
      ),
    );
  }
}

 
   class Tela extends StatelessWidget {
    
    @override
    Widget  build (BuildContext context){
      return  Scaffold(
        body: Column( 
          children: [
            Cabecalho(),
            Corpo(valor: 42),
            Contador( valorInicial: 2)
          ]
        )
      );
    }
  }


    class Cabecalho extends StatefulWidget {
      const Cabecalho({super.key});

      @override
      State<Cabecalho> createState() => _EstadoCabecalho();
     
    }


    class _EstadoCabecalho extends State<Cabecalho> {
       @override
      Widget build (BuildContext context){
        return const Text('Cabeçalho');
      }
    }

    /// alterando para StateFul
    /// 1 passo alterar de StatelessWidget  para StatefulWidget
    /// metodo state privado => chamadaDoEstado 
    /// Criar uma classe chamadaDoEstado 


   class _EstadoCorpo extends State<Corpo> {
       @override
      Widget build(BuildContext context){
        return Text('Corpo: ${widget.valor}');
      }
   }


    class Corpo extends StatefulWidget {
      final int valor;

      const Corpo({super.key, required this.valor});

      @override
      State<Corpo> createState() => _EstadoCorpo();
    }
   

   class Contador extends StatefulWidget 
   {
    final int valorInicial;
   const Contador({super.key, required this.valorInicial});

     @override
      State<Contador> createState() => _EstadoContador();
   }

 class _EstadoContador extends State<Contador> {

    int count =0;
    
@override
void initState(){
  super.initState();
  count= widget.valorInicial;
}

       @override
     Widget build (BuildContext context){
      return Column(
        children: [
         
          Text('$count', ),
          

          TextButton(
            child: Text('Adicionar'),
            onPressed: () {
              setState((){
                count +=1;
              });
            },
             )
        ],
      );
    }  
    }


