import 'package:own_quest_app/app/commons/xdebugging/core/data/models/debugging_model.dart';

abstract class DebuggingModelFactory {
  DebuggingModel createFromJson(Map<String, dynamic> json);
}