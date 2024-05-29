import 'package:flutter/material.dart';

class ToggleButton extends StatelessWidget {
  final bool isActive;
  final VoidCallback onPressed;

  const ToggleButton({
    Key? key,
    required this.isActive,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: isActive ? Colors.green : Colors.grey,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            isActive ? 'ON' : 'OFF',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
