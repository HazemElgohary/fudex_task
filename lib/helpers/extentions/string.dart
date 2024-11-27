import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

extension StringEX on String {
  String tr(BuildContext context) {
    return context.tr(this);
  }
}
