import 'package:own_quest_app/app/commons/router/page_route.dart';
import 'package:own_quest_app/app/commons/router/routes.dart';
import 'package:own_quest_app/app/packages/login/presentation/login_page.dart';

final routes = [
  PageRoute(
    route: Routes.login,
    builder: (context, state) => LoginPage(),
  ),
];
