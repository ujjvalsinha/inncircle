import 'dart:async';

Map<String, dynamic> data = {
  "state": "Maharashtra",
  "city": ["Mumbai", "Nashik", "Pune"]
};

class StateRepository {
  Future<Map<String, dynamic>> getDataFromServer() async {
    await Future.delayed(const Duration(seconds: 1));
    return data;
  }
}
