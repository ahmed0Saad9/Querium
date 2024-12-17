import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:querium/src/Features/AuthFeature/Register/Bloc/Controller/area_controller.dart';
import 'package:querium/src/Features/AuthFeature/Register/Bloc/Model/area_model.dart';
import 'package:querium/src/GeneralWidget/Widgets/BottomSheets/base_bottom_sheet.dart';
import 'package:querium/src/GeneralWidget/Widgets/Choses/single_chose_row_form.dart';
import 'package:querium/src/GeneralWidget/Widgets/Loading/loading_dialog.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/base_remote_widget.dart';
import 'package:querium/src/core/constants/app_assets.dart';

class BottomSheetArea extends StatelessWidget {
  final int areaIdSelected;
  final int cityId;
  final Function(AreaModel) onTap;

  const BottomSheetArea(
      {super.key,
      required this.areaIdSelected,
      required this.onTap,
      required this.cityId});

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      title: "area".tr,
      height: Get.height * .6,
      widget: Column(
        children: [
          GetBuilder<AreaController>(
            init: AreaController(cityId: cityId),
            builder: (_) => BaseRemoteWidget(
              requestStatus: _.status,
              doneWidget: _ListOfAreas(
                controller: _,
                onTap: onTap,
                areaIdSelected: areaIdSelected,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ListOfAreas extends StatelessWidget {
  const _ListOfAreas({
    super.key,
    required this.onTap,
    required this.areaIdSelected,
    required this.controller,
  });

  final Function(AreaModel p1) onTap;
  final int areaIdSelected;
  final AreaController controller;

  @override
  Widget build(BuildContext context) {
    printDM('areaIdSelected is ${areaIdSelected}');
    return Expanded(
      child: LazyLoadScrollView(
        onEndOfPage: () {
          if (!controller.paginationLoading) {
            controller.getAreas();
          }
        },
        child: RefreshIndicator(
          onRefresh: () async {},
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    if (index < controller.areas.length) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: SingleChoseRowForm(
                          onTap: () {
                            onTap(controller.areas[index]);
                            Get.back();
                          },
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          title: controller.areas[index].name,
                          isSelected:
                              controller.areas[index].id == areaIdSelected,
                          // image: controller.countries[index].flag,
                        ),
                      );
                    } else {
                      return const PaginationLoader();
                    }
                  },
                  childCount: controller.areas.length +
                      (controller.paginationLoading ? 1 : 0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
