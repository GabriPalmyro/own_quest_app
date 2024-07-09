import 'package:flutter/material.dart';
import 'package:own_quest_app/app/commons/xdebugging/adapters/debug_banner_adapter.dart';
import 'package:own_quest_app/app/commons/xdebugging/presentation/banner/xdebugging_banner.dart';

class ErrorBannerFactory {
  ErrorBannerFactory._();

  static DebugBannerAdapter buildBanner(
    VoidCallback? onTap,
  ) {
    return DebugBanner(onTap: onTap);
  }
}