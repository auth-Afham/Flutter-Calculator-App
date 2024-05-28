import 'package:flutter/material.dart';

// Entry point of the Flutter application
void main() {
  runApp(TicTacToeApp());
}

// StatefulWidget for the TicTacToeApp
class TicTacToeApp extends StatefulWidget {
  @override
  _TicTacToeAppState createState() => _TicTacToeAppState(); // Creates the mutable state
}

// State class for TicTacToeApp
class _TicTacToeAppState extends State<TicTacToeApp> {
  List<String> board = List.filled(9, ''); // Initialize an empty board with 9 cells
  bool isXTurn = true; // Keep track of the current player's turn
  bool gameOver = false; // Flag to check if the game is over

  // Handle the tap on a cell
  void handleTap(int index) {
    if (!gameOver && board[index] == '') {
      setState(() {
        board[index] = isXTurn ? 'X' : 'O'; // Set the cell to 'X' or 'O' based on the current player's turn
        isXTurn = !isXTurn; // Switch turns
        checkGameOver(); // Check if the game is over
      });
    }
  }

  // Check if the game is over
  void checkGameOver() {
    // Check rows for a win
    for (int i = 0; i < 9; i += 3) {
      if (board[i] != '' && board[i] == board[i + 1] && board[i + 1] == board[i + 2]) {
        gameOver = true;
        return;
      }
    }

    // Check columns for a win
    for (int i = 0; i < 3; i++) {
      if (board[i] != '' && board[i] == board[i + 3] && board[i + 3] == board[i + 6]) {
        gameOver = true;
        return;
      }
    }

    // Check diagonals for a win
    if (board[0] != '' && board[0] == board[4] && board[4] == board[8]) {
      gameOver = true;
      return;
    }
    if (board[2] != '' && board[2] == board[4] && board[4] == board[6]) {
      gameOver = true;
      return;
    }

    // Check if the board is full
    if (board.every((cell) => cell != '')) {
      gameOver = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Building the widget tree
    return MaterialApp(
      title: 'Tic Tac Toe', // Title of the application
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tic Tac Toe'), // Title of the app bar
        ),
        body: Column(
          children: [
            Expanded(
              // Expanded widget to take up remaining space
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Create a grid with 3 columns
                ),
                itemCount: 9, // Number of cells in the grid
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => handleTap(index), // Handle tap on the cell
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(), // Border around each cell
                      ),
                      child: Center(
                        // Center the text inside the cell
                        child: Text(
                          board[index], // Display 'X' or 'O' based on the cell value
                          style: TextStyle(
                            fontSize: 48, // Font size of the text
                            fontWeight: FontWeight.bold, // Font weight of the text
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            gameOver
                ? Text(
                    'Game Over!', // Display 'Game Over!' message when the game is over
                    style: TextStyle(
                      fontSize: 24, // Font size of the message
                      fontWeight: FontWeight.bold, // Font weight of the message
                    ),
                  )
                : Text(
                    'Next Player: ${isXTurn ? 'X' : 'O'}', // Display the next player
                    style: TextStyle(
                      fontSize: 24, // Font size of the text
                      fontWeight: FontWeight.bold, // Font weight of the text
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
