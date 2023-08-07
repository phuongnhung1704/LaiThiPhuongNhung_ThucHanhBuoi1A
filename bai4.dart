import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  double number1 = 0;
  double number2 = 0;
  String operation = '';
  String result = '';

  void calculateResult() {
    double calculatedResult = 0;

    if (operation == '+') {
      calculatedResult = number1 + number2;
    } else if (operation == '-') {
      calculatedResult = number1 - number2;
    } else if (operation == '*') {
      calculatedResult = number1 * number2;
    } else if (operation == '/') {
      calculatedResult = number1 / number2;
    }

    setState(() {
      result = calculatedResult.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Easy'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Text(
            'Kết quả = $result',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 16),
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              number1 = double.tryParse(value) ?? 0;
            },
            decoration: InputDecoration(
              labelText: 'Nhập số A',
            ),
          ),
          SizedBox(height: 16),
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              number2 = double.tryParse(value) ?? 0;
            },
            decoration: InputDecoration(
              labelText: 'Nhập số B',
            ),
          ),
          SizedBox(height: 20),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              ElevatedButton(
              onPressed: () {
        setState(() {
        operation = '+';
        });
        },
          child: Text('+'),
        ),
        SizedBox(width: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              operation = '-';
            });
          },
          child: Text('-'),
        ),
        SizedBox(width: 20),
        ElevatedButton(
        onPressed: () {
      setState(() {
        operation = '*';
      });
        },
          child: Text('x'),
        ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      operation = '/';
                    });
                  },
                  child: Text(':'),
                ),
              ],
          ),
              SizedBox(height: 25),
              ElevatedButton(
                onPressed: calculateResult,
                child: Text('OK'),
              ),
            ],
          ),
        ),
    );
  }
}