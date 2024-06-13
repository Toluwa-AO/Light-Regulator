import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BluetoothDevicesPage(),
    );
  }
}

class BluetoothDevicesPage extends StatefulWidget {
  @override
  _BluetoothDevicesPageState createState() => _BluetoothDevicesPageState();
}

class _BluetoothDevicesPageState extends State<BluetoothDevicesPage> {
  final BluetoothService _bluetoothService = BluetoothService();

  @override
  void initState() {
    super.initState();
    _checkPermissionsAndStartScan();
  }

  Future<void> _checkPermissionsAndStartScan() async {
    if (await _checkPermissions()) {
      _bluetoothService.startScan();
    } else {
      print('Permissions not granted');
    }
  }

  Future<bool> _checkPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.bluetooth,
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      Permission.location,
    ].request();

    bool allGranted = statuses.values.every((status) => status.isGranted);
    return allGranted;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bluetooth Devices'),
      ),
      body: StreamBuilder<List<ScanResult>>(
        stream: _bluetoothService.scanResults,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          List<ScanResult>? devices = snapshot.data;
          return ListView.builder(
            itemCount: devices?.length ?? 0,
            itemBuilder: (context, index) {
              BluetoothDevice device = devices![index].device;
              return ListTile(
                title: Text(device.name.isNotEmpty ? device.name : 'Unknown device'),
                subtitle: Text(device.id.toString()),
                onTap: () {
                  _bluetoothService.connectToDevice(device);
                },
              );
            },
          );
        },
      ),
    );
  }
}

class BluetoothService {
  BluetoothDevice? _connectedDevice;

  Stream<List<ScanResult>> get scanResults => FlutterBluePlus.scanResults;

  Future<void> startScan() async {
    try {
      await FlutterBluePlus.startScan(timeout: Duration(seconds: 30));
      print('Scanning started');
    } catch (e) {
      print('Failed to start scan: $e');
    }
  }

  Future<void> connectToDevice(BluetoothDevice device) async {
    try {
      await device.connect();
      _connectedDevice = device;
      print('Connected to device: ${device.name}');
    } catch (e) {
      print('Failed to connect to device: $e');
    }
  }

  void disconnectDevice() {
    if (_connectedDevice != null) {
      _connectedDevice!.disconnect();
      _connectedDevice = null;
      print('Disconnected from device');
    }
  }
}


