part of 'image_pick_bloc.dart';

class ImagePickEvent extends Equatable {
  const ImagePickEvent();

  @override
  List<Object> get props => [];
}

class CameraImage extends ImagePickEvent {}

class GalleryImage extends ImagePickEvent {}
