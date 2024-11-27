import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudex_task/config/theme.dart';
import 'package:fudex_task/config/widgets/inputs/custom_text_filed.dart';
import 'package:fudex_task/config/widgets/inputs/default_button.dart';
import 'package:fudex_task/config/widgets/pickers/pick_category.dart';
import 'package:fudex_task/features/create_product/presentation/pages/create_product_screen.dart';
import 'package:fudex_task/features/home/presentation/manager/home_cubit.dart';
import 'package:fudex_task/helpers/extentions/context.dart';
import 'package:fudex_task/helpers/extentions/string.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: AppColors.whiteColor,
          title: Text(
            'product_list'.tr(context),
            style: context.textTheme.bodyLarge,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (previous, current) => false,
                builder: (context, state) {
                  final cubit = BlocProvider.of<HomeCubit>(context);
                  return CustomSearchTextFiled(
                    controller: cubit.searchController,
                    onClear: () {
                      cubit.searchController.clear();
                    },
                    onChanged: cubit.searchInList,
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (previous, current) => current is HomePickCategory,
                builder: (context, state) {
                  final cubit = BlocProvider.of<HomeCubit>(context);
                  return PickMainCategory(
                    onChanged: cubit.changeCategory,
                    init: cubit.selectedCategory,
                  );
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 84,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 20,
          ),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 7,
                offset: const Offset(0, 0),
                color: AppColors.blackColor.withOpacity(.25),
              ),
            ],
          ),
          child: DefaultButton(
            text: 'add_product'.tr(context),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateProductScreen(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
