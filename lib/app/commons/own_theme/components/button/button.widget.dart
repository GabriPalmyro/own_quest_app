import 'package:flutter/material.dart';
import 'package:own_quest_app/app/commons/own_theme/components/button/button.variant.dart';
import 'package:own_quest_app/app/commons/own_theme/components/text/text.widget.dart';
import 'package:own_quest_app/app/commons/own_theme/core/theme/own_theme.dart';

class OwnButton extends StatelessWidget {
  const OwnButton({required this.label, required this.type, required this.size, this.onPressed, this.icon, super.key});

  final String label;
  final OwnButtonType type;
  final OwnButtonSize size;
  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final tokens = OwnTheme.getDesignTokensOf(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          type == OwnButtonType.primary
              ? tokens.colors.secondary
              : type == OwnButtonType.secondary
                  ? tokens.colors.brightSecondary
                  : Colors.transparent,
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(
            vertical: size == OwnButtonSize.sm
                ? tokens.spacing.inline.xxs
                : size == OwnButtonSize.md
                    ? tokens.spacing.inline.sm
                    : tokens.spacing.inline.md,
            horizontal: size == OwnButtonSize.sm
                ? tokens.spacing.inline.sm
                : size == OwnButtonSize.md
                    ? tokens.spacing.inline.md
                    : tokens.spacing.inline.lg,
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...{
            Icon(icon),
          },
          OwnText(text: label),
        ],
      ),
    );
  }
}
