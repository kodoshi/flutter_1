import 'dart:async';

import 'package:flutter_1/api/exceptions.dart';
import 'package:flutter_1/api/profile/services.dart';
import 'package:flutter_1/bloc/profile/state.dart';
import 'package:flutter_1/model/profile.dart';

import 'event.dart';

class ProfilesBloc {
  ProfileRepo repository;

  final _profileStateController = StreamController<ProfileState>();

  StreamSink<ProfileState> get _inProfile => _profileStateController.sink;

  Stream<ProfileState> get profile => _profileStateController.stream;

  final _profileEventController = StreamController<ProfileEvent>();

  Sink<ProfileEvent> get profileEventSink => _profileEventController.sink;

  ProfilesBloc({required this.repository}) {
    _profileEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(ProfileEvent event) async {
    _inProfile.add(ProfileLoadingState());

    if (event is ProfileGetEvent) {
      _inProfile.add(await _get(event));
    } else if (event is ProfileUpdateEvent) {
      _inProfile.add(await _update(event));
    }
  }

  Future<ProfileState> _get(ProfileGetEvent event) async {
    try {
      final Profile profile = await repository.getProfile();

      return ProfileLoadedState(profile: profile);
    } on CustomException catch (e) {
      return ProfileErrorState(event: event, title: e.title, message: e.message);
    } on Exception {
      var e = UnknownError();
      return ProfileErrorState(event: event, title: e.title, message: e.message);
    }
  }

  Future<ProfileState> _update(ProfileUpdateEvent event) async {
    try {
      await repository.updateImage(event.image);

      profileEventSink.add(ProfileGetEvent());
      return ProfileUpdatedState();
    } on CustomException catch (e) {
      return ProfileErrorState(event: event, title: e.title, message: e.message);
    } on Exception {
      var e = UnknownError();
      return ProfileErrorState(event: event, title: e.title, message: e.message);
    }
  }

  void dispose() {
    _profileStateController.close();
    _profileEventController.close();
  }
}
