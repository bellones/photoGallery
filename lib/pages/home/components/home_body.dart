import 'package:flutter/material.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:get/get.dart';
import 'package:photo_gallery/controllers/photo_controller.dart';
import 'package:photo_gallery/pages/home/components/photo_item.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late ScrollController scrollController;
  final controller = Get.find<PhotoController>();
  void loadItens() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      controller.loadData();
    }
  }

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(loadItens);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
        return ListView.builder(
            controller: scrollController,
            shrinkWrap: true,
            itemCount: controller.paggedResult.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              var item = controller.paggedResult[index];
              return PhotoItem(
                item: item,
                selectPhoto: controller.selectPhoto,
                setSelectedItem: controller.setSelectedItem,
              );
            });
      },
    );
  }
}
