import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:querium/src/Features/QuizzesFeature/Bloc/Model/uploaded_file_model.dart';
import 'package:querium/src/Features/QuizzesFeature/Bloc/Repo/uploaded_file_repo.dart';
import 'package:querium/src/core/services/Base/base_controller.dart';
import 'package:querium/src/core/services/Network/network_exceptions.dart';
import 'package:querium/src/core/services/services_locator.dart';

import '../Model/quizzes_category_model.dart';

class QuizzesController extends BaseController<GetUploadedFileRepository> {
  @override
  // TODO: implement repository
  get repository => sl<GetUploadedFileRepository>();
  @override
  void onInit() async {
    // TODO: implement onInit
    await getUploadedFiles(tapIdSelected);
    super.onInit();
  }

  final List<UploadedFile> _uploadedFiles = [];

  List<UploadedFile> get uploadedFiles => _uploadedFiles;

  Future<void> getUploadedFiles(int fileStatus) async {
    _uploadedFiles.clear();
    reInitPagination();
    showLoading();

    update();

    var result = await repository!.getUploadedFile(
        status: quizzesCategory[tapIdSelected - 1].title,
        studentID: sl<GetStorage>().read('studentID'));

    result.when(success: (List<UploadedFile> uf) {
      incrementPageNumber(uf.isNotEmpty);
      _uploadedFiles.addAll(uf);
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
    getUploadedFiles(id);
    update();
  }

  List<QuizzesCategoryModel> quizzesCategory = [
    const QuizzesCategoryModel(title: 'All', id: 1),
    const QuizzesCategoryModel(title: 'Approved', id: 2),
    const QuizzesCategoryModel(title: 'Rejected', id: 3),
    const QuizzesCategoryModel(title: 'Pending', id: 4),
  ];
}
