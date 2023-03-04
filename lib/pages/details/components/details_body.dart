import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_gallery/config/size_config.dart';
import 'package:photo_gallery/controllers/photo_controller.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PhotoController>();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: SizeConfig.screenWidth,
                  height: getProportionateScreenHeight(256),
                  child: CachedNetworkImage(
                    imageUrl: controller.selectetItem.value.url.toString(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
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
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              'Title:',
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
            const SizedBox(
              height: 24,
            ),
            Obx(
              () => Text(controller.selectetItem.value.title.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
