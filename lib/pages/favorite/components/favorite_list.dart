import 'package:flutter/material.dart';
import 'package:photo_gallery/models/photo_model.dart';
import 'package:photo_gallery/pages/favorite/components/favorite_list_item.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({Key? key, required this.list}) : super(key: key);
  final List<PhotoModel?> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          var item = list[index];
          return FavoriteListItem(
            item: item,
          );
        });
  }
}
