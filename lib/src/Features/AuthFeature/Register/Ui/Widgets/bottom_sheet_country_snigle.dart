import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:querium/src/Features/AuthFeature/Register/Bloc/Controller/get_countery_controller.dart';
import 'package:querium/src/Features/AuthFeature/Register/Bloc/Model/nationality_model.dart';
import 'package:querium/src/GeneralWidget/Widgets/BottomSheets/base_bottom_sheet.dart';
import 'package:querium/src/GeneralWidget/Widgets/Choses/single_chose_row_form.dart';
import 'package:querium/src/GeneralWidget/Widgets/Loading/loading_dialog.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/base_remote_widget.dart';

class BottomSheetCitiesSingle extends StatelessWidget {
  final int? idSelected;
  final Function(CountryModel) onTap;

  const BottomSheetCitiesSingle(
      {Key? key, required this.idSelected, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      title: "المدينة",
      height: Get.height * .6,
      widget: Column(
        children: [
          GetBuilder<GetCitiesController>(
            init: GetCitiesController(idsSelectedLocal: []),
            builder: (_) => BaseRemoteWidget(
              requestStatus: _.status,
              doneWidget: _ListOfCountries(
                controller: _,
                onTap: onTap,
                idSelected: idSelected ?? 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ListOfCountries extends StatelessWidget {
  const _ListOfCountries({
    super.key,
    required this.onTap,
    required this.idSelected,
    required this.controller,
  });

  final Function(CountryModel p1) onTap;
  final int idSelected;
  final GetCitiesController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LazyLoadScrollView(
        onEndOfPage: () {
          if (!controller.paginationLoading) {
            controller.getMoreCities();
          }
        },
        child: RefreshIndicator(
          onRefresh: () async {},
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    if (index < controller.countries.length) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: SingleChoseRowForm(
                          onTap: () {
                            onTap(controller.countries[index]);
                            Get.back();
                          },
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          title: controller.countries[index].title,
                          isSelected:
                              controller.countries[index].id == idSelected,
                          // image: controller.countries[index].flag,
                        ),
                      );
                    } else {
                      return const PaginationLoader();
                    }
                  },
                  childCount: controller.countries.length +
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
