import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:own_quest_app/app/commons/network/interceptors/network_interceptors.dart';

abstract class NetworkProvider {
  Future<Dio> getNetworkInstanceForUrl({
    required String url,
  });
}

@Injectable(as: NetworkProvider)
class NetworkProviderImlp implements NetworkProvider {

  final List<Interceptor> _networkInterceptors= NetworkInterceptorsImpl().interceptors();

  @override
  Future<Dio> getNetworkInstanceForUrl({
    required String url,
  }) async {
    final Dio newInstance = _provideDio(url);
    return newInstance;
  }

  Dio _provideDio(String url) {
    final Dio dio = Dio(BaseOptions(baseUrl: url));
    dio.interceptors.addAll(_networkInterceptors);
    return dio;
  }
}
