import 'package:image_picker/image_picker.dart';

class Utils {
  final ImagePicker picker = ImagePicker();

  Future<XFile?> cameraImage() async {
    final XFile? file = await picker.pickImage(source: ImageSource.camera);
    return file;
  }

  Future<XFile?> galleryImage() async {
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);
    return file;
  }
}
