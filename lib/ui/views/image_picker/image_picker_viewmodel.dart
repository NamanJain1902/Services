import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

class ImagePickerViewModel extends BaseViewModel {
  File _selectedImage;

  bool get hasSelectedImage => _selectedImage != null;

  File get selectedIamge => _selectedImage;

  Future selectImage({@required bool fromGallery}) async {
    _selectedImage = await runBusyFuture(ImagePicker.pickImage(
        source: fromGallery ? ImageSource.gallery : ImageSource.camera));
  }
}
