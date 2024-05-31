import 'package:flutter/material.dart';
import 'package:light_regulator_app/components/toggle.dart';

class BedroomPage extends StatelessWidget {
  const BedroomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        ),
        body:SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(8, 10, 8, 0),
          width: MediaQuery.of(context).size.width,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 359,
              height: 240,
              decoration: BoxDecoration(
               image: DecorationImage(
                        image:  AssetImage('assets/bedroom.png'),
                       fit: BoxFit.cover,),
              ),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("  Welcome to the Bedroom",style: TextStyle(
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
                  color: Theme.of(context).colorScheme.primary,
                ),),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ToggleGridPage(),
              ],
            ),
          ],
        ),),
      ),
    );
  }
}