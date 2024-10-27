import 'package:shared_preferences/shared_preferences.dart';


class RecordManager {
  static Future<void> saveRecord(int numPairs, int time) async {
    final prefs = await SharedPreferences.getInstance();
    int? currentRecord = prefs.getInt('record_$numPairs');
    if (currentRecord == null || time < currentRecord) {
      await prefs.setInt('record_$numPairs', time);
    }
  }
  static Future<int> getRecord(int numPairs) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('record_$numPairs') ?? 0; 
  }

  
}
