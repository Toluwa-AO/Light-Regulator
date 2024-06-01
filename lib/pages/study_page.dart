import 'package:flutter/material.dart';
import 'package:light_regulator_app/components/toggle_button.dart';

class StudyPage extends StatefulWidget {
  const StudyPage({super.key});

  @override
  State<StudyPage> createState() => _StudyPageState();
}

  

class _StudyPageState extends State<StudyPage> {
  int activeButtonIndex = 0;

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
                        image:  AssetImage('assets/study.png'),
                       fit: BoxFit.cover,),
              ),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("  Welcome to the Study",style: TextStyle(
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
              isActive: activeButtonIndex == 0,
              onPressed: () {
                setState(() {
                  activeButtonIndex = 0;
                });
              },
            ),
            CircularToggleButton(
              text: 'Reading Mode',
              index: 0,
              isActive: activeButtonIndex == 1,
              onPressed: () {
                setState(() {
                  activeButtonIndex = 1;
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
              isActive: activeButtonIndex == 2,
              onPressed: () {
                setState(() {
                  activeButtonIndex = 2;
                });
              },
            ),
            CircularToggleButton(
              text: 'Workout Mode',
              index: 0,
              isActive: activeButtonIndex == 3,
              onPressed: () {
                setState(() {
                  activeButtonIndex = 3;
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
              text: 'Sleeping Mode',
              index: 0,
              isActive: activeButtonIndex == 4,
              onPressed: () {
                setState(() {
                  activeButtonIndex = 4;
                });
              },
            ),
            CircularToggleButton(
              text: 'Cinema Mode',
              index: 0,
              isActive: activeButtonIndex == 5,
              onPressed: () {
                setState(() {
                  activeButtonIndex = 5;
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