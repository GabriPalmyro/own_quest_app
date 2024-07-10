import 'package:flutter/material.dart';
import 'package:own_quest_app/app/commons/own_theme/core/theme/own_theme.dart';

class OwnText extends StatelessWidget {
  const OwnText({
    required this.text,
    super.key,
    this.style,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.maxLines,
  });

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final bool? softWrap;
  final TextOverflow? overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    final tokens = OwnTheme.getDesignTokensOf(context);
    return Text(
      text,
      style: TextStyle(
        fontFamily: tokens.font.family.base,
        fontSize: tokens.font.size.sm,
        color: tokens.colors.white,
        fontWeight: tokens.font.weight.regular,
      ).merge(style),
      textAlign: textAlign,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
