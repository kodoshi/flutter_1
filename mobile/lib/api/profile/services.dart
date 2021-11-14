import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';

import 'package:flutter_1/api/common/services.dart';
import 'package:flutter_1/model/profile.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../exceptions.dart';

abstract class ProfileRepo {
  Future<Profile> getProfile();

  Future<void> updateImage(String image);
}

class ProfileServices implements ProfileRepo {
  static const String _GET_PROFILE = '/user/personal';
  static const String _POST_PROFILE = '/user/picture';

  @override
  Future<Profile> getProfile() async {
    Uri uri = Uri.parse(ApiUrl.url + _GET_PROFILE);
    Response response;

    try {
      response = await http.get(uri);
    } on SocketException catch (e) {
      if (e.osError!.message == "Network is unreachable")
        throw NetworkException();
      else if (e.osError!.message == "Connection refused")
        throw ApiException();
      else
        throw e;
    }

    if (response.statusCode != 200) throw DataException();

    Profile profile;

    try {
      profile = Profile.fromJson(jsonDecode(response.body));
    } on Exception {
      throw DataException();
    }

    return profile;
  }

  @override
  Future<void> updateImage(String image) async {
    Uri uri = Uri.parse(ApiUrl.url + _POST_PROFILE);
    var request = http.MultipartRequest('POST', uri)
      ..headers.addAll({'Content-Type': 'application/json'})
      ..files.add(await http.MultipartFile.fromPath('image', image, contentType: MediaType('image', 'jpeg')));

    var response;

    try {
      response =
          await request.send();
    } on SocketException catch (e) {
      if (e.osError!.message == "Network is unreachable")
        throw NetworkException();
      else if (e.osError!.message == "Connection refused")
        throw ApiException();
      else
        throw e;
    }

    if (response.statusCode != 200) throw DataException();

    return;
  }
}
