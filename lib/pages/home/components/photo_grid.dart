import 'package:flutter/material.dart';
import 'package:photo_gallery/models/photo_model.dart';
import 'package:photo_gallery/pages/home/components/photo_item.dart';

class PhotoGrid extends StatelessWidget {
  const PhotoGrid({
    Key? key,
    required this.list,
    required this.selectPhoto,
    required this.setSelectedItem,
    required this.scrollController,
  }) : super(key: key);
  final List<PhotoModel?> list;
  final void Function(PhotoModel?, bool?) selectPhoto;
  final void Function(PhotoModel?) setSelectedItem;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: scrollController,
        shrinkWrap: true,
        itemCount: list.length,
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          var item = list[index];
          return PhotoItem(
            item: item,
            selectPhoto: selectPhoto,
            setSelectedItem: setSelectedItem,
          );
        });
  }
}
