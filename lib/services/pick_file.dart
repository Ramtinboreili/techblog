import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:techblog/controller/file_controller.dart';

FileController fileController = Get.put(FileController());


Future pickFiles() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);

  fileController.file.value =result!.files.first;


}
