import 'package:flutter/material.dart';
import 'package:own_quest_app/app/commons/own_theme/core/tokens/support/illustrations/illustration_data.dart';

class Illustration extends StatelessWidget {
  const Illustration(
    this.illustration, {
    this.fit,
    this.alignment = Alignment.center,
    this.colorBlendMode = BlendMode.srcIn,
    this.repeat = ImageRepeat.noRepeat,
    super.key,
    this.size,
    this.color,
  });

  final IllustrationAssetData illustration;
  final Size? size;
  final BoxFit? fit;
  final AlignmentGeometry alignment;
  final BlendMode colorBlendMode;
  final Color? color;
  final ImageRepeat repeat;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      illustration.path(),
      width: size?.width,
      height: size?.height,
      fit: fit,
      alignment: alignment,
      colorBlendMode: colorBlendMode,
      color: color,
      repeat: repeat,
    );
  }
}
