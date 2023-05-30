import 'package:flutter/material.dart';

class leto extends StatefulWidget {
  const leto({Key? key}) : super(key: key);

  @override
  State<leto> createState() => _letoState();
}


class _letoState extends State<leto> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Кнопки +/-'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  _counter--;
                });
              },
            ),
            Text('$_counter'),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  _counter++;
                });
              },
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text('324',
                style: TextStyle(
                  fontSize:16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
