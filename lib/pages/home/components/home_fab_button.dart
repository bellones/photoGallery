import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_gallery/config/constants.dart';
import 'package:photo_gallery/controllers/photo_controller.dart';
import 'package:photo_gallery/pages/favorite/favorite_screen.dart';

class HomeFAButton extends StatelessWidget {
  const HomeFAButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PhotoController>();
    return Obx(() => controller.selectedItemCount.value > 0
        ? FloatingActionButton.extended(
            backgroundColor: kPrimaryColor,
            elevation: 6,
            onPressed: () => {Get.to(() => const FavoriteScreen())},
            label: const Text('See Selected Gallery'),
            icon: const Icon(Icons.photo),
          )
        : Container());
  }
}
