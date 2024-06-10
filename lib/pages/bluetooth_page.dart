import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:light_regulator_app/bluetooth_service.dart';


class BluetoothPage extends StatefulWidget {
  @override
  _BluetoothPageState createState() => _BluetoothPageState();
}

class _BluetoothPageState extends State<BluetoothPage> {
  final BluetoothServices _bluetoothServices = BluetoothServices();
  List<BluetoothDevice> _devicesList = [];

  @override
  void initState() {
    super.initState();
    _startScan();
  }

  void _startScan() {
    _bluetoothServices.startScan((device) {
      setState(() {
        if (!_devicesList.contains(device)) {
          _devicesList.add(device);
        }
      });
    });
  }

  void _connectToDevice(BluetoothDevice device) async {
    await _bluetoothServices.connectToDevice(device);
    setState(() {
      _devicesList.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bluetooth Devices'),
      ),
      body: _buildDeviceList(),
    );
  }

  Widget _buildDeviceList() {
    return ListView.builder(
      itemCount: _devicesList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_devicesList[index].name),
          subtitle: Text(_devicesList[index].id.toString()),
          onTap: () => _connectToDevice(_devicesList[index]),
        );
      },
    );
  }
}
