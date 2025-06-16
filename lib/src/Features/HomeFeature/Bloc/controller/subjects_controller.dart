import 'dart:async';

import 'package:flutter/material.dart';
import 'package:querium/src/Features/HomeFeature/Bloc/Repo/subjects_repo.dart';
import 'package:querium/src/Features/HomeFeature/Bloc/model/academic_year_model.dart';
import 'package:querium/src/Features/HomeFeature/Bloc/model/subjects_model.dart';
import 'package:querium/src/core/services/Base/base_controller.dart';
import 'package:querium/src/core/services/Network/network_exceptions.dart';
import 'package:querium/src/core/services/services_locator.dart';

class SubjectsController extends BaseController<SubjectsRepository> {
  // Constants
  static const _debounceDuration = Duration(milliseconds: 500);

  // Controllers
  final TextEditingController searchController = TextEditingController();

  // State variables
  final List<Subjects> _subjects = [];
  int tapIdSelected = 1;
  Timer? _debounce;

  // Academic years data
  final List<AcademicYearModel> academicYearCards = const [
    AcademicYearModel(id: 1, label: 'First_Year'),
    AcademicYearModel(id: 2, label: 'Second_Year'),
    AcademicYearModel(id: 3, label: 'Third_Year'),
    AcademicYearModel(id: 4, label: 'Fourth_Year'),
  ];

  @override
  SubjectsRepository get repository => sl<SubjectsRepository>();

  @override
  void onInit() async {
    await getSubjects();
    super.onInit();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    super.dispose();
  }

  // Public getters
  List<Subjects> get subjects => _subjects;

  List<Subjects> get filteredSubjects {
    final searchText = searchController.text.toLowerCase();
    return searchText.isEmpty
        ? _subjects
        : _subjects
            .where(
                (subject) => subject.title.toLowerCase().contains(searchText))
            .toList();
  }

  // Actions
  Future<void> getSubjects() async {
    debugPrint(
        'Fetching subjects with year: $tapIdSelected, search: ${searchController.text}');

    _subjects.clear();
    reInitPagination();
    showLoading();
    update();

    final result = await repository!.getAllSubjects(
      academicYear: tapIdSelected,
      search: searchController.text,
    );

    result.when(
      success: (List<Subjects> subjects) {
        incrementPageNumber(subjects.isNotEmpty);
        _subjects.addAll(subjects);
        doneLoading();
        update();
      },
      failure: (NetworkExceptions error) {
        errorLoading();
        status = actionNetworkExceptions(error);
        update();
      },
    );
  }

  void selectTapId(int id) {
    if (tapIdSelected == id) return;

    tapIdSelected = id;
    getSubjects();
    update();
  }

  void debounceSearch() {
    _debounce?.cancel();
    _debounce = Timer(_debounceDuration, getSubjects);
  }
}
