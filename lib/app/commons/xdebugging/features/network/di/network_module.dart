import 'package:own_quest_app/app/commons/xdebugging/core/data/data_source/shared_preferences_data_source.dart';
import 'package:own_quest_app/app/commons/xdebugging/core/data/repository/shared_preferences_repository.dart';
import 'package:own_quest_app/app/commons/xdebugging/features/network/data/factories/api_responde_factory.dart';

class NetworkModule {
  final String _kApiKey = 'xDebuggingNetwork';

  SharedPreferencesDataSource get dataSource => SharedPreferencesDataSource(
        factory: ApiResponseFactory(),
        preferenceKey: _kApiKey,
      );

  SharedPreferencesRepository get repository => SharedPreferencesRepository(
        dataSource: dataSource,
      );
}
