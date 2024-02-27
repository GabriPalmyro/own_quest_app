import 'package:flutter/widgets.dart';
import 'package:own_quest_app/app/commons/own_theme/core/theme/own_theme.dart';
import 'package:own_quest_app/app/commons/own_theme/core/theme/unique_theme_manager.dart';

class UniqueThemeBuilder extends StatelessWidget {
  const UniqueThemeBuilder({super.key, required this.uniqueThemeManager, required this.child});
  final UniqueThemeManager uniqueThemeManager;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<OwnThemeData>(
      future: uniqueThemeManager.getAppTheme(),
      builder: (context, theme) => OwnTheme(
        data: theme.data!,
        child: child,
      ),
    );
  }
}
