import 'package:querium/src/Features/HomeFeature/Bloc/Repo/subjects_repo.dart';
import 'package:querium/src/Features/HomeFeature/Bloc/model/academic_year_model.dart';
import 'package:querium/src/Features/HomeFeature/Bloc/model/subjects_model.dart';
import 'package:querium/src/core/services/Base/base_controller.dart';
import 'package:querium/src/core/services/Network/network_exceptions.dart';
import 'package:querium/src/core/services/services_locator.dart';

class SubjectsController extends BaseController<SubjectsRepository> {
  @override
  // TODO: implement repository
  get repository => sl<SubjectsRepository>();
  @override
  void onInit() async {
    // TODO: implement onInit
    await getSubjects(tapIdSelected);
    super.onInit();
  }

  final List<Subjects> _subjects = [];

  List<Subjects> get subjects => _subjects;

  Future<void> getSubjects(int academicYear) async {
    _subjects.clear();
    reInitPagination();
    showLoading();

    update();

    var result = await repository!.getAllSubjects(
      academicYear: tapIdSelected,
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
    getSubjects(id);
    update();
  }

  List<AcademicYearModel> academicYearCards = [
    const AcademicYearModel(id: 1, label: 'First_Year'),
    const AcademicYearModel(id: 2, label: 'Second_Year'),
    const AcademicYearModel(id: 3, label: 'Third_Year'),
    const AcademicYearModel(id: 4, label: 'Fourth_Year'),
  ];
}
