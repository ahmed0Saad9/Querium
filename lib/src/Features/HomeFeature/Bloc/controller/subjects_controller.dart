import 'dart:async';

import 'package:flutter/material.dart';
import 'package:querium/src/Features/HomeFeature/Bloc/Repo/subjects_repo.dart';
import 'package:querium/src/Features/HomeFeature/Bloc/model/academic_year_model.dart';
import 'package:querium/src/Features/HomeFeature/Bloc/model/subjects_model.dart';
import 'package:querium/src/core/services/Base/base_controller.dart';
import 'package:querium/src/core/services/Network/network_exceptions.dart';
import 'package:querium/src/core/services/services_locator.dart';

class SubjectsController extends BaseController<SubjectsRepository> {
  TextEditingController searchController = TextEditingController();
  @override
  // TODO: implement repository
  get repository => sl<SubjectsRepository>();
  @override
  void onInit() async {
    // TODO: implement onInit
    await getSubjects();
    super.onInit();
  }

  final List<Subjects> _subjects = [];

  List<Subjects> get subjects => _subjects;

  Future<void> getSubjects() async {
    debugPrint(
        'Fetching subjects with year: $tapIdSelected, search: ${searchController.text}');
    _subjects.clear();
    reInitPagination();
    showLoading();

    update();

    var result = await repository!.getAllSubjects(
      academicYear: tapIdSelected,
      search: searchController.text,
    );

    result.when(success: (List<Subjects> s) {
      incrementPageNumber(s.isNotEmpty);
      _subjects.addAll(s);
      doneLoading();
      update();
    }, failure: (NetworkExceptions error) {
      errorLoading();
      status = actionNetworkExceptions(error);
      update();
    });
  }

  int tapIdSelected = 1;

  void selectTapId(int id) {
    tapIdSelected = id;
    getSubjects();
    update();
  }

  Timer? _debounce;
  void debounceSearch() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      getSubjects();
    });
  }

  List<Subjects> get filteredSubjects {
    if (searchController.text.isEmpty) return _subjects;
    return _subjects
        .where((subject) => subject.title
            .toLowerCase()
            .contains(searchController.text.toLowerCase()))
        .toList();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  List<AcademicYearModel> academicYearCards = [
    const AcademicYearModel(id: 1, label: 'First_Year'),
    const AcademicYearModel(id: 2, label: 'Second_Year'),
    const AcademicYearModel(id: 3, label: 'Third_Year'),
    const AcademicYearModel(id: 4, label: 'Fourth_Year'),
  ];
}
