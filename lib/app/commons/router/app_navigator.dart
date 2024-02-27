import 'package:injectable/injectable.dart';
import 'package:own_quest_app/app/commons/router/router_config.dart';
import 'package:own_quest_app/app/commons/router/routes.dart';

class AppNavigator {
  Future<void> push({required Routes route}) async {}
}

@LazySingleton(as: AppNavigator)
class AppNavigatorImpl implements AppNavigator {
  AppNavigatorImpl(this.navigator);
  final AppRouterConfig navigator;

  @override
  Future<void> push({required Routes route}) async => navigator.pushNamed(route.name);
}
