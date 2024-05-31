import 'package:flutter/material.dart';
import 'package:light_regulator_app/components/toggle_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LaundryRoomPage extends StatefulWidget {
   LaundryRoomPage({super.key});
  @override
  State<LaundryRoomPage> createState() => LaundryRoomPageState();
}

class LaundryRoomPageState extends State<LaundryRoomPage> {
  late SharedPreferences _prefs;
  int _activeButtonIndex = 0;
  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    // Retrieve the selected index from shared preferences
    _activeButtonIndex = _prefs.getInt('activeButtonIndex') ?? 0;
    setState(() {}); // Refresh the UI
  }

  Future<void> _setActiveButtonIndex(int index) async {
    // Save the selected index to shared preferences
    await _prefs.setInt('activeButtonIndex', index);
    setState(() {
      _activeButtonIndex = index;
    });
  }

  
  @override
  Widget build(BuildContext context) {
     return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        ),
        body:SingleChildScrollView(
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
                        image:  AssetImage('assets/laundry.png'),
                       fit: BoxFit.cover,),
              ),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("  Welcome to the Laundry",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color:  Theme.of(context).colorScheme.secondary,
                  ),)
                ],
              ),
              ),
            SizedBox(height: 30,),
             Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Select Light Condidtion', style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black
                ),),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              CircularToggleButton(
              text: 'Normal Mode',
              index: 0,
              isActive: _activeButtonIndex == 0,
              onPressed: () {
                setState(() {
                  _activeButtonIndex = 0;
                });
              },
            ),
            CircularToggleButton(
              text: 'Reading Mode',
              index: 0,
              isActive: _activeButtonIndex == 1,
              onPressed: () {
                setState(() {
                  _activeButtonIndex = 1;
                });
              },
            ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              CircularToggleButton(
              text: 'Saving Mode',
              index: 0,
              isActive: _activeButtonIndex == 2,
              onPressed: () {
                setState(() {
                  _activeButtonIndex = 2;
                });
              },
            ),
            CircularToggleButton(
              text: 'Workout Mode',
              index: 0,
              isActive: _activeButtonIndex == 3,
              onPressed: () {
                setState(() {
                  _activeButtonIndex = 3;
                });
              },
            ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              CircularToggleButton(
              text: 'Saving Mode',
              index: 0,
              isActive: _activeButtonIndex == 4,
              onPressed: () {
                setState(() {
                  _activeButtonIndex = 4;
                });
              },
            ),
            CircularToggleButton(
              text: 'Cinema Mode',
              index: 0,
              isActive: _activeButtonIndex == 5,
              onPressed: () {
                setState(() {
                  _activeButtonIndex = 5;
                });
              },
            ),
            SizedBox(height: 20,),
              ],  
            ),
          ],
        ),),
      ),
    );
  }
}