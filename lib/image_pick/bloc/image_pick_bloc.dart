import 'package:bloc/bloc.dart';
import 'package:bloc_course/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'image_pick_event.dart';
part 'image_pick_state.dart';

class ImagePickBloc extends Bloc<ImagePickEvent, ImagePickState> {
  final Utils utils;
  ImagePickBloc(this.utils) : super(const ImagePickState()) {
    on<CameraImage>(cameraImage);
    on<GalleryImage>(galleryImage);
  }
  void cameraImage(CameraImage event, Emitter<ImagePickState> emit) async {
    XFile? file = await utils.cameraImage();
    emit(state.copyWith(image: file));
  }

  void galleryImage(GalleryImage event, Emitter<ImagePickState> emit) async {
    XFile? file = await utils.galleryImage();
    emit(state.copyWith(image: file));
  }
}
