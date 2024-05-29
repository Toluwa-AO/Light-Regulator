import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class Bluetooth extends StatefulWidget {
  const Bluetooth({super.key});

  @override
  State<Bluetooth> createState() => _BluetoothState();
}

class _BluetoothState extends State<Bluetooth> {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  late BluetoothDevice connectedDevice;
  bool isScanning = false;

  @override
  void initState(){
    super.initState();
    setState(() {
      isScanning = true;
    });
    flutterBlue.scanResults.listen((results){
      for(ScanResult result in results){
        print("Found device: ${result.device.name}");
        if(result.device.name == ''){
          connectToDevicce(result.device);
          break;
        }
      }
    });
    flutterBlue.startScan();
  }
  void connectToDevicce(BluetoothDevice device)async{
    try{
      await device.connect();
      setState(() {
        connectedDevice = device;
        isScanning = false;
      });
      print('Connected to ${device.name}');
    }catch(e){
      print('Failed to connect to ${device.name}: $e');
    }
  }
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}