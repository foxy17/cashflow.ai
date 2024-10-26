import 'package:flutter/material.dart';
import 'app_theme_data.dart';
import 'app_colors.dart';
import 'app_text_theme.dart';
import '../../core/theme/theme_factory.dart';

class AppTheme extends ChangeNotifier {
  final AppThemeDataFactory themeFactory;
  final AppColors lightColors;
  final AppColors darkColors;
  final AppTextTheme textTheme;
  ThemeMode _mode;

  AppTheme._({
    required this.themeFactory,
    required this.lightColors,
    required this.darkColors,
    required this.textTheme,
    required ThemeMode mode,
  }) : _mode = mode;

  static AppTheme uniform({
    required AppThemeDataFactory themeFactory,
    required AppColors lightColors,
    required AppColors darkColors,
    required AppTextTheme textTheme,
    required ThemeMode defaultMode,
  }) {
    return AppTheme._(
      themeFactory: themeFactory,
      lightColors: lightColors,
      darkColors: darkColors,
      textTheme: textTheme,
      mode: defaultMode,
    );
  }

  ThemeMode get mode => _mode;
  
  void toggle() {
    _mode = _mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  AppThemeData get current => 
    _mode == ThemeMode.light ? light : dark;

  AppThemeData get light => themeFactory.build(
    colors: lightColors,
    textTheme: textTheme,
  );

  AppThemeData get dark => themeFactory.build(
    colors: darkColors,
    textTheme: textTheme,
  );
}

class ThemeProvider extends InheritedNotifier<AppTheme> {
  const ThemeProvider({
    super.key,
    required AppTheme notifier,
    required super.child,
  }) : super(notifier: notifier);

  static AppTheme of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeProvider>()!.notifier!;
  }
}
