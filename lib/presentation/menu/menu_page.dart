import 'package:flutter/material.dart' hide MenuController;
import 'package:get/get.dart';
import 'package:tractian/design_system/design_system.dart';

import 'menu_controller.dart';

class MenuPage extends GetView<MenuController> {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primary,
        title: AppIcon(
          AppIcons.tractianLogo,
          color: AppColors.white,
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  controller.errorMessage.value,
                ),
                TextButton(
                  onPressed: controller.tryAgain,
                  child: Text(
                    'try_again'.tr,
                  ),
                ),
              ],
            ),
          );
        }
        if (controller.companies.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'empty_list'.tr,
                ),
              ],
            ),
          );
        }
        return ListView.builder(
          key: const Key('companies_key'),
          itemCount: controller.companies.length,
          itemBuilder: (BuildContext context, int index) {
            var company = controller.companies[index];
            return Padding(
              padding: const EdgeInsets.all(10),
              child: PrimaryButton(
                key: Key('company_key_$index'),
                onPressed: () => controller.selectCompany(company),
                text: company.name,
                textColor: AppColors.white,
                icon: AppIcon(
                  AppIcons.company,
                  color: AppColors.white,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
