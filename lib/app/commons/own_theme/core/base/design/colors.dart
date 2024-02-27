import 'dart:ui';

import 'package:own_quest_app/app/commons/own_theme/core/tokens/design/colors.dart';

class BaseOwnThemeColor implements OwnThemeColor {
  BaseOwnThemeColor({
    Color? primary,
    Color? secondary,
    Color? white,
    Color? grey,
    Color? error,
    Color? brightSecondary,
  }) {
    this.primary = primary ?? this.primary;
    this.secondary = secondary ?? this.secondary;
    this.white = white ?? this.white;
    this.grey = grey ?? this.grey;
    this.error = error ?? this.error;
    this.brightSecondary = brightSecondary ?? this.brightSecondary;
  }

  @override
  Color error = const Color(0xFFE03140);

  @override
  Color white = const Color(0xFFFFFFFF);

  @override
  Color grey = const Color(0xFF202331);

  @override
  Color primary = const Color(0xFF282C3E);

  @override
  Color secondary = const Color(0xFF568EA3);

  @override
  Color brightSecondary = const Color(0xFF6BF0DF);
}
