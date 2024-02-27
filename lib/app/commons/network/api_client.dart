import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class ApiClient {
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  Future<Response> post(
    String path,
    dynamic data, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  Future<Response> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
}

@Injectable(as: ApiClient)
class ApiClientImpl implements ApiClient {
  final Dio _networkInstance;

  ApiClientImpl(this._networkInstance);

  @override
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _networkInstance.get(
      path,
      queryParameters: queryParameters,
      options: options,
    );
  }

  @override
  Future<Response> post(
    String path,
    dynamic data, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _networkInstance.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  @override
  Future<Response> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _networkInstance.delete(
      path,
      queryParameters: queryParameters,
      options: options,
    );
  }
}
