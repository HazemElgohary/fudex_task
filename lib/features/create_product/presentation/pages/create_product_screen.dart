import 'package:flutter/material.dart';
import 'package:fudex_task/features/create_product/presentation/widgets/product_image/images_widget.dart';
import 'package:fudex_task/helpers/extentions/context.dart';
import 'package:fudex_task/helpers/extentions/string.dart';

class CreateProductScreen extends StatelessWidget {
  const CreateProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          'create_product'.tr(context),
          style: context.textTheme.bodyLarge,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              Icons.arrow_forward,
              size: 30,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ImageWidget(),
          ],
        ),
      ),
    );
  }
}
