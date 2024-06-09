import 'package:flutter/material.dart';
import 'package:light_regulator_app/bluetooth_service.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:permission_handler/permission_handler.dart';

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
    _requestPermissions().then((_) {
      _startScan();
    });
  }

  Future<void> _requestPermissions() async {
    var status = await Permission.bluetoothScan.status;
    if (!status.isGranted) {
      await Permission.bluetoothScan.request();
    }

    status = await Permission.bluetoothConnect.status;
    if (!status.isGranted) {
      await Permission.bluetoothConnect.request();
    }

    status = await Permission.location.status;
    if (!status.isGranted) {
      await Permission.location.request();
    }
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bluetooth Connection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _bluetoothService.isScanning
                ? CircularProgressIndicator()
                : _bluetoothService.isConnected
                    ? Column(
                        children: [
                          Text('Connected to ${_bluetoothService.connectedDevice?.name}'),
                          ElevatedButton(
                            onPressed: _disconnectFromDevice,
                            child: Text('Disconnect'),
                          ),
                        ],
                      )
                    : ElevatedButton(
                        onPressed: _startScan,
                        child: Text('Start Scan'),
                      ),
            if (!_bluetoothService.isScanning && !_bluetoothService.isConnected)
              StreamBuilder<List<ScanResult>>(
                stream: _bluetoothService.scanResults,
                builder: (c, snapshot) {
                  if (snapshot.hasData) {
                    var results = snapshot.data!;
                    return Column(
                      children: results.map((r) => ListTile(
                        title: Text(r.device.name),
                        onTap: () => _connectToDevice(r.device),
                      )).toList(),
                    );
                  } else {
                    return Text('No devices found');
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}
