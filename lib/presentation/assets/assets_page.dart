import 'package:flutter/material.dart' hide MenuController;
import 'package:get/get.dart';
import 'package:tractian/design_system/design_system.dart';

import 'assets_controller.dart';
import 'widgets/node_tree_widget.dart';

class AssetsPage extends GetView<AssetsController> {
  const AssetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primary,
        title: Text(
          'menu_asset'.tr,
          style: AppTextStyle.title(
            context,
            fontSize: 18,
            color: AppColors.white,
          ),
        ),
        leading: GestureDetector(
          onTap: controller.backPage,
          child: SizedBox(
            width: 18,
            height: 18,
            child: Center(
              child: AppIcon(
                AppIcons.back,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
      body: Obx(() {
        return Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: TextFieldWidget(
                    key: const Key('search_assets_field'),
                    hintText: 'search'.tr,
                    enabled: controller.isLoading.isFalse,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                        top: 9,
                        left: 16,
                        right: 9,
                        bottom: 9,
                      ),
                      child: AppIcon(
                        AppIcons.search,
                        width: 20,
                        height: 20,
                        color: AppColors.neutralDark,
                      ),
                    ),
                    onSearch: controller.onSearch,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: SizedBox(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        const SizedBox(width: 16),
                        IgnorePointer(
                          ignoring: controller.isLoading.isTrue,
                          child: ToggleButton(
                            text: 'energy_sensor'.tr,
                            icon: AppIcons.bolt,
                            onPressed: controller.filterOnlyEnergySensor,
                          ),
                        ),
                        const SizedBox(width: 8),
                        IgnorePointer(
                          ignoring: controller.isLoading.isTrue,
                          child: ToggleButton(
                            text: 'alert_type'.tr,
                            icon: AppIcons.info,
                            onPressed: controller.filterOnlyAlertStatus,
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: AppColors.divider,
              height: 16,
            ),
            if (controller.isLoading.value)
              const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            if (controller.errorMessage.isNotEmpty)
              Expanded(
                child: Center(
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
                ),
              ),
            if (controller.isLoading.isFalse && controller.list.isEmpty)
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'empty_list'.tr,
                      ),
                    ],
                  ),
                ),
              ),
            if (controller.list.isNotEmpty)
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Scrollbar(
                      thumbVisibility: true,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width +
                            controller.additionalWidth * 10,
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                          key: const Key('assets_key'),
                          itemCount: controller.list.length,
                          itemBuilder: (BuildContext context, int index) {
                            var asset = controller.list[index];
                            return Container(
                              padding: EdgeInsets.only(
                                bottom: index == controller.list.length - 1
                                    ? Get.height * .1
                                    : 0,
                              ),
                              child: NodeTreeWidget(
                                asset: asset,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        );
      }),
    );
  }
}
