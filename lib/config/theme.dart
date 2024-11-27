import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fudex_task/helpers/extentions/context.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static Color primary = const Color(0xFF28A6FD);
  static Color darkBlue = const Color(0xFF1C5CF2);
  static Color secondColor = const Color(0xFFBEE7E8);

  static Color searchBorderColor = const Color(0xFFDBDBDB);

  static Color whiteColor = Colors.white;
  static Color blackColor = Colors.black;
}

ThemeData buildTheme(BuildContext context) {
  return ThemeData(
    fontFamily: GoogleFonts.cairo().fontFamily,
    textTheme: GoogleFonts.cairoTextTheme(
      Theme.of(context).textTheme.copyWith(
            bodyLarge: TextStyle(
              color: AppColors.blackColor,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
            bodyMedium: TextStyle(
              color: AppColors.blackColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            bodySmall: TextStyle(
              color: AppColors.blackColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      splashColor: AppColors.primary,
    ),
    scaffoldBackgroundColor: AppColors.whiteColor,
    primaryColor: AppColors.primary,
    unselectedWidgetColor: AppColors.whiteColor,
    // toggleableActiveColor: AppColors.primary,
    snackBarTheme: SnackBarThemeData(
      contentTextStyle: GoogleFonts.cairo(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      // color: AppColors.whiteColor,
      elevation: 0,
      titleTextStyle: context.textTheme.bodyLarge!.copyWith(
        color: AppColors.blackColor,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.blackColor, size: 30),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    dividerColor: Colors.transparent,
    indicatorColor: AppColors.primary,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.primary,
    ),
    listTileTheme: const ListTileThemeData(
      contentPadding: EdgeInsets.zero,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(elevation: 0),
  );
}
