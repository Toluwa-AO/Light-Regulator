import 'package:flutter/material.dart';
import 'toggle_button.dart';

class ToggleGridPage extends StatefulWidget {
  @override
  _ToggleGridPageState createState() => _ToggleGridPageState();
}

class _ToggleGridPageState extends State<ToggleGridPage> {
  int _activeIndex = 0;

  void _handleToggle(int index) {
    setState(() {
      _activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          padding: EdgeInsets.all(16.0),
          itemCount: 6,
          itemBuilder: (context, index) {
            return ToggleButton(
              isActive: _activeIndex == index,
              onPressed: () => _handleToggle(index),
            );
          },
        ),
      ),
    );
  }
}
