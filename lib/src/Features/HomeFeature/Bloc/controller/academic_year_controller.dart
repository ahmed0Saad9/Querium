import 'package:get/get.dart';
import 'package:querium/src/Features/HomeFeature/Bloc/model/academic_year_model.dart';

class AcademicYearController extends GetxController {
  int tapIdSelected = 1;

  void selectTapId(int id) {
    tapIdSelected = id;
    update();
  }

  List<AcademicYearModel> academicYearCards = [
    const AcademicYearModel(id: 1, label: 'First_Year'),
    const AcademicYearModel(id: 2, label: 'Second_Year'),
    const AcademicYearModel(id: 3, label: 'Third_Year'),
    const AcademicYearModel(id: 4, label: 'Fourth_Year'),
  ];
}
