import 'package:flutter/material.dart';

class PrimaryCard extends StatelessWidget {
  const PrimaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Column(
        children: [
          Container(
            height: 120,
            color: Colors.blue,
          ),
          const SizedBox(
            height: 5,
          ),
          const Text('exmpl'),
          const SizedBox(
            height: 5,
          ),
          const Text('300'),
          const SizedBox(
            height: 20,
          ),
          const Text('sostav'),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 20,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20),
            ),
          )
        ],
      ),
    );
  }
}
