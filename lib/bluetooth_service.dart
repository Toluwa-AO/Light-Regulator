import 'package:flutter_blue/flutter_blue.dart';

class BluetoothServices {
  final FlutterBlue flutterBlue = FlutterBlue.instance;
  BluetoothDevice? connectedDevice;
  bool isScanning = false;
  bool isConnected = false;

  Stream<List<ScanResult>> get scanResults => flutterBlue.scanResults;

  Future<void> startScan(Function(BluetoothDevice) onDeviceFound) async {
    isScanning = true;

    flutterBlue.scanResults.listen((results) {
      for (ScanResult result in results) {
        if (result.device.name == 'Small_T') {
          onDeviceFound(result.device);
          break;
        }
      }
    });

    await flutterBlue.startScan(timeout: Duration(seconds: 5));
    isScanning = false;
  }

  Future<void> connectToDevice(BluetoothDevice device) async {
    try {
      await device.connect();
      connectedDevice = device;
      isConnected = true;
      device.state.listen((event) {
        if (event == BluetoothDeviceState.disconnected) {
          connectedDevice = null;
          isConnected = false;
        }
      });
    } catch (e) {
      print('Failed to connect to ${device.name}: $e');
    }
  }

  Future<void> disconnectFromDevice() async {
    if (connectedDevice != null) {
      await connectedDevice!.disconnect();
      connectedDevice = null;
      isConnected = false;
    }
  }

  void stopScan() {
    flutterBlue.stopScan();
  }
}
