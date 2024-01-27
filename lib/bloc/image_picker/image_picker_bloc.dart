import 'package:bloc/bloc.dart';
import 'package:bloc_flutter_tut/bloc/image_picker/image_picker_event.dart';
import 'package:bloc_flutter_tut/bloc/image_picker/image_picker_state.dart';
import 'package:bloc_flutter_tut/utils/image_picker_utils.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()) {
    on<CaptureCamera>(_captureCapture);
    on<ImageGallery>(_galleryImage);
  }

  /// [_captureCapture] get image through camera capture
  void _captureCapture(
    CaptureCamera event,
    Emitter<ImagePickerState> emit,
  ) async {
    final file = await imagePickerUtils.getImageHelper(
      source: ImageSource.camera,
    );
    emit(state.copyWith(file: file));
  }

  /// [_galleryImage] get image through gallery
  void _galleryImage(
    ImageGallery event,
    Emitter<ImagePickerState> emit,
  ) async {
    final file = await imagePickerUtils.getImageHelper(
      source: ImageSource.gallery,
    );
    emit(state.copyWith(file: file));
  }
}
