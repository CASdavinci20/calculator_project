// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 63, 185, 183)),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'simple calculator',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController num1Controller = TextEditingController();

  String result = '';

  void onNumberPressed(String number) {
    setState(() {

      if (number == '=') {
        num1Controller.text = calculateResult(num1Controller.text);
      } else {
        num1Controller.text += number;
      }
    });
  }

  double add(double num1, double num2) {
    return num1 + num2;
  }

  double subtract(double num1, double num2) {
    return num1 - num2;
  }

  double divide(double num1, double num2) {
    return num1 / num2;
  }

  double multiply(double num1, double num2) {
    return num1 * num2;
  }

  String calculateResult(String values) {
    values = values.replaceAll('.', 'm');
    RegExp pattern = RegExp(r'[+*-/]');

    String? operator = pattern.firstMatch(values.trim())?.group(0);

    var arr = num1Controller.text.split(operator!);
    double num1 = double.parse(arr[0]);
    double num2 = double.parse(arr[1]);

    switch (operator) {
      case '+':
        return add(num1, num2).toString();

      case '-':
        return subtract(num1, num2).toString();

      case '*':
        return multiply(num1, num2).toString();

      case '/':
        return divide(num1, num2).toString();

      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('THE SIMPLE CALCULATOR'),
        
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: TextField(
                  controller: num1Controller,
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(labelText: 'Enter Number 1'),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => onNumberPressed('1'),
                    child: const Text('1'),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () => onNumberPressed('2'),
                    child: const Text('2'),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () => onNumberPressed('3'),
                    child: const Text('3'),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () => onNumberPressed('+'),
                    child: const Text('+'),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => onNumberPressed('4'),
                    child: const Text('4'),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () => onNumberPressed('5'),
                    child: const Text('5'),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () => onNumberPressed('6'),
                    child: const Text('6'),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () => onNumberPressed('/'),
                    child: const Text('/'),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton(
                  onPressed: () => onNumberPressed('7'),
                  child: const Text('7'),
                ),
                const SizedBox(width: 15),
                ElevatedButton(
                  onPressed: () => onNumberPressed('8'),
                  child: const Text('8'),
                ),
                const SizedBox(width: 15),
                ElevatedButton(
                  onPressed: () => onNumberPressed('9'),
                  child: const Text('9'),
                ),
                const SizedBox(width: 15),
                ElevatedButton(
                  onPressed: () => onNumberPressed('*'),
                  child: const Text('x'),
                ),
              ]),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => onNumberPressed('-'),
                    child: const Text('-'),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () => onNumberPressed('0'),
                    child: const Text('0'),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () => onNumberPressed('='),
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromWidth(130.0),
                    ),
                    child: const Text('='),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
