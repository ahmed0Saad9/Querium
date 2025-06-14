// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:querium/src/Features/QuizzesFeature/Bloc/Model/quizzes_category_model.dart';
// import 'package:querium/src/Features/QuizzesFeature/Bloc/Model/uploaded_file_model.dart';
// import 'package:querium/src/Features/QuizzesFeature/Bloc/Repo/uploaded_file_repo.dart';
// import 'package:querium/src/core/services/Base/base_controller.dart';
// import 'package:querium/src/core/services/Network/network_exceptions.dart';
// import 'package:querium/src/core/services/services_locator.dart';
//
// class QuizzesCategoryController extends BaseController<UploadedFileRepository> {
//   @override
//   // TODO: implement repository
//   get repository => sl<UploadedFileRepository>();
//   @override
//   void onInit() async {
//     // TODO: implement onInit
//     await getUploadedFiles();
//     super.onInit();
//   }
//
//   final List<UploadedFile> _uploadedFiles = [];
//
//   List<UploadedFile> get uploadedFiles => _uploadedFiles;
//
//   Future<void> getUploadedFiles() async {
//     _uploadedFiles.clear();
//     reInitPagination();
//     showLoading();
//
//     update();
//
//     var result = await repository!.getUploadedFile(
//         status: quizzesCategory[tapIdSelected].title,
//         studentID: sl<GetStorage>().read('user_id'));
//
//     result.when(success: (List<UploadedFile> uf) {
//       incrementPageNumber(uf.isNotEmpty);
//       _uploadedFiles.addAll(uf);
//       doneLoading();
//       update();
//     }, failure: (NetworkExceptions error) {
//       errorLoading();
//       status = actionNetworkExceptions(error);
//       update();
//     });
//   }
//
//   int tapIdSelected = 1;
//
//   void selectTapId(int id) {
//     tapIdSelected = id;
//     update();
//   }
//
//   List<QuizzesCategoryModel> quizzesCategory = [
//     QuizzesCategoryModel(title: 'All', id: 1),
//     QuizzesCategoryModel(title: 'Approved', id: 2),
//     QuizzesCategoryModel(title: 'Rejected', id: 3),
//     QuizzesCategoryModel(title: 'Pending', id: 4),
//   ];
// }
