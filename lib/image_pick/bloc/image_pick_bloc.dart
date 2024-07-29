import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'image_pick_event.dart';
part 'image_pick_state.dart';

class ImagePickBloc extends Bloc<ImagePickEvent, ImagePickState> {
  ImagePickBloc() : super(ImagePickInitial()) {
    on<ImagePickEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
