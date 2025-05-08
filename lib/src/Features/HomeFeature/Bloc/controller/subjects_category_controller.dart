import 'package:get/get.dart';
import 'package:querium/src/Features/HomeFeature/Bloc/model/subjects_category_model.dart';

class SubjectsCategoryController extends GetxController {
  int tapIdSelected = 1;

  void selectTapId(int id) {
    tapIdSelected = id;
    update();
  }

  List<SubjectsCategoryModel> subjectsCategoryCards = [
    const SubjectsCategoryModel(id: 1, label: 'First_Year'),
    const SubjectsCategoryModel(id: 2, label: 'Second_Year'),
    const SubjectsCategoryModel(id: 3, label: 'Third_Year'),
    const SubjectsCategoryModel(id: 4, label: 'Fourth_Year'),
  ];
}
