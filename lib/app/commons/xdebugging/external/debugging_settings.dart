import 'package:dio/dio.dart';
import 'package:own_quest_app/app/commons/xdebugging/features/network/domain/interceptors/xdebugging_interceptor.dart';

class DebuggingSettings {
  DebuggingSettings._();

  static final DebuggingSettings instance = DebuggingSettings._();

  static DebuggingSettings get getInstance => instance;

  Interceptor get interceptor => XDebuggingInterceptor();
}
