import 'package:get/get.dart';

class PhotoModel {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;
  RxBool? selected;

  PhotoModel(
      {this.albumId,
      this.id,
      this.title,
      this.url,
      this.thumbnailUrl,
      required this.selected});

  PhotoModel.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
    selected = RxBool(false);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['albumId'] = albumId;
    data['id'] = id;
    data['title'] = title;
    data['url'] = url;
    data['thumbnailUrl'] = thumbnailUrl;
    data['selected'] = selected;
    return data;
  }
}
