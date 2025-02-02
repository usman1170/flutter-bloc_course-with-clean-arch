import 'package:bloc/bloc.dart';
import 'package:bloc_course/slider_exp/bloc/slider_event.dart';
import 'package:bloc_course/slider_exp/bloc/slider_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchState()) {
    on<EnabledNotificationEvent>(_switch);
    on<SliderEvent>(_slider);
  }
  void _switch(EnabledNotificationEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _slider(SliderEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(slider: event.slider));
  }
}
