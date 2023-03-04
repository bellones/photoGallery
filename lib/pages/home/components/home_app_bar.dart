import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_gallery/controllers/photo_controller.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  HomeAppBar({Key? key}) : super(key: key);
  final controller = Get.find<PhotoController>();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Obx(() => controller.selectedItemCount.value > 0
          ? Text(
              '${controller.selectedItemCount} Selected Photos',
              style: const TextStyle(color: Colors.black),
            )
          : const Text(
              'Photo Gallery',
              style: TextStyle(color: Colors.black),
            )),
      actions: [
        Obx(() => controller.selectedItemCount.value > 0
            ? IconButton(
                onPressed: () => {controller.unSelectAll()},
                icon: const Icon(Icons.delete))
            : Container())
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
