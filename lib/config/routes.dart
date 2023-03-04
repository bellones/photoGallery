import 'package:get/get.dart';
import 'package:photo_gallery/pages/details/details_screen.dart';
import 'package:photo_gallery/pages/favorite/favorite_screen.dart';
import 'package:photo_gallery/pages/home/home_screen.dart';

// We use name route
// All our routes will be available here
final List<GetPage> routes = [
  GetPage(name: HomeScreen.routeName, page: () => HomeScreen()),
  GetPage(name: DetailsScreen.routeName, page: () => const DetailsScreen()),
  GetPage(name: FavoriteScreen.routeName, page: () => const FavoriteScreen()),
];
