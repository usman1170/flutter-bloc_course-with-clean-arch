part of 'image_pick_bloc.dart';

sealed class ImagePickState extends Equatable {
  const ImagePickState();
  
  @override
  List<Object> get props => [];
}

final class ImagePickInitial extends ImagePickState {}
