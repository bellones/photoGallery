import 'package:flutter/material.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:get/get.dart';
import 'package:photo_gallery/controllers/photo_controller.dart';
import 'package:photo_gallery/pages/home/components/photo_grid.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PhotoController>();
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          FutureBuilder(
            future: controller.getData(),
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
              return PhotoGrid(
                list: controller.photos,
                selectPhoto: controller.selectPhoto,
                setSelectedItem: controller.setSelectedItem,
              );
            },
          )
        ],
      ),
    ));
  }
}
