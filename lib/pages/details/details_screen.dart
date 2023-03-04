import 'package:flutter/material.dart';
import 'package:photo_gallery/config/size_config.dart';

import 'components/details_app_bar.dart';
import 'components/details_body.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);
  static String routeName = "/details";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: const DetailsAppBar(),
      body: Body(),
    );
  }
}
