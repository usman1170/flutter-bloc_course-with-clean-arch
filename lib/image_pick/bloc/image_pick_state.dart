part of 'image_pick_bloc.dart';

class ImagePickState extends Equatable {
  final XFile? image;
  const ImagePickState({this.image});

  ImagePickState copyWith({XFile? image}) {
    return ImagePickState(image: image ?? this.image);
  }

  @override
  List<Object?> get props => [image];
}
