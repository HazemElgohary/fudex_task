import 'package:flutter/material.dart';
import 'package:fudex_task/config/theme.dart';
import 'package:fudex_task/helpers/extentions/context.dart';
import 'package:fudex_task/helpers/extentions/string.dart';

class CustomSearchTextFiled extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onClear;
  final ValueChanged<String>? onChanged;

  const CustomSearchTextFiled({
    super.key,
    required this.controller,
    required this.onClear,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      maxLines: 1,
      cursorHeight: 25,
      cursorWidth: 2,
      decoration: InputDecoration(
        constraints: const BoxConstraints(
          maxHeight: 36,
          minHeight: 36,
        ),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: AppColors.searchBorderColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: AppColors.searchBorderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: AppColors.searchBorderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: AppColors.searchBorderColor,
          ),
        ),
        hintText: 'search'.tr(context),
        hintStyle: context.textTheme.bodyMedium!.copyWith(
          color: const Color(0XFFCECECE),
        ),
        prefixIcon: const Icon(
          Icons.search_rounded,
          color: Color(0XFF717171),
        ),
        suffixIcon: UnconstrainedBox(
          child: InkWell(
            onTap: onClear,
            child: Container(
              height: 18,
              width: 18,
              decoration: const BoxDecoration(
                color: Color(0XFFCCCCCC),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.clear,
                  size: 15,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
