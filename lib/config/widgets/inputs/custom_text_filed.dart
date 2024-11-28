import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

class CustomTextFiled extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final int maxLiens;

  final bool isNumber;

  const CustomTextFiled({
    super.key,
    required this.controller,
    this.hint,
    this.isNumber = false,
    this.maxLiens = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: context.textTheme.bodyMedium!.copyWith(
        color: const Color(0XFF666666),
      ),
      inputFormatters: isNumber
          ? [
              FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
            ]
          : null,
      maxLines: maxLiens,
      keyboardType:
          isNumber ? const TextInputType.numberWithOptions(decimal: true) : TextInputType.text,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0XFFF9F9F9),
        constraints: BoxConstraints(
          maxHeight: maxLiens > 1 ? 200 : 46,
          minHeight: 46,
        ),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: AppColors.textFieldBorderColor.withOpacity(0.12),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: AppColors.textFieldBorderColor.withOpacity(0.12),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: AppColors.textFieldBorderColor.withOpacity(0.12),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: AppColors.textFieldBorderColor.withOpacity(0.12),
          ),
        ),
        hintText: hint,
        hintStyle: context.textTheme.bodyMedium!.copyWith(
          color: const Color(0XFFCECECE),
        ),
      ),
    );
  }
}
