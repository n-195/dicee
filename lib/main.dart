import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red[100],
        appBar: AppBar(
          title: const Center(child: Text('Dicee')),
          backgroundColor: Colors.red[300],
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatelessWidget {
  DicePage({super.key});
  // When we declare the variable outside the buildContext, it throws a warning
  // but would still work. The warning tells that this class DicePage inherits
  // from a class that is marked immutable, and therefore should be immutable too,
  // but we are violating that property by using an element that will change
  // randomly, in a stateless(where we don't need to worry about the state of
  // the app changing) widget. So it is best practice to use a stateful widget
  // in such case.
  int leftDiceNum = 5;
  @override
  Widget build(BuildContext context) {
    leftDiceNum = 2;
    // If we declare the variable outside the build, and then try to change it
    // and do hot-reload, the variable change would not show any effect as
    // hot-reload considers the changes within the build only.
    // var leftDiceNum = 5;
    return Center(
      child: Row(
        children: <Widget>[
          // Rather than giving the width property ourselves,
          // Expanded widget allows the asset to take whatever space the device
          // screen allows rather than pixels overflowing to the right.

          Expanded(
            // flex: 2,

            // Padding here was removed since we are making the image into a
            // button, and buttons come with inherent padding
            child: TextButton(
              onPressed: () {
                print("Left Button");
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('images/dice$leftDiceNum.png'),
              ),
            ),
          ),
          Expanded(
            // flex helps in deciding the ratio/amount of space the asset under
            // Expanded will occupy on screen.
            // It is 1 by-default.
            flex: 1,
            child: TextButton(
              onPressed: () {
                print("Right Button");
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('images/dice2.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
