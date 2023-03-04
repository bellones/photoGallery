import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_gallery/config/size_config.dart';
import 'package:photo_gallery/models/photo_model.dart';

class FavoriteListItem extends StatelessWidget {
  const FavoriteListItem({Key? key, this.item}) : super(key: key);
  final PhotoModel? item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListTile(
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
      ),
    );
  }
}
