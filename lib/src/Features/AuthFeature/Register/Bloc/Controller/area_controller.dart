import 'package:flutter/material.dart';
import 'package:querium/src/Features/AuthFeature/Register/Bloc/Model/area_model.dart';
import 'package:querium/src/Features/AuthFeature/Register/Bloc/Repo/area_repo.dart';
import 'package:querium/src/core/services/Base/base_controller.dart';
import 'package:querium/src/core/services/Network/network_exceptions.dart';
import 'package:querium/src/core/services/services_locator.dart';

class AreaController extends BaseController<AreaRepository> {
  final int cityId;

  AreaController({required this.cityId});

  @override
  // TODO: implement repository
  get repository => sl<AreaRepository>();

  @override
  void onInit() {
    // TODO: implement onInit
    getAreas();
    super.onInit();
  }

  TextEditingController searchController = TextEditingController();

  final List<AreaModel> _areas = [];

  List<AreaModel> get areas => _areas;

  Future<void> getAreas() async {
    _areas.clear();
    reInitPagination();
    showLoading();
    update();

    var result = await repository!.getArea(
      pageNum: page,
      cityId: cityId,
    );

    result.when(success: (List<AreaModel> area) {
      incrementPageNumber(area.isNotEmpty);
      _areas.addAll(area);
      doneLoading();
      update();
    }, failure: (NetworkExceptions error) {
      errorLoading();
      status = actionNetworkExceptions(error);
      update();
    });
  }
}
