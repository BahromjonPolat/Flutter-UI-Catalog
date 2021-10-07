import 'package:flutter/material.dart';

class TicTacToe extends StatefulWidget {
  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  static const Color _white = Colors.white;
  static const Color _red = Colors.red;
  static const Color _black = Colors.black;
  static const Color _green = Colors.green;
  static const Color _grey = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  _getBody() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _showGameArea(),
        ],
      );

  AppBar _getAppBar() => AppBar(
        title: Text("Tic Tac Toe"),
      );

  _showGameArea() => Expanded(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: 9,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: _grey,
                borderRadius: BorderRadius.circular(16.0),

              ),child: IconButton(
                onPressed: (){
                  debugPrint("Clicked");
                },
                icon: Icon(Icons.clear)),
            );
          }));
}
