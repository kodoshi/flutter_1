import 'package:flutter_1/bloc/common/state.dart';
import 'package:flutter_1/model/profile.dart';

import 'event.dart';

abstract class ProfileState {
  const ProfileState();
}

class ProfileInitState extends ProfileState {
  const ProfileInitState();
}

class ProfileLoadingState extends ProfileState {
  const ProfileLoadingState();
}

class ProfileLoadedState extends ProfileState {
  Profile profile;

  ProfileLoadedState({required this.profile});
}

class ProfileUpdatedState extends ProfileState {
  const ProfileUpdatedState();
}

class ProfileErrorState extends ProfileState implements ErrorState {
  final ProfileEvent event;
  final String title;
  final String message;

  const ProfileErrorState({required this.event, required this.title, required this.message});
}
