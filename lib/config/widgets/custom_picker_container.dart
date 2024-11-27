import 'package:flutter/material.dart';
import 'package:fudex_task/config/theme.dart';

class CustomPickerContainer extends StatelessWidget {
  final Widget child;

  const CustomPickerContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      constraints: const BoxConstraints(
        maxHeight: 46,
        minHeight: 46,
      ),
      decoration: BoxDecoration(
        color: const Color(0XFFF9F9F9),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(
          color: AppColors.textFieldBorderColor.withOpacity(0.12),
        ),
      ),
      child: child,
    );
  }
}
