import 'package:flutter/material.dart';
import 'package:light_regulator_app/components/toggle_button.dart';
import 'package:light_regulator_app/modes.dart';


class BathroomPage extends StatefulWidget {
  const BathroomPage({super.key});

  @override
  State<BathroomPage> createState() => _BathroomPageState();
}

class _BathroomPageState extends State<BathroomPage> {
  int activeButtonIndex = -1;  // No button is active initially
  final ModeService _modeService = ModeService();
  final String room = "bathroom";

  @override
  void initState() {
    super.initState();
    _loadCurrentMode();
  }

  Future<void> _loadCurrentMode() async {
    await _modeService.getMode(room);
    setState(() {
      activeButtonIndex = _getButtonIndex(_modeService.getCurrentMode(room));
    });
  }

  int _getButtonIndex(String mode) {
    switch (mode) {
      case 'normal':
        return 0;
      case 'reading':
        return 1;
      case 'saving':
        return 2;
      case 'workout':
        return 3;
      case 'sleeping':
        return 4;
      case 'cinema':
        return 5;
      case 'off':
        return -1;
      default:
        return -1;
    }
  }

  Future<void> _setMode(int index, String mode) async {
    if (activeButtonIndex == index) {
      mode = "off";  // Turn off if the same button is pressed
      index = -1;
    }
    await _modeService.setMode(room, mode);
    setState(() {
      activeButtonIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Bathroom"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.fromLTRB(8, 10, 8, 0),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 359,
                height: 180,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/bathroom.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "  Welcome to the Bathroom",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Select Light Condition',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircularToggleButton(
                    text: 'Normal Mode',
                    index: 0,
                    isActive: activeButtonIndex == 0,
                    onPressed: () => _setMode(0, 'normal'),
                  ),
                  CircularToggleButton(
                    text: 'Reading Mode',
                    index: 1,
                    isActive: activeButtonIndex == 1,
                    onPressed: () => _setMode(1, 'reading'),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircularToggleButton(
                    text: 'Saving Mode',
                    index: 2,
                    isActive: activeButtonIndex == 2,
                    onPressed: () => _setMode(2, 'saving'),
                  ),
                  CircularToggleButton(
                    text: 'Workout Mode',
                    index: 3,
                    isActive: activeButtonIndex == 3,
                    onPressed: () => _setMode(3, 'workout'),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircularToggleButton(
                    text: 'Sleeping Mode',
                    index: 4,
                    isActive: activeButtonIndex == 4,
                    onPressed: () => _setMode(4, 'sleeping'),
                  ),
                  CircularToggleButton(
                    text: 'Cinema Mode',
                    index: 5,
                    isActive: activeButtonIndex == 5,
                    onPressed: () => _setMode(5, 'cinema'),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
