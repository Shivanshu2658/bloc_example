import 'package:bloc/bloc.dart';
import 'package:bloc_counter/bloc/switch_example/switch_events.dart';
import 'package:bloc_counter/bloc/switch_example/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvents, SwitchStates> {

  SwitchBloc() : super(SwitchStates()){
    on<EnableOrDisableNotification>(_enableOrDisableNotification);
    on<SliderEvent>(_slider);
  }

  void _enableOrDisableNotification(EnableOrDisableNotification events, Emitter<SwitchStates> emit){
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }
  void _slider(SliderEvent events, Emitter<SwitchStates> emit){
    emit(state.copyWith(slider: events.slider));
  }
}
