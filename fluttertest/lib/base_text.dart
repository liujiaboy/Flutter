import 'package:flutter/material.dart';

class BaseText extends StatelessWidget {
  const BaseText({Key? key}) : super(key: key);

  final String _title = "Flutter";
  final String _name = "Alan";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text"),
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  color: Colors.red,
                  padding: const EdgeInsets.all(30.0),
                  margin: const EdgeInsets.all(20),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: _title,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 40.0,
                          ),
                        ),
                        const TextSpan(
                          text: "-- ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                        TextSpan(
                          text: _name,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(),
          ],
        ),
      ),
    );
  }
}
