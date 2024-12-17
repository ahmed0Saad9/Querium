import 'package:get/get.dart';
import 'package:querium/src/Features/HomeFeature/Bloc/model/subjects_category_model.dart';

class SubjectsCategoryController extends GetxController {
  int tapIdSelected = 1;

  void selectTapId(int id) {
    tapIdSelected = id;
    update();
  }

  List<SubjectsCategoryModel> subjectsCategoryCards = [
    const SubjectsCategoryModel(id: 1, label: 'All'),
    const SubjectsCategoryModel(id: 2, label: 'Computer vision'),
    const SubjectsCategoryModel(id: 3, label: 'AI'),
    const SubjectsCategoryModel(id: 4, label: 'Software Engineering 2'),
    const SubjectsCategoryModel(id: 5, label: 'Network Programing'),
  ];
}
