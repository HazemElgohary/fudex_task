import 'package:flutter/material.dart';
import 'package:fudex_task/config/theme.dart';
import 'package:fudex_task/helpers/extentions/context.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool loading;

  const DefaultButton({
    super.key,
    required this.text,
    required this.onTap,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 42,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Center(
          child: loading
              ? CircularProgressIndicator(
                  color: AppColors.whiteColor,
                )
              : Text(
                  text,
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: AppColors.whiteColor,
                  ),
                ),
        ),
      ),
    );
  }
}
