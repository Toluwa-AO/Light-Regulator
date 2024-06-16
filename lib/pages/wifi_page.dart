import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WiFiConnectPage(),
    );
  }
}

class WiFiConnectPage extends StatefulWidget {
  @override
  _WiFiConnectPageState createState() => _WiFiConnectPageState();
}

class _WiFiConnectPageState extends State<WiFiConnectPage> {
  final TextEditingController _ipController = TextEditingController();
  String _response = '';

  Future<void> _connectToESP32() async {
    final String ip = _ipController.text;
    final Uri url = Uri.http(ip, '/');
    try {
      final response = await http.get(url);
      setState(() {
        _response = response.body;
      });
    } catch (e) {
      setState(() {
        _response = 'Failed to connect: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connect to ESP32'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _ipController,
                decoration: InputDecoration(
                  labelText: 'ESP32 IP Address',
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _connectToESP32,
                child: Text('Connect'),
              ),
              SizedBox(height: 20),
              Text(_response),
            ],
          ),
        ),
      ),
    );
  }
}
