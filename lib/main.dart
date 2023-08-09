import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jogo da Velha',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: JogoDaVelha(),
    );
  }
}

class JogoDaVelha extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String player1Name = '';
  String player2Name = '';
  List<List<String>> board = List.generate(3, (_) => List.filled(3, ''));

  bool player1Turn = true;
  String currentPlayer = '';

  void startGame() {
    setState(() {
      player1Turn = true;
      currentPlayer = player1Name;
      board = List.generate(3, (_) => List.filled(3, ''));
    });
  }

  void makeMove(int row, int col) {
    if (board[row][col] == '' && currentPlayer != '') {
      setState(() {
        board[row][col] = player1Turn ? 'O' : 'X';
        if (checkWin(row, col)) {
          _showWinDialog(currentPlayer);
        } else if (checkDraw()) {
          _showDrawDialog();
        } else {
          player1Turn = !player1Turn;
          currentPlayer = player1Turn ? player1Name : player2Name;
        }
      });
    }
  }

  bool checkWin(int row, int col) {
    String symbol = board[row][col];
    // Check as linhas
    if (board[row].every((s) => s == symbol)) return true;
    // Check as colunas
    if (board.every((r) => r[col] == symbol)) return true;
    // Check o dialogo
    if (row == col && board.every((r) => r[row] == symbol)) return true;
    if (row + col == 2 && board.every((r) => r[2 - row] == symbol)) return true;
    return false;
  }

  bool checkDraw() {
    return board.every((row) => row.every((cell) => cell != ''));
  }

  void _showWinDialog(String winner) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$winner venceu!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                startGame();
              },
              child: Text('Jogar Novamente'),
            ),
          ],
        );
      },
    );
  }

  void _showDrawDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Empate!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                startGame();
              },
              child: Text('Jogar Novamente'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jogo da Velha'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (currentPlayer.isEmpty)
              Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        player1Name = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Nome do Jogador 1 (O)',
                    ),
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        player2Name = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Nome do Jogador 2 (X)',
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      startGame();
                    },
                    child: Text('Começar'),
                  ),
                ],
              ),
            if (currentPlayer.isNotEmpty)
              Column(
                children: [
                  Text('Jogador 1: $player1Name', style: TextStyle(color: Colors.black)),
                  Text('Jogador 2: $player2Name', style: TextStyle(color: Colors.black)),
                  SizedBox(height: 20),
                  Text('Vez de: $currentPlayer', style: TextStyle(color: Colors.black)),
                  SizedBox(height: 20),
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: 9,
                    itemBuilder: (BuildContext context, int index) {
                      int row = index ~/ 3;
                      int col = index % 3;
                      return GestureDetector(
                        onTap: () {
                          makeMove(row, col);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
                          child: Center(
                            child: Text(
                              board[row][col],
                              style: TextStyle(fontSize: 32, color: Colors.blue),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
