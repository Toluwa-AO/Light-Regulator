import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:light_regulator_app/components/my_drawer.dart';
import 'package:light_regulator_app/pages/bedroom_page.dart';
import 'package:light_regulator_app/pages/laundry_page.dart';
import 'package:light_regulator_app/pages/bathroom.dart';
import 'package:light_regulator_app/pages/study_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar (backgroundColor: Colors.transparent,),
      drawer: const MyDrawer(),
      body:SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
          width: MediaQuery.of(context).size.width,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           Container(
            width: 359,
            height: 259,
            child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Container(
                width: 359,
                height: 259,
                child: Stack(
                    children: [
                        Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                                width: 359,
                                height: 259,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                   image:  AssetImage('assets/home.png'),
                                  fit: BoxFit.cover,
                                  ),                                 
                                    boxShadow: [
                                        BoxShadow(
                                            color: Color(0x3F000000),
                                            blurRadius: 4,
                                            offset: Offset(0, 4),
                                            spreadRadius: 0,
                                        )
                                    ],
                                ),
                            ),
                        ),
                        Positioned(
                            left: 0,
                            top: 174,
                            child: Container(
                                width: 359,
                                height: 85,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.5799999833106995),
                                ),
                            ),
                        ),
                        Positioned(
                            left: 20,
                            top: 204,
                            child: Text(
                                'Welcome Home',
                                style: TextStyle(
                                    color: Theme.of(context).colorScheme.secondary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                ),
                            ),
                        ),
                    ],
                ),
            ),
        ],
    ),
),
            const SizedBox(height: 30,),
             const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Select Room', style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black
                ),),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 GestureDetector(
                  onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> const BedroomPage()));
                  },
                   child: Container(
                    width: 359/2,
                    height: 259/1.5,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image:  AssetImage('assets/bedroom.png'),
                       fit: BoxFit.cover,
                         ), 
                      boxShadow: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                                   ),
                                   ],
                                ), 
                                child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("  Bedroom",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color:  Theme.of(context).colorScheme.secondary,
                  ),)
                ],
              ),                                
               ),
                 ),
              GestureDetector(
                  onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> const BathroomPage()));
                  },
                   child: Container(
                    width: 359/2,
                    height: 259/1.5,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image:  AssetImage('assets/bathroom.png'),
                        fit: BoxFit.cover,
                        ),
                      boxShadow: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                                   ),
                                   ],
                                 ),
                                  child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("  Bathroom",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color:  Theme.of(context).colorScheme.secondary,
                  ),)
                ],
              ),                               
                                 ),
                 ),
              ],
            ),
            const SizedBox(height: 20,),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 GestureDetector(
                  onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> LaundryPage()));
                  },
                   child: Container(
                    width: 359/2,
                    height: 259/1.5,
                    decoration: const BoxDecoration(
                       image: DecorationImage(
                        image:  AssetImage('assets/laundry.png'),
                        fit: BoxFit.cover,),
                      boxShadow: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                                   ),
                                   ],
                                 ),  
                        child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(" Laundry",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color:  Theme.of(context).colorScheme.secondary,
                  ),)
                ],
              ),                                        
                                 ),
                 ), 
                GestureDetector(
                  onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> const StudyPage()));
                  },
                   child: Container(
                    width: 359/2,
                    height: 259/1.5,
                    decoration: const BoxDecoration(
                       image: DecorationImage(
                        image:  AssetImage('assets/study.png'),
                        fit: BoxFit.cover,),
                      boxShadow: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                                   ),
                                   ],
                                 ),
                        child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(" Study",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color:  Theme.of(context).colorScheme.secondary,
                  ),)
                ],
              ),                                
                                 ),
                 ),
              ],
            )
          ],
        ),),
      )
    );
  }
}