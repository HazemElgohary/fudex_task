// ignore_for_file: depend_on_referenced_packages

import 'dart:ui';

import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudex_task/config/theme.dart';
import 'package:fudex_task/features/home/presentation/pages/home_screen.dart';
import 'package:fudex_task/service/offline/database/db.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc_observer.dart';
import 'features/create_product/domain/use_cases/product_use_cases.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  GetIt.instance.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  final db = await DatabaseServices.boot();

  GetIt.instance.registerSingleton(db);
  GetIt.instance.registerSingleton(
    DatabaseServices(),
  );
  GetIt.instance.registerSingleton(ProductUseCases());

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      startLocale: const Locale(
        'ar',
      ),
      saveLocale: true,
      path: 'assets/translations',
      fallbackLocale: const Locale(
        'ar',
      ),
      child: DevicePreview(
        enabled: false,
        builder: (context) => MaterialApp(
          title: 'Fudex Task',
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
            },
          ),
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          builder: DevicePreview.appBuilder,
          theme: buildTheme(context),
          home: const HomeScreen(),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        ),
      ),
    ),
  );
}
