import 'package:get_storage/get_storage.dart';
import 'package:querium/src/Features/CustomQuizzesFeature/Bloc/Model/uploaded_file_model.dart';
import 'package:querium/src/Features/CustomQuizzesFeature/Bloc/Repo/uploaded_file_repo.dart';
import 'package:querium/src/core/services/Base/base_controller.dart';
import 'package:querium/src/core/services/Network/network_exceptions.dart';
import 'package:querium/src/core/services/services_locator.dart';
import '../Model/quizzes_category_model.dart';

class QuizzesController extends BaseController<GetUploadedFileRepository> {
  // State variables
  final List<UploadedFile> _uploadedFiles = [];
  int tapIdSelected = 1;

  // Constants
  final List<QuizzesCategoryModel> quizzesCategory = const [
    QuizzesCategoryModel(title: 'All', id: 1),
    QuizzesCategoryModel(title: 'Approved', id: 2),
    QuizzesCategoryModel(title: 'Rejected', id: 3),
    QuizzesCategoryModel(title: 'Pending', id: 4),
  ];

  @override
  GetUploadedFileRepository get repository => sl<GetUploadedFileRepository>();

  @override
  Future<void> onInit() async {
    await getUploadedFiles(tapIdSelected);
    super.onInit();
  }

  // Public getter
  List<UploadedFile> get uploadedFiles => _uploadedFiles;

  Future<void> getUploadedFiles(int fileStatus) async {
    _uploadedFiles.clear();
    reInitPagination();
    showLoading();
    update();

    final result = await repository!.getUploadedFile(
      status: getCurrentCategoryTitle(),
      studentID: sl<GetStorage>().read('studentID'),
    );

    result.when(
      success: (List<UploadedFile> files) {
        incrementPageNumber(files.isNotEmpty);
        _uploadedFiles.addAll(files);
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
    getUploadedFiles(id);
    update();
  }

  String getCurrentCategoryTitle() {
    return quizzesCategory
        .firstWhere(
          (category) => category.id == tapIdSelected,
          orElse: () => quizzesCategory.first,
        )
        .title;
  }
}
