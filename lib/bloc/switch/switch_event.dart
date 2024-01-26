import 'package:equatable/equatable.dart';

abstract class SwitchEvents extends Equatable {
  const SwitchEvents();

  @override
  List<Object> get props => [];
}

class EnableOrDisableNotificationEvent extends SwitchEvents {
  const EnableOrDisableNotificationEvent();
}

class SliderEvent extends SwitchEvents {
  final double slider;

  const SliderEvent({required this.slider});

  @override
  List<Object> get props => [slider];
}
