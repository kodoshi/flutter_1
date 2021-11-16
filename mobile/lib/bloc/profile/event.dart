import 'package:flutter_1/bloc/common/event.dart';

/// custom event system
abstract class ProfileEvent extends Event {
  const ProfileEvent();
}

class ProfileGetEvent extends ProfileEvent {
  const ProfileGetEvent();
}

class ProfileUpdateEvent extends ProfileEvent {
  final String image;

  const ProfileUpdateEvent({required this.image});
}
