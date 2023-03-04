import 'package:flutter/material.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:get/get.dart';
import 'package:photo_gallery/controllers/photo_controller.dart';
import 'package:photo_gallery/pages/favorite/components/favorite_list.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PhotoController>();
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          FutureBuilder(
            future: controller.getSelectedItens(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Column(
                  children: const [
                    ListTileShimmer(),
                    ListTileShimmer(),
                    ListTileShimmer(),
                    ListTileShimmer(),
                    ListTileShimmer(),
                    ListTileShimmer(),
                    ListTileShimmer(),
                    ListTileShimmer(),
                  ],
                );
              }
              return FavoriteList(list: controller.selectedPhotos);
            },
          )
        ],
      ),
    ));
  }
}
