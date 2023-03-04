import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:photo_gallery/config/constants.dart';
import 'package:photo_gallery/models/photo_model.dart';

class PhotoService {
  var _photoRequest = <PhotoModel>[];
  UnmodifiableListView<PhotoModel> get photoRequest =>
      UnmodifiableListView(_photoRequest);

  set photoRequest(List<PhotoModel> list) {
    _photoRequest = list;
  }

  Future<List<PhotoModel>> getPhotos() async {
    try {
      final response = await http.get(Uri.parse(photoUrl));
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        Iterable photoList = jsonDecode(response.body);
        _photoRequest = photoList.map((e) => PhotoModel.fromJson(e)).toList();
      }
      return _photoRequest;
    } catch (e) {
      throw Exception;
    }
  }
}
