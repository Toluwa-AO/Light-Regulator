import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:light_regulator_app/pages/bluetooth_page.dart';

import 'package:light_regulator_app/services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

    void logout (){
    //get auth service
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         Column(children: [ 
          DrawerHeader(
            child: Center(
            child: Icon(
              Icons.lightbulb_circle_outlined, 
              color: Theme.of(context).colorScheme.primary,
              size: 30,
              ))),
          Padding(
            padding: const EdgeInsets.only(left:25),
            child: ListTile(
              title:const Text("H O M E"),
              leading: Icon(Icons.home_max_outlined,  color: Theme.of(context).colorScheme.primary),
              onTap: (){
                //pop the drawer
                Navigator.pop(context);
              },
            ),
          ),
            Padding(
            padding: const EdgeInsets.only(left:25),
            child: ListTile(
              title: const Text("C O N N E C T"),
              leading: Icon(Icons.bluetooth, color: Theme.of(context).colorScheme.primary,),
              onTap: (){
                //pop the drawer
                Navigator.pop(context);

                //navigate to settings page
                Navigator.push(context, MaterialPageRoute(builder: (context)=> BluetoothDevicesPage()));
              },
            ),
          ),],),
          // Padding(
          //padding: const EdgeInsets.only(left:25, bottom: 25),
           // child: ListTile(
             // title:const Text("L O G O U T"),
              //leading: Icon(Icons.logout_sharp,  color: Theme.of(context).colorScheme.primary),
              //onTap: logout,
            //),
         // )
        ],
      ),
    );
  }
}