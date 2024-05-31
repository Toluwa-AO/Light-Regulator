import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int activeButtonIndex = 0; // Initially, the first button is active

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildCircularToggleButton(0, 'Normal Mode'),
            SizedBox(height: 20),
            buildCircularToggleButton(1, 'Button 2'),
            SizedBox(height: 20),
            buildCircularToggleButton(2, 'Button 3'),
            SizedBox(height: 20),
            buildCircularToggleButton(3, 'Button 4'),
            SizedBox(height: 20),
            buildCircularToggleButton(4, 'Button 5'),
            SizedBox(height: 20),
            buildCircularToggleButton(5, 'Button 6'),
          ],
        ),
      ),
    );
  }

  Widget buildCircularToggleButton(int index, String text) {
    return CircularToggleButton(
      text: text,
      index: index,
      isActive: activeButtonIndex == index,
      onPressed: () {
        setState(() {
          activeButtonIndex = index;
        });
      },
    );
  }
}

class CircularToggleButton extends StatelessWidget {
  final String text;
  final int index;
  final bool isActive;
  final VoidCallback onPressed;

  const CircularToggleButton({
    required this.text,
    required this.index,
    required this.isActive,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 140,
        height: 140,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? Colors.green : Colors.grey,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isActive ? Colors.white : Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
