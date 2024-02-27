// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:own_quest_app/app/commons/network/api_client.dart' as _i3;
import 'package:own_quest_app/app/commons/network/network_provider.dart' as _i7;
import 'package:own_quest_app/app/commons/router/app_navigator.dart' as _i5;
import 'package:own_quest_app/app/commons/router/router_config.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt $initAppGetIt({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.ApiClient>(() => _i3.ApiClientImpl(gh<_i4.Dio>()));
    gh.lazySingleton<_i5.AppNavigator>(
        () => _i5.AppNavigatorImpl(gh<_i6.AppRouterConfig>()));
    gh.factory<_i7.NetworkProvider>(() => _i7.NetworkProviderImlp());
    return this;
  }
}
