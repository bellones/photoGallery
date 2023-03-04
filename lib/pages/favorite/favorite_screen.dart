import 'package:flutter/material.dart';
import 'package:photo_gallery/pages/favorite/components/favorite_app_bar.dart';
import 'package:photo_gallery/pages/favorite/components/favorite_body.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);
  static String routeName = "/favorite";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: FavoriteAppBar(),
      body: FavoriteBody(),
    );
  }
}
