import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:own_quest_app/app/commons/database/database.dart';
import 'package:own_quest_app/app/commons/router/page_route.dart';
import 'package:own_quest_app/app/commons/router/router_config.dart';
import 'package:own_quest_app/app/di/injection.config.dart';

@InjectableInit(initializerName: r'$initAppGetIt')
Future<void> configureAppDependencies(
  GetIt getIt,
  List<PageRoute> routes,
) async {
  getIt.$initAppGetIt();

  getIt.registerLazySingleton<AppRouterConfig>(
    () => AppRouterConfig(
      routes: routes,
    ),
  );
}

abstract class DriftAppModule {
  @singleton
  AppDatabase provideAppDatabase() => AppDatabase();
}
