import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_1/api/profile/services.dart';
import 'package:flutter_1/bloc/common/state.dart';
import 'package:flutter_1/bloc/profile/bloc.dart';
import 'package:flutter_1/bloc/profile/event.dart';
import 'package:flutter_1/bloc/profile/state.dart';
import 'package:flutter_1/utils/globalVars.dart';
import 'package:flutter_1/widget/error/alert_error.dart';
import 'package:flutter_1/widget/footer.dart';
import 'package:flutter_1/widget/profile/language.dart';
import 'package:flutter_1/widget/profile/nightmode.dart';
import 'package:flutter_1/widget/profile/picture.dart';
import 'package:flutter_1/widget/profile/user_information.dart';

/// this page is responsible for showing the personal details of the user,
/// as well as offering some graphical settings, like language switch or dark theme switch
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? photoTaken;
  String? base64Image;
  String? name;
  String? surname;
  String? email;
  final _profileBloc = ProfilesBloc(repository: ProfileServices());

  @override
  void initState() {
    super.initState();
    _profileBloc.profileEventSink.add(ProfileGetEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        leading: BackButton(),
        title: Text(getText('profile').toString()),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: _profileBloc.profile,
          initialData: ProfileInitState(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot.data.toString());
            if (snapshot.data is ProfileLoadedState) {
              ProfileLoadedState data = snapshot.data as ProfileLoadedState;

              return Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Picture(image: data.profile.image, profileBloc: _profileBloc),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  UserInformation(profile: data.profile),
                  SizedBox(
                    height: 20,
                  ),
                  Language(),
                  NightMode(),
                ],
              );
            } else if (snapshot.data is ProfileErrorState) {
              ProfileErrorState error = snapshot.data as ProfileErrorState;
              return AlertError(
                  error: error,
                  callback: (ErrorState error) => _profileBloc.profileEventSink.add(error.event as ProfileEvent));
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      bottomNavigationBar: new Footer(page: "profile"),
    );
  }

  @override
  void dispose() {
    _profileBloc.dispose();
    super.dispose();
  }
}
