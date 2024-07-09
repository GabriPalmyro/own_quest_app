import 'package:own_quest_app/app/commons/xdebugging/core/data/factory/debugging_model_factory.dart';
import 'package:own_quest_app/app/commons/xdebugging/core/data/models/debugging_model.dart';
import 'package:own_quest_app/app/commons/xdebugging/features/network/data/models/api_response.dart';

class ApiResponseFactory implements DebuggingModelFactory {
  @override
  DebuggingModel createFromJson(Map<String, dynamic> json) {
    return ApiResponse.fromJson(json);
  }
  
}