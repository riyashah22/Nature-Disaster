import 'package:flutter/material.dart';
import 'package:resqaid/theme/appColors.dart';

extension ThemeExt on BuildContext {
  AppColors get appColors =>
      Theme.of(this).extension<AppColors>() ?? LightColor();
}
