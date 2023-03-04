import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DetailsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
          //replace with our own icon data.
        ),
        title: const Text(
          "Photo's Detail's",
          style: TextStyle(color: Colors.black),
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
