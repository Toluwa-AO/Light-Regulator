import 'package:http/http.dart' as http;
import 'dart:convert';

class ModeService {
  final String esp32IP = "192.168.137.253"; // Replace with your ESP32 IP address
  Map<String, String> currentModes = {
    "bedroom": "off",
    "living_room": "off",
    "kitchen": "off",
    "bathroom": "off"
  };

  Future<void> setMode(String room, String mode) async {
    final url = Uri.parse('http://$esp32IP/post');
    try {
      final response = await http.post(url, body: json.encode({
        "mode": mode,
        "room": room,
        "room_state": mode == "off" ? "off" : "on"
      }), headers: {
        "Content-Type": "application/json"
      });
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        currentModes[room] = mode;
        print("Mode set successfully: $data");
      } else {
        print('Failed to set mode: ${response.statusCode} ${response.reasonPhrase}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error setting mode: $e');
    }
  }

  Future<void> getMode(String room) async {
    final url = Uri.parse('http://$esp32IP/getMode?room=$room');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        currentModes[room] = data['mode'];
        print("Current mode: $data");
      } else {
        print('Failed to get mode: ${response.statusCode} ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error getting mode: $e');
    }
  }

  String getCurrentMode(String room) {
    return currentModes[room] ?? "off";
  }
}
