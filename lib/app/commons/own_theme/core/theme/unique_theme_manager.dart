import 'package:own_quest_app/app/commons/own_theme/core/theme/own_theme.dart';

abstract class UniqueThemeManager {
  Future<OwnThemeData> getAppTheme();
}
