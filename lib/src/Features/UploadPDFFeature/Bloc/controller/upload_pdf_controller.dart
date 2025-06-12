import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class UploadPDFController extends GetxController {
  String? fileName;
  String? fileExtension;
  double? fileSize;

  // Function to pick an image file
  Future<void> pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;

      fileName = file.name;
      fileExtension = file.extension;
      fileSize = file.size / 1024; // Extract the file size in bytes
      update();
    }
  }

  // Function to clear the selected file
  void clearFile() {
    fileName = null;
    fileExtension = null;
    fileSize = null;

    update();
  }
}
