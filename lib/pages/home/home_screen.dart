import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_gallery/config/size_config.dart';
import 'package:photo_gallery/controllers/photo_controller.dart';
import 'package:photo_gallery/pages/home/components/home_fab_button.dart';

import 'components/home_app_bar.dart';
import 'components/home_body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  HomeScreen({Key? key}) : super(key: key);
  final controller = Get.put(PhotoController());
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: HomeAppBar(),
      body: const Body(),
      floatingActionButton: const HomeFAButton(),
    );
  }
}
