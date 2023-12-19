import 'package:rezult_test/src/domain_models/photo.dart';

abstract class PhotosService{
  Future<List<PhotoDomain>?> get getPhotos;
}