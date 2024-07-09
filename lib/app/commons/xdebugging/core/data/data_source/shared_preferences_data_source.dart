import 'dart:convert';

import 'package:own_quest_app/app/commons/xdebugging/core/data/factory/debugging_model_factory.dart';
import 'package:own_quest_app/app/commons/xdebugging/core/data/models/debugging_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDataSource {
  SharedPreferencesDataSource({
    required this.factory,
    required this.preferenceKey,
    this.maxRegistersNumber = 100,
  });

  final DebuggingModelFactory factory;
  final String preferenceKey;
  final int maxRegistersNumber;

  Future<void> saveData(DebuggingModel model) async {
    try {
      final newData = List<DebuggingModel>.empty(growable: true);
      final storedData = await findAll();

      if (storedData.length >= maxRegistersNumber) {
        storedData.removeLast();
      }

      newData..addAll(storedData)..add(model);

      final preferences = await SharedPreferences.getInstance();
      await preferences.setString(preferenceKey, jsonEncode(newData));
    } catch (_) {}
  }

  Future<List<DebuggingModel>> findAll() async {
    try {
      final preferences = await SharedPreferences.getInstance();
      final allData = List<DebuggingModel>.empty(growable: true);
      final storedData = preferences.getString(preferenceKey);

      if(storedData == null) {
        return [];
      }

      final decodedData = jsonDecode(storedData) as List<dynamic>;
      for (final json in decodedData) {
        allData.add(factory.createFromJson(json as Map<String, dynamic>));
      }
      allData.sort((a, b) => b.compareTo(a));
      return allData;
    } catch (_) {
      return List<DebuggingModel>.empty(growable: true);
    }
  }
}
