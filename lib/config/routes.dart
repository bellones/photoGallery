import 'package:get/get.dart';
import 'package:photo_gallery/pages/home/home_screen.dart';

// We use name route
// All our routes will be available here
final List<GetPage> routes = [
  GetPage(name: HomeScreen.routeName, page: () => HomeScreen()),
];
