import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_gallery/config/constants.dart';
import 'package:photo_gallery/config/size_config.dart';
import 'package:photo_gallery/models/photo_model.dart';

class PhotoItem extends StatelessWidget {
  const PhotoItem(
      {Key? key,
      required this.item,
      required this.selectPhoto,
      required this.setSelectedItem})
      : super(key: key);
  final PhotoModel? item;
  final void Function(PhotoModel?, bool?) selectPhoto;
  final void Function(PhotoModel?) setSelectedItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(getProportionateScreenHeight(8)),
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.all(8),
            child: ListTile(
              onTap: () {
                item?.selected?.value == true
                    ? setSelectedItem(item)
                    : debugPrint('No Item Selected');
              },
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: SizedBox(
                  width: getProportionateScreenHeight(56),
                  height: getProportionateScreenHeight(56),
                  child: CachedNetworkImage(
                    imageUrl: item!.thumbnailUrl.toString(),
                    filterQuality: FilterQuality.none,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              title: Text(
                item!.title.toString(),
                maxLines: 1,
                style: const TextStyle(overflow: TextOverflow.ellipsis),
              ),
              trailing: Checkbox(
                  onChanged: (value) => {selectPhoto(item, value)},
                  value: item?.selected?.value,
                  activeColor: kPrimaryColor),
            ),
          ),
        ));
  }
}
