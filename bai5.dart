import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomeScreen(),
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  int counter = 0;
  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.grey,
    // Add more colors here
  ];

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  Color _getRandomColor() {
    Random random = Random();
    return colors[random.nextInt(colors.length)];
  }

  bool _isPrimeNumber(int number) {
    if (number < 2) {
      return false;
    }
    for (int i = 2; i <= sqrt(number); i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController numberController = TextEditingController();

    void checkPrimeNumber() {
      int number = int.tryParse(numberController.text) ?? 0;
      bool isPrime = _isPrimeNumber(number);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Kết quả'),
            content: Text('Số $number ${isPrime ? 'là' : 'không phải là'} số nguyên tố.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );

    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang chủ'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Huỳnh Hoàng Huy, 08_ĐH_TTMT',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 20,
            ),
            buildRowLayout(),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 250,
              child: TextField(
                controller: numberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nhập số',
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: checkPrimeNumber,
              child: const Text('Kiểm tra số nguyên tố'),
            ),
            Expanded(
              child: Container(),
            ),
            Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png',
              width: 250,
            ),
            Expanded(
              child: Container(),
            ),
            ElevatedButton(
              onPressed: () {
                _incrementCounter();
              },
              child: const Text('Đổi màu'),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      backgroundColor: counter.isEven ? _getRandomColor() : null,
    );
  }
}

Widget buildRowLayout() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        color: Colors.blue,
        height: 100,
        width: 100,
      ),
      Container(
        color: Colors.green,
        height: 100,
        width: 100,
      ),
      Container(
        color: Colors.orange,
        height: 100,
        width: 100,
      )
    ],
  );
}
