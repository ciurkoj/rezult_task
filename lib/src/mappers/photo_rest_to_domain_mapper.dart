import 'package:rezult_test/src/domain_models/photo.dart';
import 'package:rezult_test/src/services/rest_models/photo/model/single_photo_rest.dart';

extension PhotRestToDomainMapper on SinglePhotoRest {
  PhotoDomain mapToDomain() => PhotoDomain(
        albumId: albumId,
        id: id,
        title: title,
        urlPhoto: url,
        thumnailPhoto: thumbnail,
      );
}
