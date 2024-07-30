// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable {
  const SwitchEvent();

  @override
  List<Object> get props => [];
}

class EnabledNotificationEvent extends SwitchEvent {}

class SliderEvent extends SwitchEvent {
  double slider;
  SliderEvent({
    required this.slider,
  });

  @override
  List<Object> get props => [slider];
}
