// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:own_quest_app/app/commons/network/network_provider.dart' as _i5;
import 'package:own_quest_app/app/commons/router/app_navigator.dart' as _i3;
import 'package:own_quest_app/app/commons/router/router_config.dart' as _i4;

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
    gh.lazySingleton<_i3.AppNavigator>(
        () => _i3.AppNavigatorImpl(gh<_i4.AppRouterConfig>()));
    gh.factory<_i5.NetworkProvider>(() => _i5.NetworkProviderImlp());
    return this;
  }
}
