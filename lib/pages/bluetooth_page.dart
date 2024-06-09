import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:light_regulator_app/bluetooth_service.dart';


class BluetoothPage extends StatefulWidget {
  const BluetoothPage({Key? key}) : super(key: key);

  @override
  _BluetoothPageState createState() => _BluetoothPageState();
}

class _BluetoothPageState extends State<BluetoothPage> {
  final BluetoothServices _bluetoothService = BluetoothServices();

  @override
  void initState() {
    super.initState();
    _startScan();
  }

  void _startScan() {
    setState(() {
      _bluetoothService.isScanning = true;
    });

    _bluetoothService.startScan((device) {
      _connectToDevice(device);
    }).then((_) {
      setState(() {
        _bluetoothService.isScanning = false;
      });
    });
  }

  void _connectToDevice(BluetoothDevice device) async {
    await _bluetoothService.connectToDevice(device);
    setState(() {});
  }

  void _disconnectFromDevice() async {
    await _bluetoothService.disconnectFromDevice();
    setState(() {});
  }

  @override
  void dispose() {
    _bluetoothService.stopScan();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: _bluetoothService.isScanning
            ? CircularProgressIndicator()
            : _bluetoothService.isConnected
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Connected to ${_bluetoothService.connectedDevice!.name}'),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _disconnectFromDevice,
                        child: Text('Disconnect'),
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('No device connected'),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _startScan,
                        child: Text('Scan for Devices'),
                      ),
                    ],
                  ),
      );
  }
}

void main() {
  runApp(MaterialApp(
    home: BluetoothPage(),
  ));
}


