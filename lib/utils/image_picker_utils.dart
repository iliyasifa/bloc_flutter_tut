import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  final ImagePicker imagePicker = ImagePicker();

  Future<XFile?> getImageHelper({
    required ImageSource source,
  }) async {
    XFile? file;
    file = await imagePicker.pickImage(
      source: source,
    );
    return file;
  }
}
