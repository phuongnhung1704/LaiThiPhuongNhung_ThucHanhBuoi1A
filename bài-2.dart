import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My app', // used by the OS task switcher
      home: MyHomeScreen(),
    ),
  );
}

class MyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Lai Thi Phuong Nhung'),
      ),
      body: SafeArea(
        child: Container(
            alignment: Alignment.center,
            width: 390,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'chao thay em la Phuong Nhung lop 08DHTTMT MSSV 0860070036 ',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 20,
                ),
                buildRowLayout(),
                SizedBox(
                  height: 20,
                ),
                Image.network(
                  'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
                  width: 120,
                ),

                ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('+10k')));
                    },
                    child: Text('Nhấn đi')),
              ],
            )),
      ),
    );
  }
}

Widget buildRowLayout() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        color: Colors.pink,
        height: 100,
        width: 100,
      ),
      Container(
        color: Colors.yellow,
        height: 100,
        width: 100,
      ),
      Container(
        color: Colors.brown,
        height: 100,
        width: 100,
      )
    ],
  );
}
