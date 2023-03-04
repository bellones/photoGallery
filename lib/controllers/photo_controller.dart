import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_gallery/models/photo_model.dart';
import 'package:photo_gallery/pages/details/details_screen.dart';

import '../services/photo_service.dart';

class PhotoController extends GetxController {
  var selectedItemCount = 0.obs;
  var photos = <PhotoModel>[];
  var selectedPhotos = <PhotoModel>[].obs;
  var selectetItem = PhotoModel(selected: null).obs;

  Future<List<PhotoModel>> getData() async {
    try {
      photos = await PhotoService().getPhotos();
      return photos;
    } catch (e) {
      Get.snackbar(
          'No Data', 'Check if your device has connection to the internet',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black,
          colorText: Colors.white,
          duration: const Duration(seconds: 3));
      throw Exception;
    }
  }

  Future<List<PhotoModel>> getSelectedItens() async {
    var itens =
        photos.where((element) => element.selected?.value == true).toList();

    selectedPhotos.value = itens;
    return selectedPhotos;
  }

  void selectPhoto(PhotoModel? item, bool? select) {
    var selected = photos.firstWhere((element) => element.id == item?.id);
    selected.selected?.value = select!;
    selectedItemCount.value =
        photos.where((element) => element.selected?.value == true).length;
  }

  void unSelectAll() {
    for (PhotoModel item in photos) {
      if (item.selected?.value == true) {
        item.selected?.value = false;
      }
    }
    selectedItemCount.value = 0;
  }

  void setSelectedItem(PhotoModel? item) {
    selectetItem.value = item!;
    Get.to(() => const DetailsScreen());
  }
}
